options("rgdal_show_exportToProj4_warnings"="none") 
library('mapmisc')
data('netherlands')


if(require('rgdal', quietly=TRUE)) {
x=nldCities
xbox = as(extent(nldCities), 'SpatialPolygons')
xbox@proj4string= nldCities@proj4string

bob=function(angle, ...){
  y = spTransform(x, omerc(x, angle, ...))
  nld2 = spTransform(xbox, y@proj4string)
  map.new(nld2)
  abline(v=0, col='grey')
  abline(h=0, col='grey')
  plot(nld2,add=TRUE, lwd=2, lty=3)
  plot(extent(y), add=TRUE, col='orange')
  plot(y,cex=0.2, col='red',add=TRUE)
  text(y,labels=y$name, cex=0.5, col=col2html('blue',0.4))
   mtext(paste(angle,collapse=' '),side=3,outer=FALSE,line=-1)
   mtext(paste(strwrap(projection(y),50), collapse='\n'),side=1,
       outer=FALSE,line=-2, cex=0.6)
   scaleBar(y,'topright')
   return(invisible(y@proj4string))
  
 }


}

if(!interactive())
  pdf("omerc.pdf")

  par(mfrow=c(3,3))
  if(require('rgdal', quietly=TRUE)) {

  	bob(0)
  
  bob(89)
  
  bob(45)
  
  bob(-45)

  bob(180-45)

  
  bob(-180-45, post=-45)
  
  bob(45, post='north')
  bob(45, post='wide')
  bob(45, post='tall')
}
  
  


par(mfrow=c(3,2))
  if(require('rgdal', quietly=TRUE)) {
  bob((-10):10)
  
  bob(seq(-170,-190))
  
  bob((-10):10, post='north')
  bob((-10):10, post='wide')
  bob((-10):10, post='long')
  
  bob((-10):10, post=90)
}

N = 12
somePoints = SpatialPointsDataFrame(
    cbind(runif(N,-5,40), runif(N,40,70)),
    data=data.frame(name=1:N),
    proj4string=mapmisc::crsLL
    )
    x=somePoints
    xbox = as(extent(somePoints), 'SpatialPolygons')
    xbox@proj4string = x@proj4string
 
  par(mfrow=c(3,2))
  
  if(require('rgdal', quietly=TRUE)) {
  
  bob((-10):10, preserve=x, post=10)
  bob((-10):10, preserve=x, post='none')
  
  bob(seq(-170,-190), preserve=x)
  
  scaleBar(bob((-10):10, preserve=x, post='north'), c(0,0), seg.len=0)

  
  scaleBar(bob((-10):10, preserve=x, post='tall'), c(0,0), seg.len=0)
  
  scaleBar(bob((-10):10, preserve=x, post='wide'), c(0,0), seg.len=0)
  
}

if(!interactive())   dev.off()

