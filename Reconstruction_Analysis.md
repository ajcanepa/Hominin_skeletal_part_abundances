Reconstruction of Egeland et al., 2018: ‘Hominin skeletal part
abundances…’
================
Antonio Canepa-Oneto
Last compiled on 09 junio, 2023

# Intro

The idea is to be able to reproduce all the statistical analysis in the
paper: *Hominin skeletal part abundances and claims of deliberate
disposal of corpses in the Middle
Pleistocene*<https://doi.org/10.1073/pnas.1718678115>

The dataset was compiled by Antonio Canepa-Oneto, following the
Supporting Information found
[here](https://www.pnas.org/doi/suppl/10.1073/pnas.1718678115/suppl_file/pnas.1718678115.sd01.xlsx).

The dataset (only the first fifteen rows) looks like:

``` r
Summary_Dataset <- read_csv("INPUT/DATA/Summary_Dataset.csv")

Summary_Dataset %>% 
  slice_head(n = 15) %>% 
  gt()
```

<div id="tfnehoqfmx" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#tfnehoqfmx table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#tfnehoqfmx thead, #tfnehoqfmx tbody, #tfnehoqfmx tfoot, #tfnehoqfmx tr, #tfnehoqfmx td, #tfnehoqfmx th {
  border-style: none;
}
&#10;#tfnehoqfmx p {
  margin: 0;
  padding: 0;
}
&#10;#tfnehoqfmx .gt_table {
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
&#10;#tfnehoqfmx .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#tfnehoqfmx .gt_title {
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
&#10;#tfnehoqfmx .gt_subtitle {
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
&#10;#tfnehoqfmx .gt_heading {
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
&#10;#tfnehoqfmx .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#tfnehoqfmx .gt_col_headings {
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
&#10;#tfnehoqfmx .gt_col_heading {
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
&#10;#tfnehoqfmx .gt_column_spanner_outer {
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
&#10;#tfnehoqfmx .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#tfnehoqfmx .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#tfnehoqfmx .gt_column_spanner {
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
&#10;#tfnehoqfmx .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#tfnehoqfmx .gt_group_heading {
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
&#10;#tfnehoqfmx .gt_empty_group_heading {
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
&#10;#tfnehoqfmx .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#tfnehoqfmx .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#tfnehoqfmx .gt_row {
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
&#10;#tfnehoqfmx .gt_stub {
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
&#10;#tfnehoqfmx .gt_stub_row_group {
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
&#10;#tfnehoqfmx .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#tfnehoqfmx .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#tfnehoqfmx .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#tfnehoqfmx .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#tfnehoqfmx .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#tfnehoqfmx .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#tfnehoqfmx .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#tfnehoqfmx .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#tfnehoqfmx .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#tfnehoqfmx .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#tfnehoqfmx .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#tfnehoqfmx .gt_footnotes {
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
&#10;#tfnehoqfmx .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#tfnehoqfmx .gt_sourcenotes {
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
&#10;#tfnehoqfmx .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#tfnehoqfmx .gt_left {
  text-align: left;
}
&#10;#tfnehoqfmx .gt_center {
  text-align: center;
}
&#10;#tfnehoqfmx .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#tfnehoqfmx .gt_font_normal {
  font-weight: normal;
}
&#10;#tfnehoqfmx .gt_font_bold {
  font-weight: bold;
}
&#10;#tfnehoqfmx .gt_font_italic {
  font-style: italic;
}
&#10;#tfnehoqfmx .gt_super {
  font-size: 65%;
}
&#10;#tfnehoqfmx .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#tfnehoqfmx .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#tfnehoqfmx .gt_indent_1 {
  text-indent: 5px;
}
&#10;#tfnehoqfmx .gt_indent_2 {
  text-indent: 10px;
}
&#10;#tfnehoqfmx .gt_indent_3 {
  text-indent: 15px;
}
&#10;#tfnehoqfmx .gt_indent_4 {
  text-indent: 20px;
}
&#10;#tfnehoqfmx .gt_indent_5 {
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

## Statistical Treatment of Primate Skeletal Part Data

All analyses described below are run within the R statistical
environment

The algorithms implemented, the packaged used for and the URL for those
packages are listed in the following table:

<div id="jzumeyrjzz" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#jzumeyrjzz table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#jzumeyrjzz thead, #jzumeyrjzz tbody, #jzumeyrjzz tfoot, #jzumeyrjzz tr, #jzumeyrjzz td, #jzumeyrjzz th {
  border-style: none;
}
&#10;#jzumeyrjzz p {
  margin: 0;
  padding: 0;
}
&#10;#jzumeyrjzz .gt_table {
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
&#10;#jzumeyrjzz .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#jzumeyrjzz .gt_title {
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
&#10;#jzumeyrjzz .gt_subtitle {
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
&#10;#jzumeyrjzz .gt_heading {
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
&#10;#jzumeyrjzz .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#jzumeyrjzz .gt_col_headings {
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
&#10;#jzumeyrjzz .gt_col_heading {
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
&#10;#jzumeyrjzz .gt_column_spanner_outer {
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
&#10;#jzumeyrjzz .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#jzumeyrjzz .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#jzumeyrjzz .gt_column_spanner {
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
&#10;#jzumeyrjzz .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#jzumeyrjzz .gt_group_heading {
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
&#10;#jzumeyrjzz .gt_empty_group_heading {
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
&#10;#jzumeyrjzz .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#jzumeyrjzz .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#jzumeyrjzz .gt_row {
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
&#10;#jzumeyrjzz .gt_stub {
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
&#10;#jzumeyrjzz .gt_stub_row_group {
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
&#10;#jzumeyrjzz .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#jzumeyrjzz .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#jzumeyrjzz .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#jzumeyrjzz .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#jzumeyrjzz .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#jzumeyrjzz .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#jzumeyrjzz .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#jzumeyrjzz .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#jzumeyrjzz .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#jzumeyrjzz .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#jzumeyrjzz .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#jzumeyrjzz .gt_footnotes {
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
&#10;#jzumeyrjzz .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#jzumeyrjzz .gt_sourcenotes {
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
&#10;#jzumeyrjzz .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#jzumeyrjzz .gt_left {
  text-align: left;
}
&#10;#jzumeyrjzz .gt_center {
  text-align: center;
}
&#10;#jzumeyrjzz .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#jzumeyrjzz .gt_font_normal {
  font-weight: normal;
}
&#10;#jzumeyrjzz .gt_font_bold {
  font-weight: bold;
}
&#10;#jzumeyrjzz .gt_font_italic {
  font-style: italic;
}
&#10;#jzumeyrjzz .gt_super {
  font-size: 65%;
}
&#10;#jzumeyrjzz .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#jzumeyrjzz .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#jzumeyrjzz .gt_indent_1 {
  text-indent: 5px;
}
&#10;#jzumeyrjzz .gt_indent_2 {
  text-indent: 10px;
}
&#10;#jzumeyrjzz .gt_indent_3 {
  text-indent: 15px;
}
&#10;#jzumeyrjzz .gt_indent_4 {
  text-indent: 20px;
}
&#10;#jzumeyrjzz .gt_indent_5 {
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

## Exploratory analysis.

Some key points from the paper itself are highlighted here.

The goal of exploratory analysis is twofold: (i) to identify the optimum
number of groups represented by the hominin assemblages and (ii) to
determine the membership of each identified group. Many grouping
algorithms tend to perform poorly when, as is the case here, the number
of variables (skeletal elements = 23) substantially exceeds sample size
(hominin assemblages = 16). To address this discrepancy, we used a RF
analysis on all 16 assemblages, including the SH and DC, to identify a
subset of skeletal elements that is smaller than the sample size and
explains the greatest amount of variance (120). To identify the optimum
number of groups represented by all 16 assemblages, those skeletal
elements with a MDA value \> 5 after the generation of 500 trees are
entered in the “NbClust” R library, which runs and combines 30 different
clustering algorithms. A k-means analysis then classifies each of the
comparative assemblages into one of the groups recognized by the NbClust
functions. The strength of group assignment is assessed with the
“clusplot” graphic function, which provides 95% confidence ellipses and
silhouette plots, which estimate the s(i) value of each comparative
assemblage. A comparison of within- and between-group distances results
in s(i) values that range from 1 (strong classification within a group)
to 0 (parsimonious but weak classification within a group). This
preliminary classification establishes a framework for the application
of a variety of machine-learning methods that can identify the
comparative assemblages that best match the hominin concentrations from
the SH and DC.

Before model construction, all skeletal part data undergo center and
scale transformation

To choose the best model for analysis, we use Monte-Carlo
leave-group-out cross-validation resampling. This creates multiple
training set/testing set splits and is more robust with small samples
than bootstrapping, bagging, and k-fold cross-validation methods

The models produced by each machine learning method after 30 iterations
are evaluated with Cohen’s κ.

Finally, we perform an unsupervised CA with PCA loading scores.
