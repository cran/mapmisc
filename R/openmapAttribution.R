
esriAttribution = function(name) {
  
  #'http://downloads2.esri.com/ArcGISOnline/docs/tou_summary.pdf'
  
  long=list(
      'esri'='Esri, HERE, DeLorme, USGS, Intermap, increment P Corp., NRCAN, Esri Japan, METI, Esri China (Hong Kong), Esri (Thailand), TomTom, MapmyIndia, copyright OpenStreetMap contributors, and the GIS User Community',
      'esri-grey' = 'Esri, HERE, DeLorme, MapmyIndia, copyright OpenStreetMap contributors, and the GIS user community',
      'esri-topo' = 'Esri, HERE, DeLorme, TomTom, Intermap, increment P Corp., GEBCO, USGS, FAO, NPS, NRCAN, GeoBase, IGN, Kadaster NL, Ordnance Survey, Esri Japan, METI, Esri China (Hong Kong), swisstopo, MapmyIndia, copyright OpenStreetMap contributors, and the GIS User Community',
      'esri-transport' = 'Esri, HERE, DeLorme, MapmyIndia, copyright OpenStreetMap contributors',
      'esri-satellite' = 'Esri, Earthstar Geographics and others',
      'esri-natgeo'=  'Esri, National Geographic and others',
      'esri-overlay' = 'Esri'
  )
  
  short = 'Esri and others'
  
  if(!length(grep("^http", name))){
    name = gsub("esri\\.", "esri-", name)
    if(! all(name %in% names(long))){
      warning('name not an esri tile', name)
      return(list())
    }
    name = osmTiles(name)
  }
  
  if(! all(names(name) %in% names(long))){
    warning('name not an esri tile', names(name))
    return(list())
  }
  
  if(!length(grep("esri", names(name)))){
    return(list()) 
  }
  
  weburl = gsub("/tile/?$", '', name)
  
  
  
  
  long = long[names(name)]
  
  list(long=list(
          latex=paste(
              gsub("copyright", "\\\\copyright", long), 
              ' see \\href{',weburl,
              '}{arcgisonline.com}.',
              sep=''
          ),
          markdown=paste(
              gsub("copyright", '&copy;', long), 
              ' see [arcgisonline.com](',
              weburl, ').',
              sep=''
          ),
          html=paste(
              gsub("copyright", '&copy;', long), 
              ' see <a href=\"',
              weburl,
              '\">arcgisonline.com</a>',
              sep=''
          ),
          text =paste(
              long, 
              ' see arcgisonline.com',
              sep=''
          )
      ),
      short=list(
          latex = paste('\\copyright \\href{', weburl,
              '}{', short,'}',sep=''),
          markdown = paste('&copy;','[', short,'](',
              weburl, ')',sep=''),
          html = paste('&copy; <a href=\"', weburl, 
              '\">', short , '</a>',sep=''),
          text=paste('copyright', short)
      )
  )
  
}

