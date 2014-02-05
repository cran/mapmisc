insetMap = function(crs, pos="bottomright",map="osm",zoom=0, 
		width=0.2, col="#FF000090", borderSmall=NA, borderBig=NULL,
		cropInset = extent(-170,xmax=170, ymin=-65, ymax=75),
		outer=TRUE) {

crsLL = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0") 
	
	
fromEdge = matrix(par("plt"), 2, 2, 
		dimnames=list(c("min","max"), c("x","y")))
extentUsr = matrix(par("usr"),2,2, dimnames=dimnames(fromEdge))
dimUsr = abs(apply(extentUsr, 2, diff))
fracUsr = abs(apply(fromEdge, 2, diff))
dimFull = dimUsr/fracUsr

extentFull = extentUsr
extentFull[1,] = extentFull[1,] - dimFull*fromEdge[1,]
extentFull[2,] = extentFull[2,] + dimFull*(1-fromEdge[2,])



if(outer) {
	extentBig = extentFull
}

extentSmall = try(extent(crs), silent=TRUE)

if(class(extentSmall)=="try-error")
	extentSmall = extentBig
	
if(is.character(crs))
			crs = CRS(crs)
if(class(crs) != "CRS")
	crs = CRS(proj4string(crs))


bboxSmall = t(bbox(extentSmall))

xseq = seq(bboxSmall[1,1], bboxSmall[2,1],len=20)
yseq = seq(bboxSmall[1,2], bboxSmall[2,2],len=20)

polySmall = cbind( 
		c(xseq, rep(bboxSmall[2,1], length(yseq)), 
			rev(xseq), rep(bboxSmall[1,1], length(yseq))), 
		c(rep(bboxSmall[1,2], length(xseq)), yseq,
				rep(bboxSmall[2,2], length(xseq)), rev(yseq)
				)
)


xsp = SpatialPoints(polySmall, 	proj4string = crs)



if(is.character(map)) {
	map = openmap(xsp, path=map, zoom=zoom,crs=crsLL )
}
crsCrop = try(CRS(proj4string(cropInset)),silent=TRUE)
if(class(crsCrop)=="try-error")
	crsCrop = crsLL
tocrop = t(bbox(extent(cropInset)))
tocrop = SpatialPoints(tocrop,
		proj4string=crsCrop)
tocrop = spTransform(tocrop, CRSobj=CRS(proj4string(map)))
map = crop(map, extent(tocrop))


xpoints = t(bbox(extentBig))


boxsize = abs(apply(xpoints, 2, diff))	
oldinsetbox = t(bbox(map))
oldrange = apply(oldinsetbox, 2, diff)
newxrange = boxsize[1]*width
newyrange = newxrange * oldrange[2]/oldrange[1]


	if(is.character(pos)) {
x = apply(xpoints, 2, mean) - 0.5*c(newxrange, newyrange)

if(length(grep("^top",pos)))
	x[2] = xpoints[2,2]-newyrange
if(length(grep("^bottom",pos)))
	x[2] = xpoints[1,2]
if(length(grep("right$",pos)))
	x[1] = xpoints[2,1]-newxrange
if(length(grep("left$",pos)))
	x[1] = xpoints[1,1]
} else x=pos




mapOrig = map
extent(map)= extent(c(x[1], x[1]+newxrange, x[2], 
				x[2]+newyrange))
proj4string(map) = CRS(NA)
bbOrig = t(bbox(extent(mapOrig)))
bbSmall = t(bbox(extent(map)))


 

xsp = spTransform(xsp, 
		CRSobj=CRS(proj4string(mapOrig)))

 


scale =  apply(bbSmall, 2, diff)/ apply(bbOrig, 2, diff)

N = length(xsp)
xsp = coordinates(xsp)



xsp = (xsp - bbOrig[rep(1,N),]) * matrix(scale, N, 2, byrow=TRUE) + 
		bbSmall[rep(1,N),]


if(outer) {
	oldxpd = par("xpd")
	par(xpd=TRUE)
}
if(nlayers(map)==3) {
 plotRGB(map, add=TRUE)
} else {
	plot(map, add=TRUE)
}
bigpoly = t(bbox(map))
bigpoly = cbind(bigpoly[c(1,2,2,1),1], bigpoly[c(1,1,2,2),2])
polygon(bigpoly,border=borderBig)
 
delta=0.3
theX = anX = c(-delta + delta*1i, -delta + 1i, delta+1i, delta + delta*1i)
for(D in 1:3)
	theX = c(theX, anX*exp(-D*2*pi*1i/4))
theX = theX*exp(-2*pi*1i/8)

if( (diff(range(xsp[,1])))  < (width*dimFull[1]/20) ) {	
	
	polygon((1.5*width*dimFull[1]/20) * theX +
					mean(xsp[,1])+1i*mean(xsp[,2]), col=col,border=NA)
} else {
	polygon(xsp, col=col,border=borderSmall)
}

if(outer) {
	par(xpd=oldxpd)
}	

return(invisible(mapOrig))
}