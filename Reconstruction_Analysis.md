Reconstrucción de Egeland et al., 2018: ‘Hominin skeletal part
abundances…’
================
Antonio Canepa-Oneto
Last compiled on 14 junio, 2023

## Introducción

Se hace una mini-revisión de lo reportado en *Hominin skeletal part
abundances and claims of deliberate disposal of corpses in the Middle
Pleistocene* <https://doi.org/10.1073/pnas.1718678115>

Los procesos funerarios humanos tiene una antiguedad determinada (desde
cuándo somos conscientes de nuestra muerte) que está bajo escrutinio y
constante debate. Gracias a un estudio de diversos yacimientos se
intenta esclarecer ese posible supuesto de primer origen de
enterramientos funerarios para los yacimientos de Atapuerca (**SH**) y
Sudáfrica (**DC**).

Cuando se encuentra y analiza un yacimiento de homínidos (u homininos
para ser más precisos) es posible que no todos los huesos estén en
perfecto estado y más notable aún es posible que no todos los huesos
estén presentes. La ausencia de determinados huesos puede deberse a
procesos aleatorios (deterioro, rompimiento, etc), semi-aleatorios
(consumo de carroña de partes específicas) o altamente selectivos (ritos
funerarios).

Afortunamente existe una cantidad interesante de yacimientos con restos
humanos y de primates (“cercanos”) que pueden dar pistas de si los
yacimientos **SH** y **DC** pueden (o no) considerarse procesos rituales
(muy específicos) o simplemente procesos aleatorios y/o semi-aleatorios.

### Objetivos

Los objetivos del artículo son tratar de comparar los yacimientos de
**SH** y **DC** con yacimientos conocidos para determinar si la
estructura (como composición unitaria, no como forma) de huesos
disponibles es ás característico de un rito funerario o de un proceso de
pérdida aleatorio (descomposición) o semi-aleatorio (carroña).

#### Diseño de Análisis

La idea general es que ellos comparan los huesos encontrados (“*Hominin
skeletal part representation* - **HSPR**”) con otros 14 yacimientos
entre los cuales existen algunos de humanos en estado “completo” en el
que no le falta ninguna pieza.

Para eso ellos:

1.- Usando un Random Forest (RF) determinan cuáles son las piezas de
huesos con más variabilidad (Gini idex y MDA), para utilizarlas luego en
la creación/clasificación de grupos.

2.- Usando un primer k-means logran crear dos grupos de “HSPR”, en los
que los huesos humanos “completos” y otros yacimientos en buen estado
quedan juntos en un cluster y el segundo cluster atribuyen a carroña,
canibalismo, etc. mostrando un proceso de acumulación natural (**no
ritual**).

3.- Repiten el k-means con más grupos y encuentran un gradiente de
conservación de 4 grupos desde los más completos hasta los netamente
depredados/erosionados.

4.- Usando herramientas supervisadas intentan clasificar los yacimientos
(todos) con especial interés en **SH** y **DC** en alguno de los grupos
ya reconocidos por los k-means anteriores.

5.- Usando herramientas no-supervisadas intentan agrupar los yacimientos
(todos) con especial interés en **SH** y **DC** para ver si coinciden
con las características/grupos encontradas en los k-means anteriores.