openmapAttribution = function(name, type=c('text','latex','markdown','html','auto'), short=FALSE) {
  
  type = type[1]
  if(type == 'auto') {
    if(all(unlist(mget("mdToTex", as.environment(1), ifnotfound=FALSE)) == TRUE ) ) {
      type = 'latex'  
    } else {
      type ='markdown'
    }
  }


  if(!is.null(attributes(name)$openmap) ){
        name = attributes(name)$openmap$path
  } else if(!is.character(name)) {
        name = names(name)[1]
  }


odl = list(
    latex=paste(
        'Data by \\href{http://openstreetmap.org}{OpenStreetMap}',
        ' available under the',
        '\\href{http://opendatacommons.org/licenses/odbl}{Open Database License}'
    ),
    markdown=paste(
        'Data by [OpenStreetMap](http://openstreetmap.org) available under the',
        '[Open Database License](http://opendatacommons.org/licenses/odbl)'
    ),
    html=paste(
        'Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,',
        ' available under the',
        '<a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>'
    ),
    text='Data by OpenStreetMap.org available under the Open Database License (opendatacommons.org/licenses/odbl)'
)


# openstreetmap.org
osm = list(long=list(
        latex=paste(
            ', cartography is licensed as ',
            '\\href{http://creativecommons.org/licenses/by-sa/2.0}{CC BY-SA}.',
            sep=''
        ),
        markdown=paste(
            ', cartography is licensed as [CC BY-SA](http://creativecommons.org/licenses/by-sa/2.0).',
            sep=''
        ),
        html=paste(
            ', cartography is licensed as',
            ' <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>.',
            sep=''
        ),
        text =paste(
            ', cartography is licensed as CC BY-SA (see www.openstreetmap.org/copyright).',
            sep=''
        )
    ),
    short=list(
        latex='\\copyright \\href{http://openstreetmap.org/copyright}{OpenStreetMap}',
        markdown='&copy; [OpenStreetMap](http://openstreetmap.org/copyright)',
        html= '&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a>',
        text='copyright OpenStreetMap.org'
    )
)

sputnik = list(
    long=list(
        latex='\\href{http://corp.sputnik.ru/maps}{corp.sputnik.ru/maps}',
        markdown='[corp.sputnik.ru/maps](http://corp.sputnik.ru/maps)',
        html=' <a href="http://corp.sputnik.ru/maps">corp.sputnik.ru/maps</a>.',
        text ='http://corp.sputnik.ru/maps'
    )       
)
sputnik$short = sputnik$long

# open govt licence canada
nrcan = list(long=list(
        latex=paste(
            'Cartography by \\href{http://www.nrcan.gc.ca/earth-sciences/geography/topographic-information/free-data-geogratis/geogratis-web-services/17216}',
            '{The Canada Base Map --- Transportation (CBMT) web mapping services',
            ' of the Earth Sciences Sector (ESS) at Natural Resources Canada (NRCan)}',
            ' licensed as the ',
            '\\href{http://open.canada.ca/en/open-government-licence-canada}',
            '{Open Government Licence --- Canada}.',
            sep=''
        ),
        markdown=
            paste(
                'Cartography by ',
                '[The Canada Base Map - Transportation (CBMT) web mapping services',
                ' of the Earth Sciences Sector (ESS) at Natural Resources Canada (NRCan)]',
                '(http://www.nrcan.gc.ca/earth-sciences/geography/topographic-information/free-data-geogratis/geogratis-web-services/17216)',
                ' licensed as the ',
                '[Open Government Licence - Canada]',
                '(http://open.canada.ca/en/open-government-licence-canada).',
                sep=''
            ),
        html=paste(
            'Cartography by <a href="http://www.nrcan.gc.ca/earth-sciences/geography/topographic-information/free-data-geogratis/geogratis-web-services/17216">',
            'The Canada Base Map - Transportation (CBMT) web mapping services',
            ' of the Earth Sciences Sector (ESS) at Natural Resources Canada (NRCan)</a>',
            ' licensed as the ',
            '<a href="http://open.canada.ca/en/open-government-licence-canada">',
            'Open Government Licence - Canada</a>.',
            sep=''
        ),
        text =paste(
            'Cartography by ',
            'The Canada Base Map - Transportation (CBMT) web mapping services',
            ' of the Earth Sciences Sector (ESS) at Natural Resources Canada (NRCan) ',
            '(www.nrcan.gc.ca/earth-sciences/geography/topographic-information)',
            ' licensed as the ',
            'Open Government Licence - Canada',
            ' (open.canada.ca/en/open-government-licence-canada).',
            sep=''
        )
    ),
    short=list(
        latex='\\href{http://www.nrcan.gc.ca}{Natural Resources Canada}',
        markdown='[Natural Resources Canada](http://www.nrcan.gc.ca)',
        html= '&copy; <a href="http://www.nrcan.gc.ca">Natural Resources Canada"</a>',
        text='Natural Resources Canada'
    )
)




for(D in names(osm$long)){
  osm$long[[D]] = paste(
      osm$short[[D]], 
      ' contributors. ',
      odl[[D]],
      osm$long[[D]], sep=''
  )
}

osmHumanitarian = osm
osmHumanitarian$long$latex = gsub("cartography",
    "cartography by \\\\href{http://hot.openstreetmap.org/about}{Humanitarian OSM team}",
    osmHumanitarian$long$latex)
osmHumanitarian$long$markdown = gsub("cartography",
    "cartography by [Humanitarian OSM team](http://hot.openstreetmap.org/about)",
    osmHumanitarian$long$markdown)
osmHumanitarian$long$text = gsub("cartography",
    "cartography by Humanitarian OSM team (hot.openstreetmap.org)",
    osmHumanitarian$long$text)
osmHumanitarian$long$html = gsub("cartography",
    "cartography by <a href=\"http://hot.openstreetmap.org/about\">Humanitarian OSM team</a>",
    osmHumanitarian$long$html)

osmLandscape = osm
osmLandscape$long$latex = gsub("cartography[[:print:]]+$",
    "cartography by \\\\href{http://www.thunderforest.com/}{Thunderforest}",
    osmLandscape$long$latex)
osmLandscape$long$markdown = gsub("cartography[[:print:]]+$",
    "cartography by [Thunderforest](http://www.thunderforest.com/)",
    osmLandscape$long$markdown)
osmLandscape$long$text = gsub("cartography[[:print:]]+$",
    "cartography by Thunderforest.com",
    osmLandscape$long$text)
osmLandscape$long$html = gsub("cartography[[:print:]]+$",
    "cartography by <a href=\"http://www.thunderforest.com/\">Thunderforest</a>",
    osmLandscape$long$html)
 
 f4map = list(
    short = list(text = "f4map.com", 
        latex = "\\href{http://www.f4map.com}{f4map}",
        html='<a href="http://f4map">f4map</a>'),
    long = list(test = "f4map.com",
           latex = "\\href{http://www.f4map.com}{f4map}",
        html='<a href="http://f4map">f4map</a>',
        markdown='[f4map](http://www.f4map.com)'
        )
 )

mapquest = mapquestSat = list(
    short=list(
        latex='Tiles courtesy of \\href{http://www.mapquest.com}{MapQuest}',
        text='Tiles courtesy of MapQuest(www.mapquest.com)',
        markdown='Tiles courtesy of [MapQuest](http://www.mapquest.com)',
        html='Tiles courtesy of <a href="http://www.mapquest.com">MapQuest</a>'
    ),
    long=list()
)
for(D in names(mapquest$short)){
  mapquest$long[[D]] = paste(
      mapquest$short[[D]],
      odl[[D]],
      sep='. ')
  mapquestSat$long[[D]] = paste(
      mapquest$short[[D]],
      ", portions courtesy NASA/JPL-Caltech and U.S. Depart. of Agriculture, Farm Service Agency.",
      sep='')
}

stamen = stamenToner = list(
    short=list(
        latex='\\copyright \\href{http://stamen.com}{Stamen Design}',
        markdown='&copy; [Stamen Design](http://stamen.com)',
        html= '&copy; <a href="http://stamen.com">Stamen Design</a>',
        text='copyright Stamen Design'
    ),
    long=list(
        html=paste(
            'Map tiles by <a href="http://stamen.com">Stamen Design</a>',
            'under <a href="http://creativecommons.org/licenses/by/4.0">CC BY 4.0</a>.'
        ),
        latex=paste(
            'Map tiles by \\href{http://stamen.com}{Stamen Design}',
            'under \\href{http://creativecommons.org/licenses/by/4.0}{CC BY 4.0}.'
        ),
        markdown=paste(
            'Map tiles by [Stamen Design](http://stamen.com)',
            'under [CC BY 4.0](http://creativecommons.org/licenses/by/4.0).'
        ),
        text=paste(
            'Map tiles by Stamen Design',
            'under CC BY 4.0 (creativecommons.org/licenses/by/4.0).'
        )
    )
)
for(D in names(stamenToner$long)){
  stamenToner$long[[D]] = paste(
      stamenToner$long[[D]],
      odl[[D]]
  )
}
for(D in names(stamen$long)){
  stamen$long[[D]] = 
      gsub("http://opendatacommons.org/licenses/odbl",
          "http://creativecommons.org/licenses/by/3.0",
          stamenToner$long[[D]])
  stamen$long[[D]] = 
      gsub("Open Database License",
          "CC BY-SA",
          stamen$long[[D]]) 
}

thunderforest = maptoolkit = waze=cartodb = stamenToner
for(D in names(cartodb$long)){
  for(D2 in c('long','short')){
    cartodb[[D2]][[D]] = gsub(
        "Stamen Design", "CartoDB",
        cartodb[[D2]][[D]]
    )
    cartodb[[D2]][[D]] = gsub(
        "stamen.com", "carto.com",
        cartodb[[D2]][[D]]
    )
    waze[[D2]][[D]] = gsub(
        "Stamen Design", "Waze mobile",
        waze[[D2]][[D]]
    )
    waze[[D2]][[D]] = gsub(
        "stamen.com", "www.waze.com/legal/notices",
        waze[[D2]][[D]]
    )
    maptoolkit[[D2]][[D]] = gsub(
        "stamen.com", "www.toursprung.com",
        maptoolkit[[D2]][[D]]
    )
    maptoolkit[[D2]][[D]] = gsub(
        "Stamen Design", "Toursprung GmbH",
        maptoolkit[[D2]][[D]]
    )
    thunderforest[[D2]][[D]] = gsub(
        "stamen.com", "thunderforest.com",
        thunderforest[[D2]][[D]]
    )
    thunderforest[[D2]][[D]] = gsub(
        "Stamen Design", "Thunderforest",
        thunderforest[[D2]][[D]]
    )
    
  }
  maptoolkit$long[[D]] = paste(
      maptoolkit$short[[D]],
      odl[[D]]
  )
  waze$long[[D]] = waze$short[[D]]
  
}


  shortlong = c('long','short')[short+1]
  
  D = name
    
    if(length(grep('^nrcan', D))) {
      result = nrcan[[shortlong]][[type]]
      
    } else if(length(grep(
            "^osm|where|[ck]artogiraffe|rail|bvg|ump|wikimedia|opentopomap|openstreetmap|historical|bw.mapnik|tile.openstreetmap.org", 
            D))){        # openstreetmap
      result = osm[[shortlong]][[type]]
    } else if(length(grep("humanitarian",D))){
      result = osmHumanitarian[[shortlong]][[type]]          
    } else if(length(grep("sputnik",D))){
      result = sputnik[[shortlong]][[type]]          
    } else if(length(grep("landscape",D))){
      result = osmLandscape[[shortlong]][[type]]
      
    } else if(length(grep("mapquest|mqcdn",D))){ # mapquest
      if(length(grep("sat/?$",D))){
        result = mapquestSat[[shortlong]][[type]]
      } else {
        result = mapquest[[shortlong]][[type]]
      }
    } else if(length(grep("waze",D))){ # waze
      result = waze[[shortlong]][[type]]
    } else if(length(grep("maptoolkit",D))){ 
      result = maptoolkit[[shortlong]][[type]]
    } else if(length(grep("thunderforest|^(spinal|neighbourhood|mobile.atlas|pioneer)$",D))){ 
      result = thunderforest[[shortlong]][[type]]
    } else if(length(grep("stamen",D))){ # stamen
      if(length(grep("stamen-toner",D))){
        result = stamenToner[[shortlong]][[type]]
      } else {
        result = stamen[[shortlong]][[type]]
      }
    } else if(length(grep("cartodb",D))){ 
      result = cartodb[[shortlong]][[type]]
    } else if(length(grep("^esri",D))){
      result =  esriAttribution(D)[[shortlong]][[type]]    
    } else if(length(grep("^f4",D))){
      result =  f4map[[shortlong]][[type]]    
    } else {
      result = NA
    }
  result
}

