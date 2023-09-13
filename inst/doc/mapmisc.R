## ----setup,echo=FALSE,cache=FALSE,results='hide',message=FALSE----------------
library('knitr')
opts_chunk$set(echo=TRUE,message=FALSE,
    dev='png', 
    fig.align='center',fig.pos='ht',width=80,
    fig.height=5,fig.width=3,out.width="0.3\\textwidth",
    dev.args=list(bg='white'), highlight=FALSE
)

knit_hooks$set(source  =function(x, options) {
    x = gsub("\n", "\n+", x)
    x = paste("R>",paste(x, collapse='\nR> '))
x =  paste0(c('\\begin{verbatim}', x, '\\end{verbatim}', ''),
            collapse = '\n')
            x       
})


hook_output <- function(x, options) {
    if (knitr:::output_asis(x, options)) return(x)
    paste0('\\begin{verbatim}\n', x, '\\end{verbatim}\n')
}
knit_hooks$set(output = hook_output)
knit_hooks$set(message = hook_output)

library('mapmisc')


if(!exists('fact'))
  fact = 1
# uncomment for nicer images
# fact = 2 

opts_chunk$set(dpi=72*fact)

## ----meusedata,echo=TRUE------------------------------------------------------
data('netherlands')
meuse = unwrap(meuse)
nldElev = unwrap(nldElev)

## ----meuseProj,echo=TRUE------------------------------------------------------
meuseLL = project(meuse, crsLL)

## ----classElev----------------------------------------------------------------
class(nldElev)
nldElev = crop(nldElev, extend(ext(meuse), 1000))

## ----openmap------------------------------------------------------------------
nldTiles = openmap(meuse)

## ----openmapInfo--------------------------------------------------------------
class(nldTiles)
crs(nldTiles, proj=TRUE)
crs(meuse, proj=TRUE)

## ----cities1------------------------------------------------------------------
nldCities = unwrap(nldCities)

## ----citiesInfo---------------------------------------------------------------
class(nldCities)
names(nldCities)
crs(nldCities, proj=TRUE)

## ----simpleMap,fig.cap="simple map", fig.subcap=c("data locations","cities","elevation")----
# plot the data locations
map.new(meuse)
plot(nldTiles, add=TRUE)
points(meuse,col="red", cex=0.3)
scaleBar(meuse,pos="topleft", bg="white")

# plot city names
map.new(meuse)
plot(nldTiles, add=TRUE)
points(nldCities)
text(nldCities, labels=nldCities$name, pos=3)
scaleBar(meuse,pos="topleft", bg="white")

# plot elevation
map.new(meuse, legendRight=TRUE)
plot(nldTiles, add=TRUE)
plot(nldElev,add=TRUE,col=terrain.colors(8),alpha=0.6,legend.mar=2, legend.line=0)
scaleBar(meuse,pos="topleft",bg="white")


## ----meuseScale---------------------------------------------------------------
cuScale = colourScale(meuse$copper, breaks=5, style='equal', 
    opacity=0.8, dec=-1, firstBreak=0)

## ----elevScale----------------------------------------------------------------
elevScale = colourScale(nldElev, style='equal',
    breaks=6, col=terrain.colors,
    firstBreak=0, dec=-1,opacity=c(0.2, 0.9))

## ----soilScale----------------------------------------------------------------
soilScale = colourScale(meuse$soil, col="Set2")

## ----meuseLegends,fig.subcap=c("Copper","soil", "elevation"), fig.cap="Meuse data again"----
map.new(meuse)
plot(nldTiles, add=TRUE)
plot(meuse, col=cuScale$plot,add=TRUE,pch=16)
legendBreaks("bottomright",  breaks=cuScale,
    title="gals/firkin")


map.new(meuse)
plot(nldTiles, add=TRUE)
plot(meuse, col=soilScale$plot,add=TRUE,pch=16)
legendBreaks("bottomright", breaks=soilScale,
    title="soil type", cex=0.7,bg="white")

map.new(meuse)
plot(nldTiles, add=TRUE)
plot(nldElev, breaks=elevScale$breaks, col=elevScale$colOpacity, 
    legend=FALSE,add=TRUE)
legendBreaks("left", breaks=elevScale, title='Metres',bg="white")

## ----reproj,echo=TRUE---------------------------------------------------------
  meuseRot = project(meuse, omerc(meuse, -50))
  tilesRot = openmap(meuseRot, fact=2)
  elevRot = project(nldElev, crs(meuseRot))
  nldCitiesRot = project(nldCities, crs(meuseRot))

## ----rotatedMap,fig.cap="Rotated map", fig.subcap=c("elevation","data"), fig.height=3,fig.width=4,out.width="0.48\\textwidth"----


# first elevation
map.new(meuseRot)
plot(tilesRot, add=TRUE)
plot(elevRot,add=TRUE,alpha=0.5,col=terrain.colors(8), legend=FALSE)
points(nldCitiesRot)
text(nldCitiesRot, labels=nldCitiesRot$name, pos=3)

scaleBar(meuseRot,pos="topleft", bg="white")


# then data locations
map.new(meuseRot)
plot(tilesRot, add=TRUE)
points(meuseRot,col="red", cex=0.3)

scaleBar(meuseRot, bg="white")

## ----world--------------------------------------------------------------------
world = openmap(
    rast(ext(-10,30,40,60),crs=crsLL),
    crs=crsMerc,
    path="osm")

## ----inset,fig.cap="Inset map", fig.subcap=c("elevation","rotated"), fig.height=3,fig.width=4,out.width="0.48\\textwidth"----

# not rotated
map.new(meuse,legendRight=TRUE)
plot(nldTiles, add=TRUE)
points(meuse)

  scaleBar(meuse,pos="bottomright", bg="white")
  insetMap(crs=meuse, pos="topright",map=world)


# rotated
map.new(meuseRot)
plot(tilesRot, add=TRUE)
points(meuseRot,col="red", cex=0.3)


  scaleBar(meuseRot, bg="white")
  insetMap(meuseRot, "bottomleft",map=world)


