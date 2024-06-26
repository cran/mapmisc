## ----setup, include=FALSE-----------------------------------------------------
library('mapmisc')

if(!exists('mapmiscCachePath'))
  mapmiscCachePath = tempdir()

if(!exists('mapmiscCacheReadOnly'))
  mapmiscCacheReadOnly = FALSE

if(!exists('fact'))
  fact = 1
# uncomment for nicer images
# fact = 2 

if(!exists('testing'))
  testing=FALSE

options(
  mapmiscCachePath = mapmiscCachePath,
  mapmiscCacheReadOnly = mapmiscCacheReadOnly
  )

knitr::opts_chunk$set(dpi=72*fact,dev.args=list(bg='white'), out.width='55%')	

## ----data---------------------------------------------------------------------
coords = rbind(Alert = c(-62.338889, 82.501389),
  Qaanaaq = c(-69.238685,77.466335), 	
  'Alex Fjord' = c(-75.999722, 78.9),
  'Hans island' = c(-66.459722, 80.828056)
)
x = vect(coords, 
  atts=data.frame(name=rownames(coords)),
  crs=crsLL)
data('worldMap')
worldMap = unwrap(worldMap)

## ----osm----------------------------------------------------------------------
map = openmap(x, path='osm', verbose=TRUE,
    maxTiles=12, buffer=c(30,3), fact=fact)
  
map.new(map)
plot(map,add=TRUE)
points(x)
text(x, label=x$name, pos=4)
scaleBar(x, 'bottom')
scaleBar(x, 'left', seg.len=0, bty='n')

## ----mapquest-----------------------------------------------------------------
  mapSat = openmap(x, path='opentopomap', maxTiles=4, buffer=c(30,3), fact=fact)
  map.new(mapSat)
  plot(mapSat,add=TRUE)
  points(x)
  text(x, label=x$name, pos=4)
  scaleBar(x, 'bottom')
  scaleBar(x, 'left', seg.len=0, bty='n')

## ----satellite----------------------------------------------------------------
  mapSat = openmap(x=x[x$name=='Hans island',], 
    path='esri-satellite', fact=fact,  
    buffer=c(8,6,1,1.5), zoom=5)
  
  map.new(mapSat)
  plot(mapSat,add=TRUE)
  points(x, pch=1, col='red', cex=2)
  text(x, label=x$name, pos=4)
  scaleBar(x, 'bottomright')

## ----omerc--------------------------------------------------------------------
  omercCrs = omerc(x)
  xMerc = project(x, omercCrs)
  mapMerc = openmap(xMerc, path='opentopomap',
    zoom=3, fact=fact,
    buffer=c(3,2)*100*1000)
  
  map.new(mapMerc)
  plot(mapMerc,add=TRUE)
  points(xMerc)
  plot(wrapPoly(worldMap, omercCrs), add=TRUE)
  text(xMerc, label=xMerc$name, pos=4, halo=TRUE)
  scaleBar(xMerc, 'bottom', bty='n')
  scaleBar(xMerc, 'left', seg.len=0, bty='n')

## ----hansisland---------------------------------------------------------------
map = openmap(xMerc[grep("Hans", xMerc$name),],     
    path='opentopomap', fact=fact,
    buffer=500, verbose=TRUE)   
map.new(map)
plot(map, add=TRUE)
points(xMerc, pch=4, col='red', cex=2)
text(xMerc, label=xMerc$name, pos=1, col='red', halo=TRUE)
scaleBar(xMerc, 'bottomleft')

## ----nrcanAlex----------------------------------------------------------------
  map = openmap(x[x$name=='Alex Fjord',], 		
    path='opentopomap', zoom=4, fact=fact, 
    buffer=c(5,7,2,1.5), verbose=TRUE)   
  map.new(map)
  plot(map, add=TRUE)
  points(x, pch=4, col='red', cex=2)
  text(x, label=x$name, pos=1, col='red', halo=TRUE)
  scaleBar(x, 'bottomleft')