El conjunto de datos se entrega de manera desagregada, dificultando los
análisis por lo que he procedido a recopilarlo todo en un único
documento. El documento original entregado como “material suplementario”
se puede encontrar
[aquí](https://www.pnas.org/doi/suppl/10.1073/pnas.1718678115/suppl_file/pnas.1718678115.sd01.xlsx).

El connjunto de datos recopilado (solo las primeras 15 filas) se muestra
a continuación:

``` r
Summary_Dataset <- read_csv("INPUT/DATA/Summary_Dataset.csv")

Summary_Dataset %>% 
  slice_head(n = 15) %>% 
  gt()
```

<div id="tvzekhvgtt" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#tvzekhvgtt table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#tvzekhvgtt thead, #tvzekhvgtt tbody, #tvzekhvgtt tfoot, #tvzekhvgtt tr, #tvzekhvgtt td, #tvzekhvgtt th {
  border-style: none;
}
&#10;#tvzekhvgtt p {
  margin: 0;
  padding: 0;
}
&#10;#tvzekhvgtt .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#tvzekhvgtt .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#tvzekhvgtt .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#tvzekhvgtt .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#tvzekhvgtt .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#tvzekhvgtt .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#tvzekhvgtt .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#tvzekhvgtt .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#tvzekhvgtt .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#tvzekhvgtt .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#tvzekhvgtt .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#tvzekhvgtt .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#tvzekhvgtt .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#tvzekhvgtt .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#tvzekhvgtt .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#tvzekhvgtt .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#tvzekhvgtt .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#tvzekhvgtt .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#tvzekhvgtt .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#tvzekhvgtt .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#tvzekhvgtt .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#tvzekhvgtt .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#tvzekhvgtt .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#tvzekhvgtt .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#tvzekhvgtt .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#tvzekhvgtt .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#tvzekhvgtt .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#tvzekhvgtt .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#tvzekhvgtt .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#tvzekhvgtt .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#tvzekhvgtt .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#tvzekhvgtt .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#tvzekhvgtt .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#tvzekhvgtt .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#tvzekhvgtt .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#tvzekhvgtt .gt_left {
  text-align: left;
}
&#10;#tvzekhvgtt .gt_center {
  text-align: center;
}
&#10;#tvzekhvgtt .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#tvzekhvgtt .gt_font_normal {
  font-weight: normal;
}
&#10;#tvzekhvgtt .gt_font_bold {
  font-weight: bold;
}
&#10;#tvzekhvgtt .gt_font_italic {
  font-style: italic;
}
&#10;#tvzekhvgtt .gt_super {
  font-size: 65%;
}
&#10;#tvzekhvgtt .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#tvzekhvgtt .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#tvzekhvgtt .gt_indent_1 {
  text-indent: 5px;
}
&#10;#tvzekhvgtt .gt_indent_2 {
  text-indent: 10px;
}
&#10;#tvzekhvgtt .gt_indent_3 {
  text-indent: 15px;
}
&#10;#tvzekhvgtt .gt_indent_4 {
  text-indent: 20px;
}
&#10;#tvzekhvgtt .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Ref">Ref</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Study">Study</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Cranium">Cranium</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Mandible">Mandible</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Cervical">Cervical</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Thoracic">Thoracic</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Lumbar">Lumbar</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Sacrum">Sacrum</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Sternum">Sternum</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Clavicle">Clavicle</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Rib">Rib</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Scapula">Scapula</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Humerus">Humerus</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Radius">Radius</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Ulna">Ulna</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Carpal">Carpal</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Metacarpal">Metacarpal</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Innominate">Innominate</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Femur">Femur</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Patella">Patella</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Tibia">Tibia</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Fibula">Fibula</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Tarsal">Tarsal</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Metatarsal">Metatarsal</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Hand phalanx">Hand phalanx</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Foot phalanx">Foot phalanx</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Hand (metacarpals + manual phalanges)">Hand (metacarpals + manual phalanges)</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Foot (metatarsals + pedal phalanges)">Foot (metatarsals + pedal phalanges)</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Ref" class="gt_row gt_left">Hummingbird_Pueblo_Pueblo_I</td>
<td headers="Study" class="gt_row gt_left">Hummingbird_Pueblo_Pueblo_I_4202</td>
<td headers="Cranium" class="gt_row gt_right">1</td>
<td headers="Mandible" class="gt_row gt_right">1</td>
<td headers="Cervical" class="gt_row gt_right">7</td>
<td headers="Thoracic" class="gt_row gt_right">12</td>
<td headers="Lumbar" class="gt_row gt_right">5</td>
<td headers="Sacrum" class="gt_row gt_right">1</td>
<td headers="Sternum" class="gt_row gt_right">1</td>
<td headers="Clavicle" class="gt_row gt_right">2</td>
<td headers="Rib" class="gt_row gt_right">24</td>
<td headers="Scapula" class="gt_row gt_right">2</td>
<td headers="Humerus" class="gt_row gt_right">2</td>
<td headers="Radius" class="gt_row gt_right">2</td>
<td headers="Ulna" class="gt_row gt_right">2</td>
<td headers="Carpal" class="gt_row gt_right">14</td>
<td headers="Metacarpal" class="gt_row gt_right">10</td>
<td headers="Innominate" class="gt_row gt_right">2</td>
<td headers="Femur" class="gt_row gt_right">2</td>
<td headers="Patella" class="gt_row gt_right">2</td>
<td headers="Tibia" class="gt_row gt_right">2</td>
<td headers="Fibula" class="gt_row gt_right">2</td>
<td headers="Tarsal" class="gt_row gt_right">11</td>
<td headers="Metatarsal" class="gt_row gt_right">7</td>
<td headers="Hand phalanx" class="gt_row gt_right">28</td>
<td headers="Foot phalanx" class="gt_row gt_right">0</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">38</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">7</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Hummingbird_Pueblo_Pueblo_I</td>
<td headers="Study" class="gt_row gt_left">Hummingbird_Pueblo_Pueblo_I_4203</td>
<td headers="Cranium" class="gt_row gt_right">1</td>
<td headers="Mandible" class="gt_row gt_right">1</td>
<td headers="Cervical" class="gt_row gt_right">7</td>
<td headers="Thoracic" class="gt_row gt_right">12</td>
<td headers="Lumbar" class="gt_row gt_right">5</td>
<td headers="Sacrum" class="gt_row gt_right">1</td>
<td headers="Sternum" class="gt_row gt_right">1</td>
<td headers="Clavicle" class="gt_row gt_right">2</td>
<td headers="Rib" class="gt_row gt_right">24</td>
<td headers="Scapula" class="gt_row gt_right">2</td>
<td headers="Humerus" class="gt_row gt_right">2</td>
<td headers="Radius" class="gt_row gt_right">2</td>
<td headers="Ulna" class="gt_row gt_right">2</td>
<td headers="Carpal" class="gt_row gt_right">14</td>
<td headers="Metacarpal" class="gt_row gt_right">10</td>
<td headers="Innominate" class="gt_row gt_right">2</td>
<td headers="Femur" class="gt_row gt_right">2</td>
<td headers="Patella" class="gt_row gt_right">2</td>
<td headers="Tibia" class="gt_row gt_right">2</td>
<td headers="Fibula" class="gt_row gt_right">2</td>
<td headers="Tarsal" class="gt_row gt_right">14</td>
<td headers="Metatarsal" class="gt_row gt_right">10</td>
<td headers="Hand phalanx" class="gt_row gt_right">26</td>
<td headers="Foot phalanx" class="gt_row gt_right">0</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">36</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">10</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Hummingbird_Pueblo_Pueblo_I</td>
<td headers="Study" class="gt_row gt_left">Hummingbird_Pueblo_Pueblo_I_4205</td>
<td headers="Cranium" class="gt_row gt_right">1</td>
<td headers="Mandible" class="gt_row gt_right">1</td>
<td headers="Cervical" class="gt_row gt_right">7</td>
<td headers="Thoracic" class="gt_row gt_right">12</td>
<td headers="Lumbar" class="gt_row gt_right">5</td>
<td headers="Sacrum" class="gt_row gt_right">1</td>
<td headers="Sternum" class="gt_row gt_right">1</td>
<td headers="Clavicle" class="gt_row gt_right">2</td>
<td headers="Rib" class="gt_row gt_right">24</td>
<td headers="Scapula" class="gt_row gt_right">2</td>
<td headers="Humerus" class="gt_row gt_right">2</td>
<td headers="Radius" class="gt_row gt_right">2</td>
<td headers="Ulna" class="gt_row gt_right">2</td>
<td headers="Carpal" class="gt_row gt_right">16</td>
<td headers="Metacarpal" class="gt_row gt_right">10</td>
<td headers="Innominate" class="gt_row gt_right">2</td>
<td headers="Femur" class="gt_row gt_right">2</td>
<td headers="Patella" class="gt_row gt_right">2</td>
<td headers="Tibia" class="gt_row gt_right">2</td>
<td headers="Fibula" class="gt_row gt_right">2</td>
<td headers="Tarsal" class="gt_row gt_right">14</td>
<td headers="Metatarsal" class="gt_row gt_right">10</td>
<td headers="Hand phalanx" class="gt_row gt_right">28</td>
<td headers="Foot phalanx" class="gt_row gt_right">0</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">38</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">10</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Hummingbird_Pueblo_Pueblo_I</td>
<td headers="Study" class="gt_row gt_left">Hummingbird_Pueblo_Pueblo_I_7101</td>
<td headers="Cranium" class="gt_row gt_right">1</td>
<td headers="Mandible" class="gt_row gt_right">1</td>
<td headers="Cervical" class="gt_row gt_right">2</td>
<td headers="Thoracic" class="gt_row gt_right">12</td>
<td headers="Lumbar" class="gt_row gt_right">0</td>
<td headers="Sacrum" class="gt_row gt_right">1</td>
<td headers="Sternum" class="gt_row gt_right">1</td>
<td headers="Clavicle" class="gt_row gt_right">2</td>
<td headers="Rib" class="gt_row gt_right">24</td>
<td headers="Scapula" class="gt_row gt_right">2</td>
<td headers="Humerus" class="gt_row gt_right">2</td>
<td headers="Radius" class="gt_row gt_right">2</td>
<td headers="Ulna" class="gt_row gt_right">2</td>
<td headers="Carpal" class="gt_row gt_right">10</td>
<td headers="Metacarpal" class="gt_row gt_right">8</td>
<td headers="Innominate" class="gt_row gt_right">2</td>
<td headers="Femur" class="gt_row gt_right">2</td>
<td headers="Patella" class="gt_row gt_right">2</td>
<td headers="Tibia" class="gt_row gt_right">2</td>
<td headers="Fibula" class="gt_row gt_right">2</td>
<td headers="Tarsal" class="gt_row gt_right">10</td>
<td headers="Metatarsal" class="gt_row gt_right">5</td>
<td headers="Hand phalanx" class="gt_row gt_right">14</td>
<td headers="Foot phalanx" class="gt_row gt_right">0</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">22</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">5</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Hummingbird_Pueblo_Pueblo_I</td>
<td headers="Study" class="gt_row gt_left">Hummingbird_Pueblo_Pueblo_I_7501</td>
<td headers="Cranium" class="gt_row gt_right">1</td>
<td headers="Mandible" class="gt_row gt_right">1</td>
<td headers="Cervical" class="gt_row gt_right">0</td>
<td headers="Thoracic" class="gt_row gt_right">9</td>
<td headers="Lumbar" class="gt_row gt_right">5</td>
<td headers="Sacrum" class="gt_row gt_right">1</td>
<td headers="Sternum" class="gt_row gt_right">1</td>
<td headers="Clavicle" class="gt_row gt_right">2</td>
<td headers="Rib" class="gt_row gt_right">18</td>
<td headers="Scapula" class="gt_row gt_right">2</td>
<td headers="Humerus" class="gt_row gt_right">2</td>
<td headers="Radius" class="gt_row gt_right">2</td>
<td headers="Ulna" class="gt_row gt_right">2</td>
<td headers="Carpal" class="gt_row gt_right">0</td>
<td headers="Metacarpal" class="gt_row gt_right">5</td>
<td headers="Innominate" class="gt_row gt_right">2</td>
<td headers="Femur" class="gt_row gt_right">2</td>
<td headers="Patella" class="gt_row gt_right">1</td>
<td headers="Tibia" class="gt_row gt_right">2</td>
<td headers="Fibula" class="gt_row gt_right">2</td>
<td headers="Tarsal" class="gt_row gt_right">10</td>
<td headers="Metatarsal" class="gt_row gt_right">6</td>
<td headers="Hand phalanx" class="gt_row gt_right">6</td>
<td headers="Foot phalanx" class="gt_row gt_right">0</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">11</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">6</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Hummingbird_Pueblo_Pueblo_I</td>
<td headers="Study" class="gt_row gt_left">Hummingbird_Pueblo_Pueblo_I_79</td>
<td headers="Cranium" class="gt_row gt_right">1</td>
<td headers="Mandible" class="gt_row gt_right">1</td>
<td headers="Cervical" class="gt_row gt_right">7</td>
<td headers="Thoracic" class="gt_row gt_right">12</td>
<td headers="Lumbar" class="gt_row gt_right">5</td>
<td headers="Sacrum" class="gt_row gt_right">1</td>
<td headers="Sternum" class="gt_row gt_right">1</td>
<td headers="Clavicle" class="gt_row gt_right">2</td>
<td headers="Rib" class="gt_row gt_right">24</td>
<td headers="Scapula" class="gt_row gt_right">2</td>
<td headers="Humerus" class="gt_row gt_right">2</td>
<td headers="Radius" class="gt_row gt_right">2</td>
<td headers="Ulna" class="gt_row gt_right">2</td>
<td headers="Carpal" class="gt_row gt_right">16</td>
<td headers="Metacarpal" class="gt_row gt_right">10</td>
<td headers="Innominate" class="gt_row gt_right">2</td>
<td headers="Femur" class="gt_row gt_right">2</td>
<td headers="Patella" class="gt_row gt_right">2</td>
<td headers="Tibia" class="gt_row gt_right">2</td>
<td headers="Fibula" class="gt_row gt_right">2</td>
<td headers="Tarsal" class="gt_row gt_right">14</td>
<td headers="Metatarsal" class="gt_row gt_right">10</td>
<td headers="Hand phalanx" class="gt_row gt_right">28</td>
<td headers="Foot phalanx" class="gt_row gt_right">11</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">38</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">21</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Pottery_Mound_Pueblo_IV</td>
<td headers="Study" class="gt_row gt_left">Pottery_Mound_Pueblo_IV</td>
<td headers="Cranium" class="gt_row gt_right">38</td>
<td headers="Mandible" class="gt_row gt_right">34</td>
<td headers="Cervical" class="gt_row gt_right">254</td>
<td headers="Thoracic" class="gt_row gt_right">452</td>
<td headers="Lumbar" class="gt_row gt_right">193</td>
<td headers="Sacrum" class="gt_row gt_right">39</td>
<td headers="Sternum" class="gt_row gt_right">0</td>
<td headers="Clavicle" class="gt_row gt_right">81</td>
<td headers="Rib" class="gt_row gt_right">901</td>
<td headers="Scapula" class="gt_row gt_right">78</td>
<td headers="Humerus" class="gt_row gt_right">73</td>
<td headers="Radius" class="gt_row gt_right">77</td>
<td headers="Ulna" class="gt_row gt_right">74</td>
<td headers="Carpal" class="gt_row gt_right">520</td>
<td headers="Metacarpal" class="gt_row gt_right">416</td>
<td headers="Innominate" class="gt_row gt_right">77</td>
<td headers="Femur" class="gt_row gt_right">86</td>
<td headers="Patella" class="gt_row gt_right">68</td>
<td headers="Tibia" class="gt_row gt_right">66</td>
<td headers="Fibula" class="gt_row gt_right">68</td>
<td headers="Tarsal" class="gt_row gt_right">434</td>
<td headers="Metatarsal" class="gt_row gt_right">390</td>
<td headers="Hand phalanx" class="gt_row gt_right">811</td>
<td headers="Foot phalanx" class="gt_row gt_right">423</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">1227</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">813</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Kuaua_Pueblo_Pueblo_IV</td>
<td headers="Study" class="gt_row gt_left">Kuaua_Pueblo_Pueblo_IV</td>
<td headers="Cranium" class="gt_row gt_right">68</td>
<td headers="Mandible" class="gt_row gt_right">64</td>
<td headers="Cervical" class="gt_row gt_right">288</td>
<td headers="Thoracic" class="gt_row gt_right">534</td>
<td headers="Lumbar" class="gt_row gt_right">252</td>
<td headers="Sacrum" class="gt_row gt_right">52</td>
<td headers="Sternum" class="gt_row gt_right">0</td>
<td headers="Clavicle" class="gt_row gt_right">103</td>
<td headers="Rib" class="gt_row gt_right">993</td>
<td headers="Scapula" class="gt_row gt_right">105</td>
<td headers="Humerus" class="gt_row gt_right">129</td>
<td headers="Radius" class="gt_row gt_right">121</td>
<td headers="Ulna" class="gt_row gt_right">109</td>
<td headers="Carpal" class="gt_row gt_right">388</td>
<td headers="Metacarpal" class="gt_row gt_right">472</td>
<td headers="Innominate" class="gt_row gt_right">120</td>
<td headers="Femur" class="gt_row gt_right">133</td>
<td headers="Patella" class="gt_row gt_right">77</td>
<td headers="Tibia" class="gt_row gt_right">121</td>
<td headers="Fibula" class="gt_row gt_right">104</td>
<td headers="Tarsal" class="gt_row gt_right">572</td>
<td headers="Metatarsal" class="gt_row gt_right">448</td>
<td headers="Hand phalanx" class="gt_row gt_right">721</td>
<td headers="Foot phalanx" class="gt_row gt_right">423</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">1193</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">871</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Dolni_Vestonice_I_DV_3</td>
<td headers="Study" class="gt_row gt_left">Dolni_Vestonice_I_DV_3</td>
<td headers="Cranium" class="gt_row gt_right">1</td>
<td headers="Mandible" class="gt_row gt_right">1</td>
<td headers="Cervical" class="gt_row gt_right">7</td>
<td headers="Thoracic" class="gt_row gt_right">12</td>
<td headers="Lumbar" class="gt_row gt_right">5</td>
<td headers="Sacrum" class="gt_row gt_right">1</td>
<td headers="Sternum" class="gt_row gt_right">0</td>
<td headers="Clavicle" class="gt_row gt_right">2</td>
<td headers="Rib" class="gt_row gt_right">24</td>
<td headers="Scapula" class="gt_row gt_right">2</td>
<td headers="Humerus" class="gt_row gt_right">2</td>
<td headers="Radius" class="gt_row gt_right">2</td>
<td headers="Ulna" class="gt_row gt_right">2</td>
<td headers="Carpal" class="gt_row gt_right">8</td>
<td headers="Metacarpal" class="gt_row gt_right">10</td>
<td headers="Innominate" class="gt_row gt_right">2</td>
<td headers="Femur" class="gt_row gt_right">2</td>
<td headers="Patella" class="gt_row gt_right">2</td>
<td headers="Tibia" class="gt_row gt_right">2</td>
<td headers="Fibula" class="gt_row gt_right">2</td>
<td headers="Tarsal" class="gt_row gt_right">7</td>
<td headers="Metatarsal" class="gt_row gt_right">4</td>
<td headers="Hand phalanx" class="gt_row gt_right">14</td>
<td headers="Foot phalanx" class="gt_row gt_right">6</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">24</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">10</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Dolni_Vestonice_II_Triple_Burial</td>
<td headers="Study" class="gt_row gt_left">Dolni_Vestonice_II_Triple_Burial_DV_13</td>
<td headers="Cranium" class="gt_row gt_right">1</td>
<td headers="Mandible" class="gt_row gt_right">1</td>
<td headers="Cervical" class="gt_row gt_right">7</td>
<td headers="Thoracic" class="gt_row gt_right">12</td>
<td headers="Lumbar" class="gt_row gt_right">5</td>
<td headers="Sacrum" class="gt_row gt_right">1</td>
<td headers="Sternum" class="gt_row gt_right">1</td>
<td headers="Clavicle" class="gt_row gt_right">2</td>
<td headers="Rib" class="gt_row gt_right">24</td>
<td headers="Scapula" class="gt_row gt_right">2</td>
<td headers="Humerus" class="gt_row gt_right">2</td>
<td headers="Radius" class="gt_row gt_right">2</td>
<td headers="Ulna" class="gt_row gt_right">2</td>
<td headers="Carpal" class="gt_row gt_right">0</td>
<td headers="Metacarpal" class="gt_row gt_right">3</td>
<td headers="Innominate" class="gt_row gt_right">2</td>
<td headers="Femur" class="gt_row gt_right">2</td>
<td headers="Patella" class="gt_row gt_right">2</td>
<td headers="Tibia" class="gt_row gt_right">2</td>
<td headers="Fibula" class="gt_row gt_right">2</td>
<td headers="Tarsal" class="gt_row gt_right">2</td>
<td headers="Metatarsal" class="gt_row gt_right">0</td>
<td headers="Hand phalanx" class="gt_row gt_right">8</td>
<td headers="Foot phalanx" class="gt_row gt_right">0</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">11</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">0</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Dolni_Vestonice_II_Triple_Burial</td>
<td headers="Study" class="gt_row gt_left">Dolni_Vestonice_II_Triple_Burial_DV_15</td>
<td headers="Cranium" class="gt_row gt_right">1</td>
<td headers="Mandible" class="gt_row gt_right">1</td>
<td headers="Cervical" class="gt_row gt_right">7</td>
<td headers="Thoracic" class="gt_row gt_right">12</td>
<td headers="Lumbar" class="gt_row gt_right">5</td>
<td headers="Sacrum" class="gt_row gt_right">1</td>
<td headers="Sternum" class="gt_row gt_right">1</td>
<td headers="Clavicle" class="gt_row gt_right">2</td>
<td headers="Rib" class="gt_row gt_right">23</td>
<td headers="Scapula" class="gt_row gt_right">2</td>
<td headers="Humerus" class="gt_row gt_right">2</td>
<td headers="Radius" class="gt_row gt_right">2</td>
<td headers="Ulna" class="gt_row gt_right">2</td>
<td headers="Carpal" class="gt_row gt_right">4</td>
<td headers="Metacarpal" class="gt_row gt_right">4</td>
<td headers="Innominate" class="gt_row gt_right">2</td>
<td headers="Femur" class="gt_row gt_right">2</td>
<td headers="Patella" class="gt_row gt_right">2</td>
<td headers="Tibia" class="gt_row gt_right">2</td>
<td headers="Fibula" class="gt_row gt_right">2</td>
<td headers="Tarsal" class="gt_row gt_right">7</td>
<td headers="Metatarsal" class="gt_row gt_right">7</td>
<td headers="Hand phalanx" class="gt_row gt_right">8</td>
<td headers="Foot phalanx" class="gt_row gt_right">3</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">12</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">10</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Skhul_Layer_B</td>
<td headers="Study" class="gt_row gt_left">Skhul_Layer_B_Skhul_II</td>
<td headers="Cranium" class="gt_row gt_right">1</td>
<td headers="Mandible" class="gt_row gt_right">1</td>
<td headers="Cervical" class="gt_row gt_right">0</td>
<td headers="Thoracic" class="gt_row gt_right">0</td>
<td headers="Lumbar" class="gt_row gt_right">0</td>
<td headers="Sacrum" class="gt_row gt_right">0</td>
<td headers="Sternum" class="gt_row gt_right">0</td>
<td headers="Clavicle" class="gt_row gt_right">0</td>
<td headers="Rib" class="gt_row gt_right">0</td>
<td headers="Scapula" class="gt_row gt_right">0</td>
<td headers="Humerus" class="gt_row gt_right">2</td>
<td headers="Radius" class="gt_row gt_right">1</td>
<td headers="Ulna" class="gt_row gt_right">2</td>
<td headers="Carpal" class="gt_row gt_right">0</td>
<td headers="Metacarpal" class="gt_row gt_right">0</td>
<td headers="Innominate" class="gt_row gt_right">0</td>
<td headers="Femur" class="gt_row gt_right">0</td>
<td headers="Patella" class="gt_row gt_right">0</td>
<td headers="Tibia" class="gt_row gt_right">0</td>
<td headers="Fibula" class="gt_row gt_right">0</td>
<td headers="Tarsal" class="gt_row gt_right">0</td>
<td headers="Metatarsal" class="gt_row gt_right">0</td>
<td headers="Hand phalanx" class="gt_row gt_right">0</td>
<td headers="Foot phalanx" class="gt_row gt_right">0</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">0</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">0</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Skhul_Layer_B</td>
<td headers="Study" class="gt_row gt_left">Skhul_Layer_B_Skhul_III</td>
<td headers="Cranium" class="gt_row gt_right">0</td>
<td headers="Mandible" class="gt_row gt_right">0</td>
<td headers="Cervical" class="gt_row gt_right">0</td>
<td headers="Thoracic" class="gt_row gt_right">0</td>
<td headers="Lumbar" class="gt_row gt_right">0</td>
<td headers="Sacrum" class="gt_row gt_right">0</td>
<td headers="Sternum" class="gt_row gt_right">0</td>
<td headers="Clavicle" class="gt_row gt_right">0</td>
<td headers="Rib" class="gt_row gt_right">0</td>
<td headers="Scapula" class="gt_row gt_right">0</td>
<td headers="Humerus" class="gt_row gt_right">0</td>
<td headers="Radius" class="gt_row gt_right">0</td>
<td headers="Ulna" class="gt_row gt_right">0</td>
<td headers="Carpal" class="gt_row gt_right">0</td>
<td headers="Metacarpal" class="gt_row gt_right">0</td>
<td headers="Innominate" class="gt_row gt_right">0</td>
<td headers="Femur" class="gt_row gt_right">1</td>
<td headers="Patella" class="gt_row gt_right">0</td>
<td headers="Tibia" class="gt_row gt_right">1</td>
<td headers="Fibula" class="gt_row gt_right">1</td>
<td headers="Tarsal" class="gt_row gt_right">0</td>
<td headers="Metatarsal" class="gt_row gt_right">0</td>
<td headers="Hand phalanx" class="gt_row gt_right">0</td>
<td headers="Foot phalanx" class="gt_row gt_right">0</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">0</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">0</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Skhul_Layer_B</td>
<td headers="Study" class="gt_row gt_left">Skhul_Layer_B_Skhul_IV</td>
<td headers="Cranium" class="gt_row gt_right">1</td>
<td headers="Mandible" class="gt_row gt_right">1</td>
<td headers="Cervical" class="gt_row gt_right">0</td>
<td headers="Thoracic" class="gt_row gt_right">12</td>
<td headers="Lumbar" class="gt_row gt_right">5</td>
<td headers="Sacrum" class="gt_row gt_right">1</td>
<td headers="Sternum" class="gt_row gt_right">1</td>
<td headers="Clavicle" class="gt_row gt_right">2</td>
<td headers="Rib" class="gt_row gt_right">17</td>
<td headers="Scapula" class="gt_row gt_right">1</td>
<td headers="Humerus" class="gt_row gt_right">2</td>
<td headers="Radius" class="gt_row gt_right">2</td>
<td headers="Ulna" class="gt_row gt_right">2</td>
<td headers="Carpal" class="gt_row gt_right">15</td>
<td headers="Metacarpal" class="gt_row gt_right">10</td>
<td headers="Innominate" class="gt_row gt_right">2</td>
<td headers="Femur" class="gt_row gt_right">2</td>
<td headers="Patella" class="gt_row gt_right">2</td>
<td headers="Tibia" class="gt_row gt_right">2</td>
<td headers="Fibula" class="gt_row gt_right">2</td>
<td headers="Tarsal" class="gt_row gt_right">13</td>
<td headers="Metatarsal" class="gt_row gt_right">10</td>
<td headers="Hand phalanx" class="gt_row gt_right">15</td>
<td headers="Foot phalanx" class="gt_row gt_right">17</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">25</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">27</td></tr>
    <tr><td headers="Ref" class="gt_row gt_left">Skhul_Layer_B</td>
