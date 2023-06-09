Reconstruction of Egeland et al., 2018: ‘Hominin skeletal part
abundances…’
================
Antonio Canepa-Oneto
Last compiled on 09 junio, 2023

The algorithms implemented, the packaged used for and the URL for those
packages are listed in the following table:

<div id="htbznupacq" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#htbznupacq table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#htbznupacq thead, #htbznupacq tbody, #htbznupacq tfoot, #htbznupacq tr, #htbznupacq td, #htbznupacq th {
  border-style: none;
}
&#10;#htbznupacq p {
  margin: 0;
  padding: 0;
}
&#10;#htbznupacq .gt_table {
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
&#10;#htbznupacq .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#htbznupacq .gt_title {
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
&#10;#htbznupacq .gt_subtitle {
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
&#10;#htbznupacq .gt_heading {
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
&#10;#htbznupacq .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#htbznupacq .gt_col_headings {
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
&#10;#htbznupacq .gt_col_heading {
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
&#10;#htbznupacq .gt_column_spanner_outer {
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
&#10;#htbznupacq .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#htbznupacq .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#htbznupacq .gt_column_spanner {
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
&#10;#htbznupacq .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#htbznupacq .gt_group_heading {
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
&#10;#htbznupacq .gt_empty_group_heading {
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
&#10;#htbznupacq .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#htbznupacq .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#htbznupacq .gt_row {
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
&#10;#htbznupacq .gt_stub {
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
&#10;#htbznupacq .gt_stub_row_group {
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
&#10;#htbznupacq .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#htbznupacq .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#htbznupacq .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#htbznupacq .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#htbznupacq .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#htbznupacq .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#htbznupacq .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#htbznupacq .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#htbznupacq .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#htbznupacq .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#htbznupacq .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#htbznupacq .gt_footnotes {
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
&#10;#htbznupacq .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#htbznupacq .gt_sourcenotes {
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
&#10;#htbznupacq .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#htbznupacq .gt_left {
  text-align: left;
}
&#10;#htbznupacq .gt_center {
  text-align: center;
}
&#10;#htbznupacq .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#htbznupacq .gt_font_normal {
  font-weight: normal;
}
&#10;#htbznupacq .gt_font_bold {
  font-weight: bold;
}
&#10;#htbznupacq .gt_font_italic {
  font-style: italic;
}
&#10;#htbznupacq .gt_super {
  font-size: 65%;
}
&#10;#htbznupacq .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#htbznupacq .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#htbznupacq .gt_indent_1 {
  text-indent: 5px;
}
&#10;#htbznupacq .gt_indent_2 {
  text-indent: 10px;
}
&#10;#htbznupacq .gt_indent_3 {
  text-indent: 15px;
}
&#10;#htbznupacq .gt_indent_4 {
  text-indent: 20px;
}
&#10;#htbznupacq .gt_indent_5 {
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
