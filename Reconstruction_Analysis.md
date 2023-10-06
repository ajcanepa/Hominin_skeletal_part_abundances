---
title: "Reconstrucción de Egeland et al., 2018: 'Hominin skeletal part abundances...'"
author: 'Antonio Canepa-Oneto'
date: "Last compiled on 06 octubre, 2023"
output:
  html_document:
    toc: yes  
    toc_float: yes
    toc_depth: 6
    keep_md: yes
---

## Introducción
Se hace una mini-revisión de lo reportado en *Hominin skeletal part abundances and claims of deliberate disposal of corpses in the Middle Pleistocene* [https://doi.org/10.1073/pnas.1718678115](https://doi.org/10.1073/pnas.1718678115)

Los procesos funerarios humanos tiene una antiguedad determinada (desde cuándo somos conscientes de nuestra muerte) que está bajo escrutinio y constante debate. Gracias a un estudio de diversos yacimientos se intenta esclarecer ese posible supuesto de primer origen de enterramientos funerarios para los yacimientos de Atapuerca (**SH**) y Sudáfrica (**DC**).

Cuando se encuentra y analiza un yacimiento de homínidos (u homininos para ser más precisos) es posible que no todos los huesos estén en perfecto estado y más notable aún es posible que no todos los huesos estén presentes. La ausencia de determinados huesos puede deberse a procesos aleatorios (deterioro, rompimiento, etc), semi-aleatorios (consumo de carroña de partes específicas) o altamente selectivos (ritos funerarios).

Afortunamente existe una cantidad interesante de yacimientos con restos humanos y de primates ("cercanos") que pueden dar pistas de si los yacimientos **SH** y **DC** pueden (o no) considerarse procesos rituales (muy específicos) o simplemente procesos aleatorios y/o semi-aleatorios.

<br>

### Objetivos
Los objetivos del artículo son tratar de comparar los yacimientos de **SH** y **DC** con yacimientos conocidos para determinar si la estructura (como composición unitaria, no como forma) de huesos disponibles es ás característico de un rito funerario o de un proceso de pérdida aleatorio (descomposición) o semi-aleatorio (carroña).

<br>

#### Diseño de Análisis
La idea general es que ellos comparan los huesos encontrados ("*Hominin skeletal part representation* - __HSPR__") con otros 14 yacimientos entre los cuales existen algunos de humanos en estado "completo" en el que no le falta ninguna pieza.

Para eso ellos:

1.-   Usando un Random Forest (RF) determinan cuáles son las piezas de huesos con más variabilidad (Gini idex y MDA), para utilizarlas luego en la creación/clasificación de grupos.

2.-   Usando un primer k-means logran crear dos grupos de "HSPR", en los que los huesos humanos "completos" y otros yacimientos en buen estado quedan juntos en un cluster y el segundo cluster atribuyen a carroña, canibalismo, etc. mostrando un proceso de acumulación natural (__no ritual__).

3.-   Repiten el k-means con más grupos y encuentran un gradiente de conservación de 4 grupos desde los más completos hasta los netamente depredados/erosionados.

4.-   Usando herramientas supervisadas intentan clasificar los yacimientos (todos) con especial interés en **SH** y **DC** en alguno de los grupos ya reconocidos por los k-means anteriores.

5.-   Usando herramientas no-supervisadas intentan agrupar los yacimientos (todos) con especial interés en **SH** y **DC** para ver si coinciden con las características/grupos encontradas en los k-means anteriores.

<br>

### Tratamiento estadístico de datos de partes esqueléticas de primates
Todos los análisis descritos a continuación se ejecutan dentro del entorno estadístico R

Los algoritmos implementados, el paquete utilizado y la URL de esos paquetes se enumeran en la siguiente tabla:








```{=html}
<div id="htmlwidget-241a1c583a07a94a802c" style="width:100%;height:auto;" class="datatables html-widget "></div>
<script type="application/json" data-for="htmlwidget-241a1c583a07a94a802c">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7","8","9","10"],["Neural Network","Neural Network","SVM","SVM","Decision tree with C5.0","Decision tree with C5.0","KNN","KNN","Random Forest","Random Forest"],["neuralnet","caret","e1071","caret","C50","caret","class","knn/fknn","randomForest","caret"],["<a href=\"https://cran.r-project.org/web/packages/neuralnet/\">https://cran.r-project.org/web/packages/neuralnet/<\/a>","<a href=\"https://cran.r-project.org/web/packages/caret/index.html\">https://cran.r-project.org/web/packages/caret/index.html<\/a>","<a href=\"https://cran.r-project.org/web/packages/e1071/index.html\">https://cran.r-project.org/web/packages/e1071/index.html<\/a>","<a href=\"https://cran.r-project.org/web/packages/caret/index.html\">https://cran.r-project.org/web/packages/caret/index.html<\/a>","<a href=\"https://cran.r-project.org/web/packages/C50/index.html\">https://cran.r-project.org/web/packages/C50/index.html<\/a>","<a href=\"https://cran.r-project.org/web/packages/caret/index.html\">https://cran.r-project.org/web/packages/caret/index.html<\/a>","<a href=\"https://cran.r-project.org/web/packages/class/index.html\">https://cran.r-project.org/web/packages/class/index.html<\/a>","<a href=\"https://cran.r-project.org/web/packages/FastKNN/index.html\">https://cran.r-project.org/web/packages/FastKNN/index.html<\/a>","<a href=\"https://cran.r-project.org/web/packages/randomForest/index.html\">https://cran.r-project.org/web/packages/randomForest/index.html<\/a>","<a href=\"https://cran.r-project.org/web/packages/caret/index.html\">https://cran.r-project.org/web/packages/caret/index.html<\/a>"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Algorithm<\/th>\n      <th>Package_used<\/th>\n      <th>Packages_Link<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":true,"columnDefs":[{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```




<br>

### Carga y pre-procesamiento de datos
El conjunto de datos se entrega de manera desagregada, dificultando los análisis por lo que he procedido a recopilarlo todo en un único documento. El documento original entregado como "material suplementario" se puede encontrar [aquí](https://www.pnas.org/doi/suppl/10.1073/pnas.1718678115/suppl_file/pnas.1718678115.sd01.xlsx).

El conjunto de datos recopilado se muestra a continuación. La tabla se puede descargar de la siguiente botonera y es dinámica.









```{=html}
<div id="htmlwidget-bb434d0247417e5c6bac" style="width:100%;height:auto;" class="datatables html-widget "></div>
<script type="application/json" data-for="htmlwidget-bb434d0247417e5c6bac">{"x":{"filter":"none","vertical":false,"extensions":["Buttons"],"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57"],["Hummingbird_Pueblo_Pueblo_I","Hummingbird_Pueblo_Pueblo_I","Hummingbird_Pueblo_Pueblo_I","Hummingbird_Pueblo_Pueblo_I","Hummingbird_Pueblo_Pueblo_I","Hummingbird_Pueblo_Pueblo_I","Pottery_Mound_Pueblo_IV","Kuaua_Pueblo_Pueblo_IV","Dolni_Vestonice_I_DV_3","Dolni_Vestonice_II_Triple_Burial","Dolni_Vestonice_II_Triple_Burial","Skhul_Layer_B","Skhul_Layer_B","Skhul_Layer_B","Skhul_Layer_B","Skhul_Layer_B","Skhul_Layer_B","Qafzeh_Couche_XVII","Qafzeh_Couche_XVII","Regourdou","La_Chapelle_aux_Saints","Tabun_Layer_C","Shanidar_Layer_D_Upper","Shanidar_Layer_D_Upper","Shanidar_Layer_D_Upper","Shanidar_Layer_D_Lower","Shanidar_Layer_D_Lower","Shanidar_Layer_D_Lower","Shanidar_Layer_D_Lower","Kebara_Couche_XII","Fontbregoua_H1","Fontbregoua_H3","Gran_Dolina_TD6","El_Mirador_MIR4A","Goughs_Cave","5MT-3","5MT-10010_Feature_3","El_Miron","La_Tolita_Cama_de_Huesos","Crow_Creek","Krapina","Liang_Bua_Layer_R","Liang_Bua_Layer_OQ","Dmanisi_Layer_B1y","Malapa","AL_333","Unscavenged_human_corpses_WA","Scavenged_human_corpses_WA","Scavenged_human_corpses_NM","Scavenged_human_corpses_NM","Scavenged_human_corpses_NM","Scavenged_human_corpse_NC","Mapungubwe_leopard_kills","Leopard_refuse","Misgrot_Cave","Sima_de_los_Huesos","Dinaledi"],["Hummingbird_Pueblo_Pueblo_I_4202","Hummingbird_Pueblo_Pueblo_I_4203","Hummingbird_Pueblo_Pueblo_I_4205","Hummingbird_Pueblo_Pueblo_I_7101","Hummingbird_Pueblo_Pueblo_I_7501","Hummingbird_Pueblo_Pueblo_I_79","Pottery_Mound_Pueblo_IV","Kuaua_Pueblo_Pueblo_IV","Dolni_Vestonice_I_DV_3","Dolni_Vestonice_II_Triple_Burial_DV_13","Dolni_Vestonice_II_Triple_Burial_DV_15","Skhul_Layer_B_Skhul_II","Skhul_Layer_B_Skhul_III","Skhul_Layer_B_Skhul_IV","Skhul_Layer_B_Skhul_V","Skhul_Layer_B_Skhul_VI","Skhul_Layer_B_Skhul_VII","Qafzeh_Couche_XVII_Q8","Qafzeh_Couche_XVII_Q9","Regourdou","La_Chapelle_aux_Saints","Tabun_Layer_C","Shanidar_Layer_D_Upper_1","Shanidar_Layer_D_Upper_3","Shanidar_Layer_D_Upper_5","Shanidar_Layer_D_Lower_2","Shanidar_Layer_D_Lower_4","Shanidar_Layer_D_Lower_6","Shanidar_Layer_D_Lower_8","Kebara_Couche_XII","Fontbregoua_H1","Fontbregoua_H3","Gran_Dolina_TD6","El_Mirador_MIR4A","Goughs_Cave","5MT-3","5MT-10010_Feature_3","El_Miron","La_Tolita_Cama_de_Huesos","Crow_Creek_Adults","Krapina","Liang_Bua_Layer_R","Liang_Bua_Layer_OQ","Dmanisi_Layer_B1y","Malapa_Adults","AL_333_Adults","Unscavenged_human_corpses_WA_Adults","Scavenged_human_corpses_WA_Adults","Scavenged_human_corpses_NM_1","Scavenged_human_corpses_NM_2","Scavenged_human_corpses_NM_3","Scavenged_human_corpse_NC","Mapungubwe_leopard_kills","Leopard_refuse","Misgrot_Cave","Sima_de_los_Huesos_Adults","Dinaledi"],[1,1,1,1,1,1,38,68,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,7,0,0,5,2,4,4,1,6,277,20,1,0,4,1,4,16,44,4,2,1,1,7,8,7,13,6],[1,1,1,1,1,1,34,64,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,6,0,2,4,3,8,3,1,9,309,12,1,1,3,1,6,17,39,3,2,1,1,6,8,4,15,7],[7,7,7,2,0,7,254,288,7,7,7,0,0,0,7,0,0,0,0,7,6,0,4,0,1,7,5,0,0,7,4,2,2,1,7,15,12,4,2,1318,22,1,1,0,1,4,119,227,8,6,4,1,13,13,19,42,7],[12,12,12,12,9,12,452,534,12,12,12,0,0,12,12,0,0,0,0,9,9,8,10,12,0,8,7,0,0,12,0,0,0,6,3,5,21,8,22,3132,12,1,0,0,3,2,203,418,4,6,8,11,32,20,24,46,13],[5,5,5,0,5,5,193,252,5,5,5,0,0,5,5,0,2,0,0,4,4,0,5,5,0,4,4,4,0,5,0,0,0,2,0,3,11,2,13,1498,21,1,0,0,0,1,80,180,10,1,2,5,30,13,10,19,3],[1,1,1,1,1,1,39,52,1,1,1,0,0,1,1,0,1,0,1,1,1,0,1,1,0,0,1,0,0,1,0,1,0,0,0,1,1,null,3,347,0,0,0,0,0,0,17,34,2,1,0,1,4,4,2,5,1],[1,1,1,1,1,1,0,0,0,1,1,0,0,1,0,0,1,0,1,1,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,null,3,44,0,1,0,0,1,0,14,27,0,0,0,0,2,0,1,4,1],[2,2,2,2,2,2,81,103,2,2,2,0,0,2,2,1,1,0,2,2,1,2,2,2,0,0,0,0,0,2,3,3,1,0,3,12,4,1,7,197,10,1,0,2,2,2,11,54,1,2,1,2,2,0,3,9,5],[24,24,24,24,18,24,901,993,24,24,23,0,0,17,15,0,1,0,24,6,10,20,14,20,8,0,20,0,0,24,0,9,7,7,34,34,61,14,32,2505,63,1,0,2,3,4,402,753,7,0,0,17,93,55,41,60,28],[2,2,2,2,2,2,78,105,2,2,2,0,0,1,2,0,1,1,2,0,1,1,2,2,1,2,2,0,0,2,2,6,0,1,4,3,9,2,6,453,13,0,1,1,2,0,32,55,2,3,1,2,7,8,10,14,6],[2,2,2,2,2,2,73,129,2,2,2,2,0,2,2,1,2,1,2,2,2,2,2,2,0,0,2,2,2,2,3,6,1,1,5,6,6,null,15,393,13,1,0,1,2,4,32,48,2,1,1,2,12,15,10,12,8],[2,2,2,2,2,2,77,121,2,2,2,1,0,2,2,1,2,1,2,2,2,1,1,1,1,0,2,2,1,2,2,4,2,0,4,6,6,null,6,234,9,0,1,0,1,1,38,44,1,1,0,0,11,11,6,14,6],[2,2,2,2,2,2,74,109,2,2,2,2,0,2,2,1,2,1,2,2,2,2,1,2,2,0,2,2,0,2,0,5,0,2,6,5,6,null,12,251,7,2,1,0,1,4,31,39,3,1,0,1,12,11,8,13,5],[14,14,16,10,0,16,520,388,8,0,4,0,0,15,7,0,0,8,16,7,2,7,2,6,4,0,10,2,1,15,0,0,2,1,0,18,9,6,5,93,1,5,3,0,7,4,192,188,0,1,0,0,27,27,24,94,17],[10,10,10,8,5,10,416,472,10,3,4,0,0,10,4,0,0,5,10,8,4,5,4,4,3,0,10,5,0,9,0,0,2,1,1,17,18,4,8,51,4,1,2,0,5,19,null,null,null,null,null,0,15,20,15,36,23],[2,2,2,2,2,2,77,120,2,2,2,0,0,2,1,2,2,1,2,2,2,2,2,2,1,0,2,1,0,2,0,1,0,0,2,6,4,2,13,952,12,2,0,0,2,0,34,69,6,2,2,2,10,10,6,18,9],[2,2,2,2,2,2,86,133,2,2,2,0,1,2,2,2,1,2,2,1,2,2,1,1,2,0,2,2,0,1,3,4,1,1,5,5,3,null,19,706,14,2,0,1,1,5,34,65,7,2,1,2,13,15,10,9,14],[2,2,2,2,1,2,68,77,2,2,2,0,0,2,0,0,0,null,2,2,2,0,2,0,2,0,1,1,0,0,0,0,2,0,0,3,1,2,3,38,15,2,1,1,1,0,29,34,1,2,0,2,3,0,2,11,4],[2,2,2,2,2,2,66,121,2,2,2,0,1,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,0,0,2,9,0,2,3,6,4,1,18,505,13,3,0,1,2,4,33,57,4,1,1,2,11,15,5,10,9],[2,2,2,2,2,2,68,104,2,2,2,0,1,2,1,1,2,2,2,2,1,2,2,2,2,1,2,2,1,0,3,3,0,2,3,8,4,2,18,426,14,2,0,0,2,4,33,51,4,1,0,2,9,11,2,9,8],[11,14,14,10,10,14,434,572,7,2,7,0,0,13,0,4,3,14,14,4,2,13,12,13,0,0,9,3,1,0,2,0,2,3,2,24,11,6,19,548,18,10,0,2,2,9,115,171,2,7,0,14,26,35,14,104,34],[7,10,10,5,6,10,390,448,4,0,7,0,0,10,1,0,1,10,10,3,8,6,8,7,0,0,7,4,6,0,0,0,3,0,0,29,13,7,18,294,12,10,0,7,null,7,null,null,null,null,null,10,16,20,15,33,21],[28,26,28,14,6,28,811,721,14,8,8,0,0,15,6,0,0,16,28,23,2,5,0,11,0,0,19,9,0,22,7,2,5,0,1,35.5,60,13,14,44,48,5,8,2,15,25,null,null,null,null,null,0,39,59,37.5,210,76],[0,0,0,0,0,11,423,423,6,0,3,0,0,17,0,0,0,26,24,11,2,5,1,2,0,0,19,2,5,0,2,0,7,0,0,35.5,16,21,7,11,32,10,0,1,2,23,null,null,null,null,null,28,39,59,37.5,153,32],[38,36,38,22,11,38,1227,1193,24,11,12,0,0,25,10,0,0,21,38,31,6,10,4,15,10,0,29,14,0,31,7,2,7,1,2,52.5,78,17,22,95,52,6,10,1,20,44,467,446,14,9,0,0,54,79,52.5,246,93],[7,10,10,5,6,21,813,871,10,0,10,0,0,27,1,0,1,36,34,14,10,11,9,9,0,0,28,6,11,0,2,0,10,0,0,64.5,29,28,25,305,44,20,0,12,2,30,406,595,0,9,0,38,55,79,52.5,186,66]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Ref<\/th>\n      <th>Study<\/th>\n      <th>Cranium<\/th>\n      <th>Mandible<\/th>\n      <th>Cervical<\/th>\n      <th>Thoracic<\/th>\n      <th>Lumbar<\/th>\n      <th>Sacrum<\/th>\n      <th>Sternum<\/th>\n      <th>Clavicle<\/th>\n      <th>Rib<\/th>\n      <th>Scapula<\/th>\n      <th>Humerus<\/th>\n      <th>Radius<\/th>\n      <th>Ulna<\/th>\n      <th>Carpal<\/th>\n      <th>Metacarpal<\/th>\n      <th>Innominate<\/th>\n      <th>Femur<\/th>\n      <th>Patella<\/th>\n      <th>Tibia<\/th>\n      <th>Fibula<\/th>\n      <th>Tarsal<\/th>\n      <th>Metatarsal<\/th>\n      <th>Hand_phalanx<\/th>\n      <th>Foot_phalanx<\/th>\n      <th>Hand_metacarpals_manual_phalanges_<\/th>\n      <th>Foot_metatarsals_pedal_phalanges_<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":true,"dom":"Bfrtip","buttons":["copy","print",{"extend":"collection","buttons":["csv","excel","pdf"],"text":"Download"}],"columnDefs":[{"className":"dt-right","targets":[3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

El conjunto de dato no posee todas las columnas (atributos) utilizadas en el análisis, por lo que tendremos que crear los conjuntos de datos necesarios para replicar los análisis realizados.

*    Suposición: Asumimos que la clase a predecir es una categoría con los niveles `Primary hominin interment`, `Possible primary hominin interment`,  `Hominin cannibalism/secondary interment`, `Nonanthropogenic hominin accumulation`, `Unscavenged human corpses`, `Scavenged human corpses`, `Leopard refuse`, `Natural Baboon accumulation` and `Possible hominin deliberate disposal`.

A continuación crearemos una columna nueva con esta nueva clase a predcir (nuevo atributo `Type`):


```r
Summary_Dataset_Multivar <-
  Summary_Dataset %>%
  mutate(Type = case_when(grepl(paste(c("Pueblo", "Dolni_Vestonice"), collapse='|'), Ref) ~ "Primary hominin interment",
                          grepl(paste(c("Skhul", "Qafzeh", "Regourdou", "La_Chapelle", "Tabun_Layer", "Shanidar_Layer", "Kebara", "El_Miron"), collapse='|'), Ref) ~ "Possible Primary hominin interment",
                          grepl(paste(c("Krapina", "Fontbregoua", "Gran_Dolina", "El_Mirador", "Goughs_Cave", "5MT", "La_Tolita", "Crow_Creek"), collapse='|'), Ref) ~ "Hominin canibalism/ secondary interment",
                          grepl(paste(c("AL_333", "Liang_Bua", "Dmanisi_Layer", "Malapa"), collapse='|'), Ref) ~ "Nonantrhopogenic hominin accumulation",
                          grepl(paste(c("Unscavenged_human_corpses_WA"), collapse='|'), Ref) ~ "Unscavenged human corpses",
                          grepl(c("Scavenged_human"), Ref) ~ "Scavenged human corpses",
                          grepl(paste(c("Mapungubwe", "Leopard_refuse"), collapse='|'), Ref) ~ "Leopard refuse",
                          grepl(c("Misgrot_Cave"), Ref) ~ "Natural Baboon accumulation",
                          grepl(paste(c("Sima_de_los_Huesos", "Dinaledi"), collapse='|'), Ref) ~ "Possible hominin deliberate disposal",
                          )) %>% 
  relocate(Type, .before = Cranium)
```


```{=html}
<div id="htmlwidget-00d39909bd1e791faeb8" style="width:100%;height:auto;" class="datatables html-widget "></div>
<script type="application/json" data-for="htmlwidget-00d39909bd1e791faeb8">{"x":{"filter":"none","vertical":false,"extensions":["Buttons"],"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57"],["Hummingbird_Pueblo_Pueblo_I","Hummingbird_Pueblo_Pueblo_I","Hummingbird_Pueblo_Pueblo_I","Hummingbird_Pueblo_Pueblo_I","Hummingbird_Pueblo_Pueblo_I","Hummingbird_Pueblo_Pueblo_I","Pottery_Mound_Pueblo_IV","Kuaua_Pueblo_Pueblo_IV","Dolni_Vestonice_I_DV_3","Dolni_Vestonice_II_Triple_Burial","Dolni_Vestonice_II_Triple_Burial","Skhul_Layer_B","Skhul_Layer_B","Skhul_Layer_B","Skhul_Layer_B","Skhul_Layer_B","Skhul_Layer_B","Qafzeh_Couche_XVII","Qafzeh_Couche_XVII","Regourdou","La_Chapelle_aux_Saints","Tabun_Layer_C","Shanidar_Layer_D_Upper","Shanidar_Layer_D_Upper","Shanidar_Layer_D_Upper","Shanidar_Layer_D_Lower","Shanidar_Layer_D_Lower","Shanidar_Layer_D_Lower","Shanidar_Layer_D_Lower","Kebara_Couche_XII","Fontbregoua_H1","Fontbregoua_H3","Gran_Dolina_TD6","El_Mirador_MIR4A","Goughs_Cave","5MT-3","5MT-10010_Feature_3","El_Miron","La_Tolita_Cama_de_Huesos","Crow_Creek","Krapina","Liang_Bua_Layer_R","Liang_Bua_Layer_OQ","Dmanisi_Layer_B1y","Malapa","AL_333","Unscavenged_human_corpses_WA","Scavenged_human_corpses_WA","Scavenged_human_corpses_NM","Scavenged_human_corpses_NM","Scavenged_human_corpses_NM","Scavenged_human_corpse_NC","Mapungubwe_leopard_kills","Leopard_refuse","Misgrot_Cave","Sima_de_los_Huesos","Dinaledi"],["Hummingbird_Pueblo_Pueblo_I_4202","Hummingbird_Pueblo_Pueblo_I_4203","Hummingbird_Pueblo_Pueblo_I_4205","Hummingbird_Pueblo_Pueblo_I_7101","Hummingbird_Pueblo_Pueblo_I_7501","Hummingbird_Pueblo_Pueblo_I_79","Pottery_Mound_Pueblo_IV","Kuaua_Pueblo_Pueblo_IV","Dolni_Vestonice_I_DV_3","Dolni_Vestonice_II_Triple_Burial_DV_13","Dolni_Vestonice_II_Triple_Burial_DV_15","Skhul_Layer_B_Skhul_II","Skhul_Layer_B_Skhul_III","Skhul_Layer_B_Skhul_IV","Skhul_Layer_B_Skhul_V","Skhul_Layer_B_Skhul_VI","Skhul_Layer_B_Skhul_VII","Qafzeh_Couche_XVII_Q8","Qafzeh_Couche_XVII_Q9","Regourdou","La_Chapelle_aux_Saints","Tabun_Layer_C","Shanidar_Layer_D_Upper_1","Shanidar_Layer_D_Upper_3","Shanidar_Layer_D_Upper_5","Shanidar_Layer_D_Lower_2","Shanidar_Layer_D_Lower_4","Shanidar_Layer_D_Lower_6","Shanidar_Layer_D_Lower_8","Kebara_Couche_XII","Fontbregoua_H1","Fontbregoua_H3","Gran_Dolina_TD6","El_Mirador_MIR4A","Goughs_Cave","5MT-3","5MT-10010_Feature_3","El_Miron","La_Tolita_Cama_de_Huesos","Crow_Creek_Adults","Krapina","Liang_Bua_Layer_R","Liang_Bua_Layer_OQ","Dmanisi_Layer_B1y","Malapa_Adults","AL_333_Adults","Unscavenged_human_corpses_WA_Adults","Scavenged_human_corpses_WA_Adults","Scavenged_human_corpses_NM_1","Scavenged_human_corpses_NM_2","Scavenged_human_corpses_NM_3","Scavenged_human_corpse_NC","Mapungubwe_leopard_kills","Leopard_refuse","Misgrot_Cave","Sima_de_los_Huesos_Adults","Dinaledi"],["Primary hominin interment","Primary hominin interment","Primary hominin interment","Primary hominin interment","Primary hominin interment","Primary hominin interment","Primary hominin interment","Primary hominin interment","Primary hominin interment","Primary hominin interment","Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Hominin canibalism/ secondary interment","Hominin canibalism/ secondary interment","Hominin canibalism/ secondary interment","Hominin canibalism/ secondary interment","Hominin canibalism/ secondary interment","Hominin canibalism/ secondary interment","Hominin canibalism/ secondary interment","Possible Primary hominin interment","Hominin canibalism/ secondary interment","Hominin canibalism/ secondary interment","Hominin canibalism/ secondary interment","Nonantrhopogenic hominin accumulation","Nonantrhopogenic hominin accumulation","Nonantrhopogenic hominin accumulation","Nonantrhopogenic hominin accumulation","Nonantrhopogenic hominin accumulation","Unscavenged human corpses","Scavenged human corpses","Scavenged human corpses","Scavenged human corpses","Scavenged human corpses","Scavenged human corpses","Leopard refuse","Leopard refuse","Natural Baboon accumulation","Possible hominin deliberate disposal","Possible hominin deliberate disposal"],[1,1,1,1,1,1,38,68,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,7,0,0,5,2,4,4,1,6,277,20,1,0,4,1,4,16,44,4,2,1,1,7,8,7,13,6],[1,1,1,1,1,1,34,64,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,6,0,2,4,3,8,3,1,9,309,12,1,1,3,1,6,17,39,3,2,1,1,6,8,4,15,7],[7,7,7,2,0,7,254,288,7,7,7,0,0,0,7,0,0,0,0,7,6,0,4,0,1,7,5,0,0,7,4,2,2,1,7,15,12,4,2,1318,22,1,1,0,1,4,119,227,8,6,4,1,13,13,19,42,7],[12,12,12,12,9,12,452,534,12,12,12,0,0,12,12,0,0,0,0,9,9,8,10,12,0,8,7,0,0,12,0,0,0,6,3,5,21,8,22,3132,12,1,0,0,3,2,203,418,4,6,8,11,32,20,24,46,13],[5,5,5,0,5,5,193,252,5,5,5,0,0,5,5,0,2,0,0,4,4,0,5,5,0,4,4,4,0,5,0,0,0,2,0,3,11,2,13,1498,21,1,0,0,0,1,80,180,10,1,2,5,30,13,10,19,3],[1,1,1,1,1,1,39,52,1,1,1,0,0,1,1,0,1,0,1,1,1,0,1,1,0,0,1,0,0,1,0,1,0,0,0,1,1,null,3,347,0,0,0,0,0,0,17,34,2,1,0,1,4,4,2,5,1],[1,1,1,1,1,1,0,0,0,1,1,0,0,1,0,0,1,0,1,1,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,null,3,44,0,1,0,0,1,0,14,27,0,0,0,0,2,0,1,4,1],[2,2,2,2,2,2,81,103,2,2,2,0,0,2,2,1,1,0,2,2,1,2,2,2,0,0,0,0,0,2,3,3,1,0,3,12,4,1,7,197,10,1,0,2,2,2,11,54,1,2,1,2,2,0,3,9,5],[24,24,24,24,18,24,901,993,24,24,23,0,0,17,15,0,1,0,24,6,10,20,14,20,8,0,20,0,0,24,0,9,7,7,34,34,61,14,32,2505,63,1,0,2,3,4,402,753,7,0,0,17,93,55,41,60,28],[2,2,2,2,2,2,78,105,2,2,2,0,0,1,2,0,1,1,2,0,1,1,2,2,1,2,2,0,0,2,2,6,0,1,4,3,9,2,6,453,13,0,1,1,2,0,32,55,2,3,1,2,7,8,10,14,6],[2,2,2,2,2,2,73,129,2,2,2,2,0,2,2,1,2,1,2,2,2,2,2,2,0,0,2,2,2,2,3,6,1,1,5,6,6,null,15,393,13,1,0,1,2,4,32,48,2,1,1,2,12,15,10,12,8],[2,2,2,2,2,2,77,121,2,2,2,1,0,2,2,1,2,1,2,2,2,1,1,1,1,0,2,2,1,2,2,4,2,0,4,6,6,null,6,234,9,0,1,0,1,1,38,44,1,1,0,0,11,11,6,14,6],[2,2,2,2,2,2,74,109,2,2,2,2,0,2,2,1,2,1,2,2,2,2,1,2,2,0,2,2,0,2,0,5,0,2,6,5,6,null,12,251,7,2,1,0,1,4,31,39,3,1,0,1,12,11,8,13,5],[14,14,16,10,0,16,520,388,8,0,4,0,0,15,7,0,0,8,16,7,2,7,2,6,4,0,10,2,1,15,0,0,2,1,0,18,9,6,5,93,1,5,3,0,7,4,192,188,0,1,0,0,27,27,24,94,17],[10,10,10,8,5,10,416,472,10,3,4,0,0,10,4,0,0,5,10,8,4,5,4,4,3,0,10,5,0,9,0,0,2,1,1,17,18,4,8,51,4,1,2,0,5,19,null,null,null,null,null,0,15,20,15,36,23],[2,2,2,2,2,2,77,120,2,2,2,0,0,2,1,2,2,1,2,2,2,2,2,2,1,0,2,1,0,2,0,1,0,0,2,6,4,2,13,952,12,2,0,0,2,0,34,69,6,2,2,2,10,10,6,18,9],[2,2,2,2,2,2,86,133,2,2,2,0,1,2,2,2,1,2,2,1,2,2,1,1,2,0,2,2,0,1,3,4,1,1,5,5,3,null,19,706,14,2,0,1,1,5,34,65,7,2,1,2,13,15,10,9,14],[2,2,2,2,1,2,68,77,2,2,2,0,0,2,0,0,0,null,2,2,2,0,2,0,2,0,1,1,0,0,0,0,2,0,0,3,1,2,3,38,15,2,1,1,1,0,29,34,1,2,0,2,3,0,2,11,4],[2,2,2,2,2,2,66,121,2,2,2,0,1,2,2,2,2,2,2,1,2,2,2,2,2,1,2,2,0,0,2,9,0,2,3,6,4,1,18,505,13,3,0,1,2,4,33,57,4,1,1,2,11,15,5,10,9],[2,2,2,2,2,2,68,104,2,2,2,0,1,2,1,1,2,2,2,2,1,2,2,2,2,1,2,2,1,0,3,3,0,2,3,8,4,2,18,426,14,2,0,0,2,4,33,51,4,1,0,2,9,11,2,9,8],[11,14,14,10,10,14,434,572,7,2,7,0,0,13,0,4,3,14,14,4,2,13,12,13,0,0,9,3,1,0,2,0,2,3,2,24,11,6,19,548,18,10,0,2,2,9,115,171,2,7,0,14,26,35,14,104,34],[7,10,10,5,6,10,390,448,4,0,7,0,0,10,1,0,1,10,10,3,8,6,8,7,0,0,7,4,6,0,0,0,3,0,0,29,13,7,18,294,12,10,0,7,null,7,null,null,null,null,null,10,16,20,15,33,21],[28,26,28,14,6,28,811,721,14,8,8,0,0,15,6,0,0,16,28,23,2,5,0,11,0,0,19,9,0,22,7,2,5,0,1,35.5,60,13,14,44,48,5,8,2,15,25,null,null,null,null,null,0,39,59,37.5,210,76],[0,0,0,0,0,11,423,423,6,0,3,0,0,17,0,0,0,26,24,11,2,5,1,2,0,0,19,2,5,0,2,0,7,0,0,35.5,16,21,7,11,32,10,0,1,2,23,null,null,null,null,null,28,39,59,37.5,153,32],[38,36,38,22,11,38,1227,1193,24,11,12,0,0,25,10,0,0,21,38,31,6,10,4,15,10,0,29,14,0,31,7,2,7,1,2,52.5,78,17,22,95,52,6,10,1,20,44,467,446,14,9,0,0,54,79,52.5,246,93],[7,10,10,5,6,21,813,871,10,0,10,0,0,27,1,0,1,36,34,14,10,11,9,9,0,0,28,6,11,0,2,0,10,0,0,64.5,29,28,25,305,44,20,0,12,2,30,406,595,0,9,0,38,55,79,52.5,186,66]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Ref<\/th>\n      <th>Study<\/th>\n      <th>Type<\/th>\n      <th>Cranium<\/th>\n      <th>Mandible<\/th>\n      <th>Cervical<\/th>\n      <th>Thoracic<\/th>\n      <th>Lumbar<\/th>\n      <th>Sacrum<\/th>\n      <th>Sternum<\/th>\n      <th>Clavicle<\/th>\n      <th>Rib<\/th>\n      <th>Scapula<\/th>\n      <th>Humerus<\/th>\n      <th>Radius<\/th>\n      <th>Ulna<\/th>\n      <th>Carpal<\/th>\n      <th>Metacarpal<\/th>\n      <th>Innominate<\/th>\n      <th>Femur<\/th>\n      <th>Patella<\/th>\n      <th>Tibia<\/th>\n      <th>Fibula<\/th>\n      <th>Tarsal<\/th>\n      <th>Metatarsal<\/th>\n      <th>Hand_phalanx<\/th>\n      <th>Foot_phalanx<\/th>\n      <th>Hand_metacarpals_manual_phalanges_<\/th>\n      <th>Foot_metatarsals_pedal_phalanges_<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":true,"pageLength":6,"dom":"Bfrtip","buttons":["copy","print",{"extend":"collection","buttons":["csv","excel","pdf"],"text":"Download"}],"columnDefs":[{"className":"dt-right","targets":[4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false,"lengthMenu":[6,10,25,50,100]}},"evals":[],"jsHooks":[]}</script>
```

Guardaremos ahora este conjunto **completo** de datos como `Summary_Dataset_Multivar.csv`.


```r
write_csv(x = Summary_Dataset_Multivar, file = "OUTPUT/Summary_Dataset_Multivar.csv", col_names = TRUE)
```

*    Primate Skeletal Element Data

El total de ensambles de primates fue de 38. De éstos, se seleccionaron 14 además de los de la sima de los huesos (**SH**) y Dinaledi Chamber (**DC**). Ver los supplemental information para dilucidar los conjuntos de datos "*seleccionados*".

A este conjunto de datos que ha sido (o eso creemos) el que han usado en el artículo, le llamaremos `Dataset_skeletal_used` y lo guardaremos en la carpeta `OUTPUT` como `Dataset_skeletal_used.csv`


```r
Dataset_skeletal_used <- 
Summary_Dataset_Multivar %>% 
  filter(Ref %in% c("Pottery_Mound_Pueblo_IV", "Kuaua_Pueblo_Pueblo_IV", "Skhul_Layer_B", "Krapina", "Fontbregoua_H1", "Fontbregoua_H3", "Gran_Dolina_TD6", "El_Mirador_MIR4A", "AL_333", "Unscavenged_human_corpses_WA", "Scavenged_human_corpses_WA", "Mapungubwe_leopard_kills",  "Leopard_refuse", "Misgrot_Cave", "Sima_de_los_Huesos", "Dinaledi"))
```


```{=html}
<div id="htmlwidget-bf11006f4d3400d86d2b" style="width:100%;height:auto;" class="datatables html-widget "></div>
<script type="application/json" data-for="htmlwidget-bf11006f4d3400d86d2b">{"x":{"filter":"none","vertical":false,"extensions":["Buttons"],"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21"],["Pottery_Mound_Pueblo_IV","Kuaua_Pueblo_Pueblo_IV","Skhul_Layer_B","Skhul_Layer_B","Skhul_Layer_B","Skhul_Layer_B","Skhul_Layer_B","Skhul_Layer_B","Fontbregoua_H1","Fontbregoua_H3","Gran_Dolina_TD6","El_Mirador_MIR4A","Krapina","AL_333","Unscavenged_human_corpses_WA","Scavenged_human_corpses_WA","Mapungubwe_leopard_kills","Leopard_refuse","Misgrot_Cave","Sima_de_los_Huesos","Dinaledi"],["Pottery_Mound_Pueblo_IV","Kuaua_Pueblo_Pueblo_IV","Skhul_Layer_B_Skhul_II","Skhul_Layer_B_Skhul_III","Skhul_Layer_B_Skhul_IV","Skhul_Layer_B_Skhul_V","Skhul_Layer_B_Skhul_VI","Skhul_Layer_B_Skhul_VII","Fontbregoua_H1","Fontbregoua_H3","Gran_Dolina_TD6","El_Mirador_MIR4A","Krapina","AL_333_Adults","Unscavenged_human_corpses_WA_Adults","Scavenged_human_corpses_WA_Adults","Mapungubwe_leopard_kills","Leopard_refuse","Misgrot_Cave","Sima_de_los_Huesos_Adults","Dinaledi"],["Primary hominin interment","Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Possible Primary hominin interment","Hominin canibalism/ secondary interment","Hominin canibalism/ secondary interment","Hominin canibalism/ secondary interment","Hominin canibalism/ secondary interment","Hominin canibalism/ secondary interment","Nonantrhopogenic hominin accumulation","Unscavenged human corpses","Scavenged human corpses","Leopard refuse","Leopard refuse","Natural Baboon accumulation","Possible hominin deliberate disposal","Possible hominin deliberate disposal"],[38,68,1,0,1,1,1,1,7,0,0,5,20,4,16,44,7,8,7,13,6],[34,64,1,0,1,1,1,1,6,0,2,4,12,6,17,39,6,8,4,15,7],[254,288,0,0,0,7,0,0,4,2,2,1,22,4,119,227,13,13,19,42,7],[452,534,0,0,12,12,0,0,0,0,0,6,12,2,203,418,32,20,24,46,13],[193,252,0,0,5,5,0,2,0,0,0,2,21,1,80,180,30,13,10,19,3],[39,52,0,0,1,1,0,1,0,1,0,0,0,0,17,34,4,4,2,5,1],[0,0,0,0,1,0,0,1,0,0,0,0,0,0,14,27,2,0,1,4,1],[81,103,0,0,2,2,1,1,3,3,1,0,10,2,11,54,2,0,3,9,5],[901,993,0,0,17,15,0,1,0,9,7,7,63,4,402,753,93,55,41,60,28],[78,105,0,0,1,2,0,1,2,6,0,1,13,0,32,55,7,8,10,14,6],[73,129,2,0,2,2,1,2,3,6,1,1,13,4,32,48,12,15,10,12,8],[77,121,1,0,2,2,1,2,2,4,2,0,9,1,38,44,11,11,6,14,6],[74,109,2,0,2,2,1,2,0,5,0,2,7,4,31,39,12,11,8,13,5],[520,388,0,0,15,7,0,0,0,0,2,1,1,4,192,188,27,27,24,94,17],[416,472,0,0,10,4,0,0,0,0,2,1,4,19,null,null,15,20,15,36,23],[77,120,0,0,2,1,2,2,0,1,0,0,12,0,34,69,10,10,6,18,9],[86,133,0,1,2,2,2,1,3,4,1,1,14,5,34,65,13,15,10,9,14],[68,77,0,0,2,0,0,0,0,0,2,0,15,0,29,34,3,0,2,11,4],[66,121,0,1,2,2,2,2,2,9,0,2,13,4,33,57,11,15,5,10,9],[68,104,0,1,2,1,1,2,3,3,0,2,14,4,33,51,9,11,2,9,8],[434,572,0,0,13,0,4,3,2,0,2,3,18,9,115,171,26,35,14,104,34],[390,448,0,0,10,1,0,1,0,0,3,0,12,7,null,null,16,20,15,33,21],[811,721,0,0,15,6,0,0,7,2,5,0,48,25,null,null,39,59,37.5,210,76],[423,423,0,0,17,0,0,0,2,0,7,0,32,23,null,null,39,59,37.5,153,32],[1227,1193,0,0,25,10,0,0,7,2,7,1,52,44,467,446,54,79,52.5,246,93],[813,871,0,0,27,1,0,1,2,0,10,0,44,30,406,595,55,79,52.5,186,66]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Ref<\/th>\n      <th>Study<\/th>\n      <th>Type<\/th>\n      <th>Cranium<\/th>\n      <th>Mandible<\/th>\n      <th>Cervical<\/th>\n      <th>Thoracic<\/th>\n      <th>Lumbar<\/th>\n      <th>Sacrum<\/th>\n      <th>Sternum<\/th>\n      <th>Clavicle<\/th>\n      <th>Rib<\/th>\n      <th>Scapula<\/th>\n      <th>Humerus<\/th>\n      <th>Radius<\/th>\n      <th>Ulna<\/th>\n      <th>Carpal<\/th>\n      <th>Metacarpal<\/th>\n      <th>Innominate<\/th>\n      <th>Femur<\/th>\n      <th>Patella<\/th>\n      <th>Tibia<\/th>\n      <th>Fibula<\/th>\n      <th>Tarsal<\/th>\n      <th>Metatarsal<\/th>\n      <th>Hand_phalanx<\/th>\n      <th>Foot_phalanx<\/th>\n      <th>Hand_metacarpals_manual_phalanges_<\/th>\n      <th>Foot_metatarsals_pedal_phalanges_<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":true,"pageLength":6,"dom":"Bfrtip","buttons":["copy","print",{"extend":"collection","buttons":["csv","excel","pdf"],"text":"Download"}],"columnDefs":[{"className":"dt-right","targets":[4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false,"lengthMenu":[6,10,25,50,100]}},"evals":[],"jsHooks":[]}</script>
```


Guardaremos ahora este conjunto **filtrado** de datos como `Dataset_skeletal_used.csv`.


```r
write_csv(x = Dataset_skeletal_used, file = "OUTPUT/Dataset_skeletal_used.csv", col_names = TRUE)
```

<br>

### Análisis somero del material suplementario

Aquí se destacan algunos puntos clave del documento mismo.

El objetivo del análisis exploratorio es doble: (i) identificar el número óptimo de grupos representados por los ensamblajes de homínidos y (ii) determinar la pertenencia de cada grupo identificado. Muchos algoritmos de agrupación tienden a funcionar mal cuando, como es el caso aquí, el número de variables (elementos esqueléticos = 23) excede sustancialmente el tamaño de la muestra (ensamblajes de homínidos = 16). Para abordar esta discrepancia, utilizamos un análisis de RF en los 16 ensamblajes, incluidos SH y DC, para identificar un subconjunto de elementos esqueléticos que es más pequeño que el tamaño de la muestra y explica la mayor cantidad de variación (120). Para identificar el número óptimo de grupos representados por los 16 ensamblajes, los elementos esqueléticos con un valor de MDA > 5 después de la generación de 500 árboles se ingresan en la biblioteca R "NbClust", que ejecuta y combina 30 algoritmos de agrupamiento diferentes. Luego, un análisis de k-medias clasifica cada uno de los conjuntos comparativos en uno de los grupos reconocidos por las funciones NbClust. La fuerza de la asignación de grupos se evalúa con la función gráfica "clusplot", que proporciona elipses y gráficos de silueta con un 95 % de confianza, que estiman el valor s(i) de cada conjunto comparativo. Una comparación de distancias dentro y entre grupos da como resultado valores de s(i) que van desde 1 (clasificación fuerte dentro de un grupo) hasta 0 (clasificación parsimoniosa pero débil dentro de un grupo). Esta clasificación preliminar establece un marco para la aplicación de una variedad de métodos de aprendizaje automático que pueden identificar los ensamblajes comparativos que mejor coinciden con las concentraciones de homínidos de SH y DC.

Antes de la construcción del modelo, todos los datos de las partes del esqueleto se someten a una transformación de centro y escala

Para elegir el mejor modelo para el análisis, utilizamos el remuestreo de validación cruzada con exclusión de grupo de Monte-Carlo. Esto crea múltiples divisiones de conjuntos de entrenamiento/conjuntos de prueba y es más sólido con muestras pequeñas que los métodos de validación cruzada de bootstrapping, bagging y k-fold.

Los modelos producidos por cada método de aprendizaje automático después de 30 iteraciones se evalúan con κ de Cohen.

Finalmente, realizamos una CA no supervisada con puntajes de carga de PCA.

<br>

## Pasos a seguir y algunas ideas
Aseguran que los huesos de *SH* presentan mucha perturbación (tipo carroña) y por ende no podrían ser clasificados como rito mortuorio. Sin embargo no muestran un análisis detallado de los rastros de "huellas" de carroñeo que presentan ni los datos que (entiendo) posee el grupo de Nohemí.

Quizás a nivel de Algoritmo (como tal) no se puede indagar mucho (porque probablemente muestren algo similar), pero sí a nivel de incluir datos nuevos que no estén incluidos y ya sea repitiendo la aproximación de ellos o agregando alguna nueva, los resultados sean diferentes apoyando (esta vez) la idea de que los restos en **SH** están allí por un acto "ritual de muerte" y no por simple acumulación transporte.

<br>

## Repetición de los análisis

### Exploratory Analysis

<br>

#### Random Forest (RF)
Se realizó un RF a los 16 assemblages para evaluar que atributos (partes del cuerpo) poseían una mayor variabilidad, a través del MDA (*Mean Decrease Accuracy*) y el MDG (*Mean Decrease Gini*).

Encontraron que siete (7) elementos esqueléticos (o grupos de elementos) fueron aquellos que tuvieron un MDA > 5. 

* **Random Forest** usando el paquete `randomForest`

HASTA AQUI EL AVANCE. 


```r
RF_Data <-
  Dataset_skeletal_used %>% 
  select(Type:Foot_metatarsals_pedal_phalanges_) %>% 
  mutate(Type = factor(Type)) #%>%
  #drop_na()

#RF_Data
```



    *    Supervisado

```r
RF_Sup <- randomForest(
  Type ~ .,
  data = RF_Data,
  ntree = 2000,
  mtry = 2,
  importance = TRUE,
  na.action = na.omit
)
```



```r
data.frame(Gini = sort(importance(rf1, type = 2)[,], decreasing = T))

varImpPlot(rf1)
```


<br>

#### K-means análisis