<td headers="Study" class="gt_row gt_left">Skhul_Layer_B_Skhul_V</td>
<td headers="Cranium" class="gt_row gt_right">1</td>
<td headers="Mandible" class="gt_row gt_right">1</td>
<td headers="Cervical" class="gt_row gt_right">7</td>
<td headers="Thoracic" class="gt_row gt_right">12</td>
<td headers="Lumbar" class="gt_row gt_right">5</td>
<td headers="Sacrum" class="gt_row gt_right">1</td>
<td headers="Sternum" class="gt_row gt_right">0</td>
<td headers="Clavicle" class="gt_row gt_right">2</td>
<td headers="Rib" class="gt_row gt_right">15</td>
<td headers="Scapula" class="gt_row gt_right">2</td>
<td headers="Humerus" class="gt_row gt_right">2</td>
<td headers="Radius" class="gt_row gt_right">2</td>
<td headers="Ulna" class="gt_row gt_right">2</td>
<td headers="Carpal" class="gt_row gt_right">7</td>
<td headers="Metacarpal" class="gt_row gt_right">4</td>
<td headers="Innominate" class="gt_row gt_right">1</td>
<td headers="Femur" class="gt_row gt_right">2</td>
<td headers="Patella" class="gt_row gt_right">0</td>
<td headers="Tibia" class="gt_row gt_right">2</td>
<td headers="Fibula" class="gt_row gt_right">1</td>
<td headers="Tarsal" class="gt_row gt_right">0</td>
<td headers="Metatarsal" class="gt_row gt_right">1</td>
<td headers="Hand phalanx" class="gt_row gt_right">6</td>
<td headers="Foot phalanx" class="gt_row gt_right">0</td>
<td headers="Hand (metacarpals + manual phalanges)" class="gt_row gt_right">10</td>
<td headers="Foot (metatarsals + pedal phalanges)" class="gt_row gt_right">1</td></tr>
  </tbody>
  &#10;  
