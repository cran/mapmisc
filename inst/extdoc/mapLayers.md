<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{Examples of map layers}
-->


# Examples of map layers


This document will be incomplete if there is no
internet connection when this document is compiled.  The full document is at
[diseasemapping.r-forge.r-project.org](http://diseasemapping.r-forge.r-project.org).

See [mc.bbbike.org/mc](http://mc.bbbike.org/mc/) for examples more map tiles 
(not all of which are compatible with `mapmisc`).





```r
theNames
```

```
##  [1] "osm"               "osm-fr"            "osm-de"           
##  [4] "osm-transport"     "osm-bw"            "stamen-toner"     
##  [7] "stamen-watercolor" "stamen-terrain"    "bvg"              
## [10] "esri"              "esri-satellite"    "esri-natgeo"      
## [13] "esri-overlay"      "esri-topo"         "kartogiraffe"     
## [16] "osm-cyclemap"      "osm-seamap"        "landscape"        
## [19] "rail"              "opentopomap"       "maptoolkit"       
## [22] "waze"              "waze-us"           "humanitarian"     
## [25] "cartodb"           "cartodb-nolabels"  "cartodb-dark"     
## [28] "f4"                "nrcan"             "nrcan-text"       
## [31] "nrcan-text-fr"     "spinal"            "neighbourhood"    
## [34] "pioneer"           "mobile-atlas"      "sputnik"          
## [37] "ump"               "where"
```








The following are some examples of maps produced with `mymap=openmap(x, path="something")`




|     |     |     |
|:---:|:---:|:---:|
|![osm](figure/someTiles-1.png) |![osm](figure/someTiles-2.png) |![osm](figure/someTiles-3.png)   |
| a) osm | b) osm | c) osm |
|![osm-fr](figure/someTiles-4.png) |![osm-fr](figure/someTiles-5.png) |![osm-fr](figure/someTiles-6.png)   |
| d) osm-fr | e) osm-fr | f) osm-fr |
|![osm-de](figure/someTiles-7.png) |![osm-de](figure/someTiles-8.png) |![osm-de](figure/someTiles-9.png)   |
| g) osm-de | h) osm-de | i) osm-de |
|![osm-transport](figure/someTiles-10.png) |![osm-transport](figure/someTiles-11.png) |![osm-transport](figure/someTiles-12.png)   |
| j) osm-transport | k) osm-transport | l) osm-transport |
|![osm-bw](figure/someTiles-13.png) |![osm-bw](figure/someTiles-14.png) |![osm-bw](figure/someTiles-15.png)   |
| m) osm-bw | n) osm-bw | o) osm-bw |
|![stamen-toner](figure/someTiles-16.png) |![stamen-toner](figure/someTiles-17.png) |![stamen-toner](figure/someTiles-18.png)   |
| p) stamen-toner | q) stamen-toner | r) stamen-toner |
|![stamen-watercolor](figure/someTiles-19.png) |![stamen-watercolor](figure/someTiles-20.png) |![stamen-watercolor](figure/someTiles-21.png)   |
| s) stamen-watercolor | t) stamen-watercolor | u) stamen-watercolor |
|![stamen-terrain](figure/someTiles-22.png) |![stamen-terrain](figure/someTiles-23.png) |![stamen-terrain](figure/someTiles-24.png)   |
| v) stamen-terrain | w) stamen-terrain | x) stamen-terrain |
|![bvg](figure/someTiles-25.png) |![bvg](figure/someTiles-26.png) |![bvg](figure/someTiles-27.png)   |
| y) bvg | z) bvg | NA) bvg |
|![esri](figure/someTiles-28.png) |![esri](figure/someTiles-29.png) |![esri](figure/someTiles-30.png)   |
| NA) esri | NA) esri | NA) esri |
|![esri-satellite](figure/someTiles-31.png) |![esri-satellite](figure/someTiles-32.png) |![esri-satellite](figure/someTiles-33.png)   |
| NA) esri-satellite | NA) esri-satellite | NA) esri-satellite |
|![esri-natgeo](figure/someTiles-34.png) |![esri-natgeo](figure/someTiles-35.png) |![esri-natgeo](figure/someTiles-36.png)   |
| NA) esri-natgeo | NA) esri-natgeo | NA) esri-natgeo |
|![esri-overlay](figure/someTiles-37.png) |![esri-overlay](figure/someTiles-38.png) |![esri-overlay](figure/someTiles-39.png)   |
| NA) esri-overlay | NA) esri-overlay | NA) esri-overlay |
|![esri-topo](figure/someTiles-40.png) |![esri-topo](figure/someTiles-41.png) |![esri-topo](figure/someTiles-42.png)   |
| NA) esri-topo | NA) esri-topo | NA) esri-topo |
|![kartogiraffe](figure/someTiles-43.png) |![kartogiraffe](figure/someTiles-44.png) |![kartogiraffe](figure/someTiles-45.png)   |
| NA) kartogiraffe | NA) kartogiraffe | NA) kartogiraffe |
|![osm-cyclemap](figure/someTiles-46.png) |![osm-cyclemap](figure/someTiles-47.png) |![osm-cyclemap](figure/someTiles-48.png)   |
| NA) osm-cyclemap | NA) osm-cyclemap | NA) osm-cyclemap |
|![osm-seamap](figure/someTiles-49.png) |![osm-seamap](figure/someTiles-50.png) |![osm-seamap](figure/someTiles-51.png)   |
| NA) osm-seamap | NA) osm-seamap | NA) osm-seamap |
|![landscape](figure/someTiles-52.png) |![landscape](figure/someTiles-53.png) |![landscape](figure/someTiles-54.png)   |
| NA) landscape | NA) landscape | NA) landscape |
|![rail](figure/someTiles-55.png) |![rail](figure/someTiles-56.png) |![rail](figure/someTiles-57.png)   |
| NA) rail | NA) rail | NA) rail |
|![opentopomap](figure/someTiles-58.png) |![opentopomap](figure/someTiles-59.png) |![opentopomap](figure/someTiles-60.png)   |
| NA) opentopomap | NA) opentopomap | NA) opentopomap |
|![maptoolkit](figure/someTiles-61.png) |![maptoolkit](figure/someTiles-62.png) |![maptoolkit](figure/someTiles-63.png)   |
| NA) maptoolkit | NA) maptoolkit | NA) maptoolkit |
|![waze](figure/someTiles-64.png) |![waze](figure/someTiles-65.png) |![waze](figure/someTiles-66.png)   |
| NA) waze | NA) waze | NA) waze |
|![waze-us](figure/someTiles-67.png) |![waze-us](figure/someTiles-68.png) |![waze-us](figure/someTiles-69.png)   |
| NA) waze-us | NA) waze-us | NA) waze-us |
|![humanitarian](figure/someTiles-70.png) |![humanitarian](figure/someTiles-71.png) |![humanitarian](figure/someTiles-72.png)   |
| NA) humanitarian | NA) humanitarian | NA) humanitarian |
|![cartodb](figure/someTiles-73.png) |![cartodb](figure/someTiles-74.png) |![cartodb](figure/someTiles-75.png)   |
| NA) cartodb | NA) cartodb | NA) cartodb |
|![cartodb-nolabels](figure/someTiles-76.png) |![cartodb-nolabels](figure/someTiles-77.png) |![cartodb-nolabels](figure/someTiles-78.png)   |
| NA) cartodb-nolabels | NA) cartodb-nolabels | NA) cartodb-nolabels |
|![cartodb-dark](figure/someTiles-79.png) |![cartodb-dark](figure/someTiles-80.png) |![cartodb-dark](figure/someTiles-81.png)   |
| NA) cartodb-dark | NA) cartodb-dark | NA) cartodb-dark |
|![f4](figure/someTiles-82.png) |![f4](figure/someTiles-83.png) |![f4](figure/someTiles-84.png)   |
| NA) f4 | NA) f4 | NA) f4 |
|![nrcan](figure/someTiles-85.png) |![nrcan](figure/someTiles-86.png) |![nrcan](figure/someTiles-87.png)   |
| NA) nrcan | NA) nrcan | NA) nrcan |
|![nrcan-text](figure/someTiles-88.png) |![nrcan-text](figure/someTiles-89.png) |![nrcan-text](figure/someTiles-90.png)   |
| NA) nrcan-text | NA) nrcan-text | NA) nrcan-text |
|![nrcan-text-fr](figure/someTiles-91.png) |![nrcan-text-fr](figure/someTiles-92.png) |![nrcan-text-fr](figure/someTiles-93.png)   |
| NA) nrcan-text-fr | NA) nrcan-text-fr | NA) nrcan-text-fr |
|![spinal](figure/someTiles-94.png) |![spinal](figure/someTiles-95.png) |![spinal](figure/someTiles-96.png)   |
| NA) spinal | NA) spinal | NA) spinal |
|![neighbourhood](figure/someTiles-97.png) |![neighbourhood](figure/someTiles-98.png) |![neighbourhood](figure/someTiles-99.png)   |
| NA) neighbourhood | NA) neighbourhood | NA) neighbourhood |
|![pioneer](figure/someTiles-100.png) |![pioneer](figure/someTiles-101.png) |![pioneer](figure/someTiles-102.png)   |
| NA) pioneer | NA) pioneer | NA) pioneer |
|![mobile-atlas](figure/someTiles-103.png) |![mobile-atlas](figure/someTiles-104.png) |![mobile-atlas](figure/someTiles-105.png)   |
| NA) mobile-atlas | NA) mobile-atlas | NA) mobile-atlas |
|![ump](figure/someTiles-106.png) |![ump](figure/someTiles-107.png) |![ump](figure/someTiles-108.png)   |
| NA) ump | NA) ump | NA) ump |
|![where](figure/someTiles-109.png) |![where](figure/someTiles-110.png) |![where](figure/someTiles-111.png)   |
| NA) where | NA) where | NA) where |

 : some tiles {#tbl:someTiles}

# Attributions


```r
openmapAttribution('osm', type='text', short=TRUE)
```

```
## [1] "copyright OpenStreetMap.org"
```

```r
openmapAttribution('osm', type='text', short=FALSE)
```

```
## [1] "copyright OpenStreetMap.org contributors. Data by OpenStreetMap.org available under the Open Database License (opendatacommons.org/licenses/odbl), cartography is licensed as CC BY-SA (see www.openstreetmap.org/copyright)."
```


##  osm 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  osm-fr 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  osm-de 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  osm-transport 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  osm-bw 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  stamen-toner 

&copy; <a href="http://stamen.com">Stamen Design</a> 

Map tiles by <a href="http://stamen.com">Stamen Design</a> under <a href="http://creativecommons.org/licenses/by/4.0">CC BY 4.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a> 

##  stamen-watercolor 

&copy; <a href="http://stamen.com">Stamen Design</a> 

Map tiles by <a href="http://stamen.com">Stamen Design</a> under <a href="http://creativecommons.org/licenses/by/4.0">CC BY 4.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://creativecommons.org/licenses/by/3.0">CC BY-SA</a> 

##  stamen-terrain 

&copy; <a href="http://stamen.com">Stamen Design</a> 

Map tiles by <a href="http://stamen.com">Stamen Design</a> under <a href="http://creativecommons.org/licenses/by/4.0">CC BY 4.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://creativecommons.org/licenses/by/3.0">CC BY-SA</a> 

##  bvg 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  esri 

&copy; <a href="https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer">Esri and others</a> 

Esri, HERE, DeLorme, USGS, Intermap, increment P Corp., NRCAN, Esri Japan, METI, Esri China (Hong Kong), Esri (Thailand), TomTom, MapmyIndia, &copy; OpenStreetMap contributors, and the GIS User Community see <a href="https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer">arcgisonline.com</a> 

##  esri-satellite 

&copy; <a href="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer">Esri and others</a> 

Esri, Earthstar Geographics and others see <a href="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer">arcgisonline.com</a> 

##  esri-natgeo 

&copy; <a href="https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer">Esri and others</a> 

Esri, National Geographic and others see <a href="https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer">arcgisonline.com</a> 

##  esri-overlay 

&copy; <a href="https://server.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer">Esri and others</a> 

Esri see <a href="https://server.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer">arcgisonline.com</a> 

##  esri-topo 

&copy; <a href="https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer">Esri and others</a> 

Esri, HERE, DeLorme, TomTom, Intermap, increment P Corp., GEBCO, USGS, FAO, NPS, NRCAN, GeoBase, IGN, Kadaster NL, Ordnance Survey, Esri Japan, METI, Esri China (Hong Kong), swisstopo, MapmyIndia, &copy; OpenStreetMap contributors, and the GIS User Community see <a href="https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer">arcgisonline.com</a> 

##  kartogiraffe 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  osm-cyclemap 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  osm-seamap 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  landscape 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography by <a href="http://www.thunderforest.com/">Thunderforest</a> 

##  rail 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  opentopomap 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  maptoolkit 

&copy; <a href="http://www.toursprung.com">Toursprung GmbH</a> 

&copy; <a href="http://www.toursprung.com">Toursprung GmbH</a> Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a> 

##  waze 

&copy; <a href="http://www.waze.com/legal/notices">Waze mobile</a> 

&copy; <a href="http://www.waze.com/legal/notices">Waze mobile</a> 

##  waze-us 

&copy; <a href="http://www.waze.com/legal/notices">Waze mobile</a> 

&copy; <a href="http://www.waze.com/legal/notices">Waze mobile</a> 

##  humanitarian 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography by <a href="http://hot.openstreetmap.org/about">Humanitarian OSM team</a> is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  cartodb 

&copy; <a href="http://carto.com">CartoDB</a> 

Map tiles by <a href="http://carto.com">CartoDB</a> under <a href="http://creativecommons.org/licenses/by/4.0">CC BY 4.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a> 

##  cartodb-nolabels 

&copy; <a href="http://carto.com">CartoDB</a> 

Map tiles by <a href="http://carto.com">CartoDB</a> under <a href="http://creativecommons.org/licenses/by/4.0">CC BY 4.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a> 

##  cartodb-dark 

&copy; <a href="http://carto.com">CartoDB</a> 

Map tiles by <a href="http://carto.com">CartoDB</a> under <a href="http://creativecommons.org/licenses/by/4.0">CC BY 4.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a> 

##  f4 

NA 

NA 

##  nrcan 

&copy; <a href="http://www.nrcan.gc.ca">Natural Resources Canada"</a> 

Cartography by <a href="http://www.nrcan.gc.ca/earth-sciences/geography/topographic-information/free-data-geogratis/geogratis-web-services/17216">The Canada Base Map - Transportation (CBMT) web mapping services of the Earth Sciences Sector (ESS) at Natural Resources Canada (NRCan)</a> licensed as the <a href="http://open.canada.ca/en/open-government-licence-canada">Open Government Licence - Canada</a>. 

##  nrcan-text 

&copy; <a href="http://www.nrcan.gc.ca">Natural Resources Canada"</a> 

Cartography by <a href="http://www.nrcan.gc.ca/earth-sciences/geography/topographic-information/free-data-geogratis/geogratis-web-services/17216">The Canada Base Map - Transportation (CBMT) web mapping services of the Earth Sciences Sector (ESS) at Natural Resources Canada (NRCan)</a> licensed as the <a href="http://open.canada.ca/en/open-government-licence-canada">Open Government Licence - Canada</a>. 

##  nrcan-text-fr 

&copy; <a href="http://www.nrcan.gc.ca">Natural Resources Canada"</a> 

Cartography by <a href="http://www.nrcan.gc.ca/earth-sciences/geography/topographic-information/free-data-geogratis/geogratis-web-services/17216">The Canada Base Map - Transportation (CBMT) web mapping services of the Earth Sciences Sector (ESS) at Natural Resources Canada (NRCan)</a> licensed as the <a href="http://open.canada.ca/en/open-government-licence-canada">Open Government Licence - Canada</a>. 

##  spinal 

&copy; <a href="http://thunderforest.com">Thunderforest</a> 

Map tiles by <a href="http://thunderforest.com">Thunderforest</a> under <a href="http://creativecommons.org/licenses/by/4.0">CC BY 4.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a> 

##  neighbourhood 

&copy; <a href="http://thunderforest.com">Thunderforest</a> 

Map tiles by <a href="http://thunderforest.com">Thunderforest</a> under <a href="http://creativecommons.org/licenses/by/4.0">CC BY 4.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a> 

##  pioneer 

&copy; <a href="http://thunderforest.com">Thunderforest</a> 

Map tiles by <a href="http://thunderforest.com">Thunderforest</a> under <a href="http://creativecommons.org/licenses/by/4.0">CC BY 4.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a> 

##  mobile-atlas 

&copy; <a href="http://thunderforest.com">Thunderforest</a> 

Map tiles by <a href="http://thunderforest.com">Thunderforest</a> under <a href="http://creativecommons.org/licenses/by/4.0">CC BY 4.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a> 

##  ump 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 

##  where 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> 

&copy; <a href="http://openstreetmap.org/copyright">OpenStreetMap</a> contributors. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>,  available under the <a href="http://opendatacommons.org/licenses/odbl">Open Database License</a>, cartography is licensed as <a href="http://creativecommons.org/licenses/by-sa/2.0">CC BY-SA</a>. 





