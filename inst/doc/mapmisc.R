
## ----setup,echo=FALSE,cache=FALSE,results='hide',message=FALSE-----------
library('knitr')
opts_chunk$set(echo=TRUE,message=FALSE,
		dev='png', 
		fig.align='center',fig.pos='H',width=80,
		fig.height=5,fig.width=3,out.width="0.3\\textwidth"
)
par(bg="white")
library('mapmisc')
library('rgdal')


## ----meusedata,echo=TRUE-------------------------------------------------
library('sp')
library('rgdal')
data('meuse')
coordinates(meuse) <- ~x+y
proj4string(meuse) <- CRS("+init=epsg:28992")
class(meuse)


## ----elevation,eval=FALSE------------------------------------------------
## meuseLL = spTransform(meuse, CRS("+init=epsg:4326"))
## library('raster')
## getData("SRTM", lon=xmin(extent(meuseLL)),
## 	lat=ymin(extent(meuseLL)),path=tempdir())
## nldElev = raster(paste(tempdir(), "/", "srtm_38_02.tif", sep=""))
## nldElev = crop(nldElev, extent(meuseLL))
## nldElev = projectRaster(nldElev, crs=proj4string(meuse))


## ----dataneth------------------------------------------------------------
library('mapmisc')
data('netherlands')


## ----classElev-----------------------------------------------------------
class(nldElev)
nldElev = crop(nldElev, extend(extent(meuse), 1000))


## ----openmap,eval=FALSE--------------------------------------------------
## library('mapmisc')
## nldTiles = openmap(meuse)


## ----openmapInfo---------------------------------------------------------
class(nldTiles)
proj4string(nldTiles)
proj4string(meuse)


## ----cities,eval=FALSE---------------------------------------------------
## nldCities = GNcities(meuse, maxRows=6)


## ----citiesInfo----------------------------------------------------------
class(nldCities)
names(nldCities)
proj4string(nldCities)


## ----simpleMap,fig.cap="simple map", fig.subcap=c("data locations","cities","elevation")----

# plot the data locations
map.new(meuse)
plot(nldTiles, add=TRUE)
points(meuse,col="red", cex=0.3)
scaleBar(proj4string(meuse),pos="topleft", bg="white")

# plot city names
map.new(meuse)
plot(nldTiles, add=TRUE)
points(nldCities)
text(nldCities, labels=nldCities$name, pos=3)
scaleBar(proj4string(meuse),pos="topleft", bg="white")

# plot elevation
map.new(meuse, legendRight=TRUE)
plot(nldTiles, add=TRUE)
plot(nldElev,add=TRUE,col=terrain.colors(8),alpha=0.6,legend.mar=2, legend.line=0,)
scaleBar(meuse,pos="topleft",bg="white")


## ----reproj,cache=TRUE---------------------------------------------------
rotatedCRS = CRS("+proj=omerc +lat_0=51 +lonc=5.75 +alpha=-50.0000000 +gamma=0.0 +k=1.000000 +x_0=500000.000 +y_0=0.000 +ellps=WGS84	+units=m")
meuseRot = spTransform(meuse, rotatedCRS)
tilesRot = projectRaster(nldTiles, crs=rotatedCRS, method='ngb')
tilesRot@legend@colortable = nldTiles@legend@colortable
elevRot = projectRaster(nldElev, crs=rotatedCRS)


## ----rotatedMap,fig.cap="Rotated map", fig.subcap=c("elevation","data"), fig.height=3,fig.width=4,out.width="0.48\\textwidth"----
# first elevation
map.new(meuseRot)
plot(tilesRot, add=TRUE)
plot(elevRot,add=TRUE,alpha=0.5,col=terrain.colors(8), legend=FALSE)
points(nldCities)
text(nldCities, labels=nldCities$name, pos=3)
scaleBar(meuseRot,pos="topleft", bg="white")

# then data locations
map.new(meuseRot)
plot(tilesRot, add=TRUE)
points(meuseRot,col="red", cex=0.3)
scaleBar(proj4string(meuseRot), bg="white")


## ----world,eval=FALSE----------------------------------------------------
## world = openmap(extent(-10,30,40,60),path="osm-no-labels")


## ----inset,fig.cap="Inset map", fig.subcap=c("elevation","rotated"), fig.height=3,fig.width=4,out.width="0.48\\textwidth"----

# not rotated
map.new(meuse,legendRight=TRUE)
plot(nldTiles, add=TRUE)
points(meuse)
scaleBar(proj4string(meuse),pos="bottomright", bg="white")
insetMap(meuse, "topright",map=world)


# rotated
map.new(meuseRot)
plot(tilesRot, add=TRUE)
points(meuseRot,col="red", cex=0.3)
scaleBar(proj4string(meuseRot), bg="white")
insetMap(meuseRot, "bottomleft",map=world)


## ----meuseScale----------------------------------------------------------
cuScale = colourScale(meuse$copper, breaks=5, style='equal', 
		opacity=0.8, dec=-1, firstBreak=0)


## ----elevScale-----------------------------------------------------------
elevScale = colourScale(nldElev, style='equal',
		breaks=6, col=terrain.colors,
		firstBreak=0, dec=-1,opacity=c(0.2, 0.9))


## ----soilScale-----------------------------------------------------------
meuse$soilFac = factor(meuse$soil, levels=c(1,2,3), 
		labels=c("Calcareous","Non-Calc's","Red Brick"))
soilScale = colourScale(meuse$soilFac, col="Set2")


## ----meuseLegends,fig.subcap=c("Copper","soil", "elevation"), fig.cap="Meuse data again"----
map.new(meuse)
plot(nldTiles, add=TRUE)
plot(meuse, col=cuScale$plot,add=TRUE,pch=16)
scaleBar(meuse, pos="topleft",bg="white")
legendBreaks("bottomright",  breaks=cuScale,
		title="gals/firkin")


map.new(meuse)
plot(nldTiles, add=TRUE)
plot(meuse, col=soilScale$plot,add=TRUE,pch=16)
scaleBar(meuse, pos="topleft",bg="white")
legendBreaks("bottomright", breaks=soilScale,
		title="soil type", cex=0.7,bg="white")

map.new(meuse)
plot(nldTiles, add=TRUE)
image(nldElev, breaks=elevScale$breaks, col=elevScale$colOpacity, 
		legend=FALSE,add=TRUE)
scaleBar(meuse, pos="topleft",bg="white")
legendBreaks("left", breaks=elevScale, title='Metres',bg="white")