</table>
</div>

### Tratamiento estadístico de datos de partes esqueléticas de primates

Todos los análisis descritos a continuación se ejecutan dentro del
entorno estadístico R

Los algoritmos implementados, el paquete utilizado y la URL de esos
paquetes se enumeran en la siguiente tabla:

<div id="ihmwzudiai" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#ihmwzudiai table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#ihmwzudiai thead, #ihmwzudiai tbody, #ihmwzudiai tfoot, #ihmwzudiai tr, #ihmwzudiai td, #ihmwzudiai th {
  border-style: none;
}
&#10;#ihmwzudiai p {
  margin: 0;
  padding: 0;
}
&#10;#ihmwzudiai .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#ihmwzudiai .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#ihmwzudiai .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#ihmwzudiai .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#ihmwzudiai .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#ihmwzudiai .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ihmwzudiai .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#ihmwzudiai .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#ihmwzudiai .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#ihmwzudiai .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#ihmwzudiai .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#ihmwzudiai .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#ihmwzudiai .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#ihmwzudiai .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#ihmwzudiai .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#ihmwzudiai .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#ihmwzudiai .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#ihmwzudiai .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#ihmwzudiai .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ihmwzudiai .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#ihmwzudiai .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#ihmwzudiai .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#ihmwzudiai .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ihmwzudiai .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#ihmwzudiai .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#ihmwzudiai .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ihmwzudiai .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ihmwzudiai .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#ihmwzudiai .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#ihmwzudiai .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#ihmwzudiai .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ihmwzudiai .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#ihmwzudiai .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ihmwzudiai .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#ihmwzudiai .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ihmwzudiai .gt_left {
  text-align: left;
}
&#10;#ihmwzudiai .gt_center {
  text-align: center;
}
&#10;#ihmwzudiai .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#ihmwzudiai .gt_font_normal {
  font-weight: normal;
}
&#10;#ihmwzudiai .gt_font_bold {
  font-weight: bold;
}
&#10;#ihmwzudiai .gt_font_italic {
  font-style: italic;
}
&#10;#ihmwzudiai .gt_super {
  font-size: 65%;
}
&#10;#ihmwzudiai .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#ihmwzudiai .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#ihmwzudiai .gt_indent_1 {
  text-indent: 5px;
}
&#10;#ihmwzudiai .gt_indent_2 {
  text-indent: 10px;
}
&#10;#ihmwzudiai .gt_indent_3 {
  text-indent: 15px;
}
&#10;#ihmwzudiai .gt_indent_4 {
  text-indent: 20px;
}
&#10;#ihmwzudiai .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="3" class="gt_heading gt_title gt_font_normal" style>List of algorithms used in Egeland et al., 2018</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="3" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>R Packages and their URL are given</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Algorithm">Algorithm</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Package used">Package used</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Package URL">Package URL</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Algorithm" class="gt_row gt_left">Neural Network</td>
<td headers="Package_used" class="gt_row gt_left">neuralnet</td>
<td headers="link" class="gt_row gt_center"><a href="https://cran.r-project.org/web/packages/neuralnet/">https://cran.r-project.org/web/packages/neuralnet/</a></td></tr>
    <tr><td headers="Algorithm" class="gt_row gt_left">Neural Network</td>
