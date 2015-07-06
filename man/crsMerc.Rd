\name{crsMerc}
\alias{crsMerc}
\alias{crsLL}
\title{Web Mercator projection}
\description{
Defines CRS's for the Web Mercator and long-lat projections.
}
\usage{
crsMerc
crsLL
}


\details{
CRS objects for epsg:4326 (long-lat) and epsg:3857 (web Mercator), for use when 
\code{rgdal} is not available.  Some installations of \code{rgdal} are not able
to create epsg:3857.
}


\value{
	Objects of class \code{\link[sp]{CRS}}.
}	

\references{
\url{https://en.wikipedia.org/wiki/Web_Mercator},
\url{http://spatialreference.org/ref/epsg/4326/}
}
\seealso{\code{\link[sp]{CRS}}}

\examples{

crsMerc
try(CRS("+init=epsg:3857"), silent=TRUE)

crsLL
try(CRS("+init=epsg:4326"), silent=TRUE)

if(require('rgdal', quietly=TRUE)){
	xOrig = SpatialPoints(cbind(-40,30), proj4string=crsLL)
	xMerc = spTransform(xOrig, crsMerc)
	xLL = spTransform(xMerc, crsLL)
	
	coordinates(xOrig)
	coordinates(xMerc)
	coordinates(xLL)
}
	
}