## ----arcticCRS----------------------------------------------------------------
  crsA = crs("+init=epsg:3573")
  theBox = llCropBox(crsA, buffer.width=100*1000,  crop.distance = 5e7, crop.poles = FALSE, crop.leftright=TRUE, remove.holes=TRUE, cycles=4)
  attributes(crsA)[names(theBox)] = theBox

  x2 = project(x, crsA)
  map = openmap(x2,     
    path='opentopomap', zoom=3, fact=fact, 
    buffer=c(5,7,3,7)*100*1000)   
  map.new(map)
  plot(map, add=TRUE)
  plot(wrapPoly(worldMap, crsA), add=TRUE)
  gridlinesWrap(crsA,norths = seq(70,90,by=5), easts=0)
  points(x2, pch=4, col='red', cex=2)
  text(x2, label=x2$name, pos=1, col='red', halo=TRUE)
  scaleBar(crsA, 'topleft', bty='n')
  scaleBar(crsA, 'bottomright', bty='n')

## ----southData----------------------------------------------------------------
waterhouseLL = vect(
  cbind(x=178.7729285, y=-49.6941201), 
  crs=crsLL)

rockLL = vect(
  cbind(x=178.78542, y=-49.70003), 
  crs=crsLL)



waterhouseMerc <- project(waterhouseLL, crsMerc)
  
  
rockMerc = project(rockLL, crsMerc)

## ----southInset---------------------------------------------------------------
  mollWaterhouse = moll(waterhouseMerc, angle=45, flip=TRUE)
  waterhouseWrap = project(waterhouseMerc, mollWaterhouse)
  
  southInset = openmap(x=waterhouseWrap, 
    path='osm', zoom = 3, fact=2,#fact, 
    buffer=c(0.8, 0.2,0.4, 0.6)*1000*1000, verbose=TRUE)#c(4,1,2,1)*1)

## ----waterhouseMerc-----------------------------------------------------------
mapMerc = openmap(waterhouseMerc, buffer=4000)

map.new(mapMerc)
plot(mapMerc, add=TRUE)
points(waterhouseMerc, col='blue', cex=5, pch=1)
# fix
insetMap(crs=mapMerc, 
  pos='bottomright', 
  map=southInset, cropInset = NULL)
#scaleBar(crs=mapMerc,  seg.len=35, pos='center')
sRes = scaleBar(mapMerc, 'bottomleft', cex=1.5, bty='n', outer=FALSE, inset=0.1)

# check if scale bar appears off
scaleCentre = vect(
  cbind(Re(sRes$out$textxy), Im(sRes$out$textxy)), 
  crs=crs(mapMerc))

  scaleCentreLL = project(
    scaleCentre, 
    crsLL
  )	
  circle = vect(
    geosphere::destPoint(
      crds(scaleCentreLL),
      seq(0,360,len=100),
      1000
    ),
    crs = crsLL)
  circle = project(circle, crs(mapMerc))
  points(circle, cex=0.3, col='red')


## ----rockMerc-----------------------------------------------------------------
mapMercFine = openmap(rockMerc, buffer=50, crs=crsMerc,zoom=19, verbose=TRUE)

map.new(mapMercFine)
plot(mapMercFine, add=TRUE)
points(rockMerc, col='blue')
insetMap(crs=mapMercFine, 
  pos='bottomright', 
  map=mapMerc, 
  lty=0,cropInset=NULL)
scaleBar(mapMercFine, 'bottomleft', inset=0.1)

## ----waterhouseLL-------------------------------------------------------------
  mapLL = openmap(waterhouseLL, buffer=0.02, fact=2)
  map.new(mapLL)
  plot(mapLL, add=TRUE, maxpixels = 10^6)
  points(waterhouseLL, pch=3, cex=5)
  insetMap(crs=mapLL, 
    pos='bottomright', 
    map=southInset, cropInset = NULL,
    lty=0)
  scaleBar(mapLL, 'bottomleft')

## ----rockLL-------------------------------------------------------------------
  mapLLfine = openmap(rockLL, zoom=19, fact=2, buffer=3e-4,verbose=TRUE)  
  map.new(mapLLfine)
  plot(mapLLfine, add=TRUE)	
  points(rockLL, col='blue', pch=3, cex=5)
  scaleBar(mapLL, 'bottomleft')