<td headers="Package_used" class="gt_row gt_left">caret</td>
<td headers="link" class="gt_row gt_center"><a href="https://cran.r-project.org/web/packages/caret/index.html">https://cran.r-project.org/web/packages/caret/index.html</a></td></tr>
    <tr><td headers="Algorithm" class="gt_row gt_left">SVM</td>
<td headers="Package_used" class="gt_row gt_left">e1071</td>
<td headers="link" class="gt_row gt_center"><a href="https://cran.r-project.org/web/packages/e1071/index.html">https://cran.r-project.org/web/packages/e1071/index.html</a></td></tr>
    <tr><td headers="Algorithm" class="gt_row gt_left">SVM</td>
<td headers="Package_used" class="gt_row gt_left">caret</td>
<td headers="link" class="gt_row gt_center"><a href="https://cran.r-project.org/web/packages/caret/index.html">https://cran.r-project.org/web/packages/caret/index.html</a></td></tr>
    <tr><td headers="Algorithm" class="gt_row gt_left">Decision tree with C5.0</td>
<td headers="Package_used" class="gt_row gt_left">C50</td>
<td headers="link" class="gt_row gt_center"><a href="https://cran.r-project.org/web/packages/C50/index.html">https://cran.r-project.org/web/packages/C50/index.html</a></td></tr>
    <tr><td headers="Algorithm" class="gt_row gt_left">Decision tree with C5.0</td>
