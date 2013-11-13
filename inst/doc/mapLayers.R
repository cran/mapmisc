
## ----setup,echo=FALSE,cache=TRUE,warning=FALSE,results='hide',message=FALSE----
library(knitr)
knit_hooks$set(
				dev.args=list(res=36,bg='white')
)


library(mapmisc)
theNames = names(osmTiles())
 

africaExtent = c(15, 25)
africaTiles = openmap(africaExtent, path=theNames,zoom=2)

trafalgarSquare=c(-0.128056,51.508056)
londonTiles = openmap(trafalgarSquare,zoom=12,path=theNames)


## ----someTiles,dev='png', out.width="\\textwidth",echo=FALSE,results='asis',fig.height=5,fig.width=7----

mytiles = list(africaTiles, londonTiles)

for(D in theNames){
	Dsub = gsub("-",".", D)

	threeTiles = length(
			grep(paste("^", Dsub, 
							"([rR]ed|[gG]reen|[bB]lue)$", 
							sep=""), 
			names(mytiles[[1]]))
		)>0 | 	length(
				grep(paste("^", Dsub, 
								"([rR]ed|[gG]reen|[bB]lue)$", 
								sep=""), 
						names(mytiles[[2]]))
		)>0

	

	cat("\n\\section[",D,"]{{\\tt plot","RGB"[threeTiles], 
			"(openmap(x,path=\"", D, "\"))}}\n",sep="")
	cat("\n\\label{", D, "}\n",sep="")
	
	cat("\n\\begin{tabular}{ccc}\n")
	cat("\n\\begin{minipage}{0.3\\textwidth}\n")
	
	
	for(Dplot in 1:length(mytiles)) {
		oneTile = grep(paste("^", Dsub, "$", sep=""), names(mytiles[[Dplot]]))
		threeTiles = grep(paste("^", Dsub, "([rR]ed|[gG]reen|[bB]lue)$", sep=""), 
				names(mytiles[[Dplot]]))
		if(length(threeTiles)==3) {

		plotRGB(mytiles[[Dplot]][[threeTiles]])
		
	
	} else if (length(oneTile)==1){
		map.new(mytiles[[Dplot]][[oneTile]])
		plot(mytiles[[Dplot]][[oneTile]],add=TRUE)

	} else {

		plot.new()
		text(0.5, 0.8, paste(D, "is\n not currently\navailable"))

		
	}
	cat("\n\\end{minipage}&\\begin{minipage}{0.3\\textwidth}\n")
	
	}
	cat("\n\\end{minipage}\n")
	cat("\n\\end{tabular}\n")
	
	
}