<td headers="Package_used" class="gt_row gt_left">caret</td>
<td headers="link" class="gt_row gt_center"><a href="https://cran.r-project.org/web/packages/caret/index.html">https://cran.r-project.org/web/packages/caret/index.html</a></td></tr>
    <tr><td headers="Algorithm" class="gt_row gt_left">KNN</td>
<td headers="Package_used" class="gt_row gt_left">class</td>
<td headers="link" class="gt_row gt_center"><a href="https://cran.r-project.org/web/packages/class/index.html">https://cran.r-project.org/web/packages/class/index.html</a></td></tr>
    <tr><td headers="Algorithm" class="gt_row gt_left">KNN</td>
<td headers="Package_used" class="gt_row gt_left">knn/fknn<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></td>
<td headers="link" class="gt_row gt_center"><a href="https://cran.r-project.org/web/packages/FastKNN/index.html">https://cran.r-project.org/web/packages/FastKNN/index.html</a></td></tr>
    <tr><td headers="Algorithm" class="gt_row gt_left">Random Forest</td>
<td headers="Package_used" class="gt_row gt_left">randomForest</td>
<td headers="link" class="gt_row gt_center"><a href="https://cran.r-project.org/web/packages/randomForest/index.html">https://cran.r-project.org/web/packages/randomForest/index.html</a></td></tr>
    <tr><td headers="Algorithm" class="gt_row gt_left">Random Forest</td>
<td headers="Package_used" class="gt_row gt_left">caret</td>
<td headers="link" class="gt_row gt_center"><a href="https://cran.r-project.org/web/packages/caret/index.html">https://cran.r-project.org/web/packages/caret/index.html</a></td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="3"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> No 'knn' package was found. Similar algorithm in FastKNN - fknn</td>
    </tr>
  </tfoot>
</table>
</div>

### Análisis somero del material suplementario

Aquí se destacan algunos puntos clave del documento mismo.

El objetivo del análisis exploratorio es doble: (i) identificar el
número óptimo de grupos representados por los ensamblajes de homínidos y
(ii) determinar la pertenencia de cada grupo identificado. Muchos
algoritmos de agrupación tienden a funcionar mal cuando, como es el caso
aquí, el número de variables (elementos esqueléticos = 23) excede
sustancialmente el tamaño de la muestra (ensamblajes de homínidos = 16).
Para abordar esta discrepancia, utilizamos un análisis de RF en los 16
ensamblajes, incluidos SH y DC, para identificar un subconjunto de
elementos esqueléticos que es más pequeño que el tamaño de la muestra y
explica la mayor cantidad de variación (120). Para identificar el número
óptimo de grupos representados por los 16 ensamblajes, los elementos
esqueléticos con un valor de MDA \> 5 después de la generación de 500
árboles se ingresan en la biblioteca R “NbClust”, que ejecuta y combina
30 algoritmos de agrupamiento diferentes. Luego, un análisis de k-medias
clasifica cada uno de los conjuntos comparativos en uno de los grupos
reconocidos por las funciones NbClust. La fuerza de la asignación de
grupos se evalúa con la función gráfica “clusplot”, que proporciona
elipses y gráficos de silueta con un 95 % de confianza, que estiman el
valor s(i) de cada conjunto comparativo. Una comparación de distancias
dentro y entre grupos da como resultado valores de s(i) que van desde 1
(clasificación fuerte dentro de un grupo) hasta 0 (clasificación
parsimoniosa pero débil dentro de un grupo). Esta clasificación
preliminar establece un marco para la aplicación de una variedad de
métodos de aprendizaje automático que pueden identificar los ensamblajes
comparativos que mejor coinciden con las concentraciones de homínidos de
SH y DC.

Antes de la construcción del modelo, todos los datos de las partes del
esqueleto se someten a una transformación de centro y escala

Para elegir el mejor modelo para el análisis, utilizamos el remuestreo
de validación cruzada con exclusión de grupo de Monte-Carlo. Esto crea
múltiples divisiones de conjuntos de entrenamiento/conjuntos de prueba y
es más sólido con muestras pequeñas que los métodos de validación
cruzada de bootstrapping, bagging y k-fold.

Los modelos producidos por cada método de aprendizaje automático después
de 30 iteraciones se evalúan con κ de Cohen.

Finalmente, realizamos una CA no supervisada con puntajes de carga de
PCA.

### Pasos a seguir y algunas ideas

Aseguran que los huesos de *SH* presentan mucha perturbación (tipo
carroña) y por ende no podrían ser clasificados como rito mortuorio. Sin
embargo no muestran un análisis detallado de los rastros de “huellas” de
carroñeo que presentan ni los datos que (entiendo) posee el grupo de
Nohemí.

Quizás a nivel de Algoritmo (como tal) no se puede indagar mucho (porque
probablemente muestren algo similar), pero sí a nivel de incluir datos
nuevos que no estén incluidos y ya sea repitiendo la aproximación de
ellos o agregando alguna nueva, los resultados sean diferentes apoyando
(esta vez) la idea de que los restos en **SH** están allí por un acto
“ritual de muerte” y no por simple acumulación transporte.
