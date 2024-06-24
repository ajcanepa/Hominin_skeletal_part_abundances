# 					Package 'TaphonomyR'

​									month day, year 



**Title** Prepare, explore and model Data for Taphonomy and Quantitative Paleozoology

**Version** 0.0.1 

**Description**  "Provides functionality to support data  exploration and modeling for taphonomic analyses, improving code reproducibility and accessibility. The package currently includes functionality for data cleaning, data exploration, simple modeling, comparison and visualisation. **Reference datasets** (collected in <paper> ) 

**License** GPL (>= 3)

**Language** en-GB

**Encoding** UTF-8

**LazyData** noIdea

**RoxygenNote** noIdea

**Depends** R (>= 4.0)

**Imports** tydiverse, plotly,...

**Suggests** rmarkdown, .....

**VignetteBuilder** (maybe kniter)

**Config/tesethat/edition** nber

**URL** https://github.com/hoste_name/thaponomyr/

**BugReports** https://github.com/hoste_name/thaponomyr/issues

**NeedsCompilation** noIdea

**Author** DEATHREVOL & ADMIRABLE

**Maintainer** DEATHREVOL & ADMIRABLE

**Repositoty** CRAN

**Data/publication** yyyy-mm-dd std:min:secUTC

---

### R topics documented: 

1. `load_mne_data`
2. `PNAS_plus`  
3. `loadNewSiteData`
4. `checkBoneNamesAndCategories`
5.  `assessMissingValues`
6. `dropNAFeatures`
7. `imputeBoneCategories`
8. `mergeSkeletalSubcategories`
9. `convertMNEtoVariables`
10. `compareEDAwithPNASplus`
11. `exploreDatasetCorrelation`	
12. `performStatisticalExploration`	
13. `evaluateFeatureImportance`
14. `plotPNASplusSamples` 
15. `plot_compare`
16. `plotAcReMNAUComparison`
17. `calc_clutster`
18. `cal_pca`
19. `plot_cluster`
20. `plot_cluster_hist`	
21. `plot_pca`	
22. `subyRegression`
23. `suby_regression_fauna`
24. `suby_comparison`	
25. `plot_suby`
26. `read_breakage_data`
27. `breakage_cluster`	
28. `plot_breakage_cluster`
29. `pnas_data`	
30. `loadBreakageData`	
31. `loadBreakageData_fauna`	
32. `breakage_cleaning`
33. `validateBreakageData`
34. `imputeMissingValues`     
35. `exploreTaphoData`  
36. `clusterBreakageData`            
37. `performPCA` 	
38. `plotAnalysisResults` 

Index [last page]



---

taphomomyR-package  		*Data analysis and modeling for skeletal part abundance dataset* 

-----



**Description** Functions in this package enable the reading, manipulation, and model skeletal part abundance data in the context of taphonomy (origin). They facilitate the clustering modeling and comparision between exiting arqueogical skeletal part abundnance. Additionally, the package allows for the statistical analysis of bone brakage analysis, as well as the graphical representation of  patterns in homonin and faunal remains and the analysis of archaeological faunal assemblages.



**Taphonomy TOC** TaphonomyR-package 

**Author(s)** DEATHREVOL & ADMIRABLE







---

load_mne_data		Convert loaded MNE values into common derived variables

---

**Description** Dataload csv (and or other) in MNE format. (Maybe here or later, files spellchecks the bone features, chooses one bone categories, and handels missing values and informs about the steps) 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**

----

`PNAS_plus`   		Dataset of skeletal part abundance from various archaeological sites

----

**Description**: The `PNAS_plus` dataset comprises of skeletal part abundance from various archaeological sites, as documented in published studies (cite). It includes data on the origin of the assemblage, number of individuals, age, and the Minimum Number of Elements (MNE) for a comprehensive list of skeletal parts. This dataset is designed to serve as a comparative tool for researchers analyzing new sites, offering a basis for understanding patterns or anomalies in skeletal part representation.

**Usage**:

```
data("PNAS_plus")
```

**Format**: A dataframe with the following columns:

- `Name`: Identifier for the archaeological site or study.
- `Origin`: Origin of the skeletal assemblage.
- `Number_of_Individuals`: Estimated number of individuals represented in the assemblage.
- `Age`: Chronological age of deceased. 
- `Elements`: Detailed count of each skeletal part present, with a breakdown by specific elements (Cranium, Mandible, Maxillae, etc.), including the MNE for each.

Each row represents a unique skeletal assemblage, providing a comprehensive overview of its composition.

**References**: The dataset aggregates data from various studies, collected by Dominguez-Rodriguez et al. and DEATHREVOL

**Source**: DEATHREVOL and  Dominguez-Rodriguez et al. 



---

`loadNewSiteData`		 Loads data, spell check and feature  assignment, handles missing data

---

**Description**: Importation of new archaeological site data, preparing it for direct comparison with the `PNAS_plus` dataset. It ensures that the new dataset adheres to the expected format and variable definitions used in taphonomic analysis.

**Usage**:

```
newSiteData <- loadNewSiteData(filePath)
```

**Arguments**:

- `filePath`: String. The path to the file (CSV or Excel format) containing the data from a new archaeological site.

**Details**: The function performs several key steps to prepare the new site data for analysis, including:

- Reading the data from the specified file path.
- Validating the structure and completeness of the data against the schema used by the `PNAS_plus` dataset.
- Standardizing the naming conventions of skeletal elements and other key variables to match those used in `PNAS_plus`.
- Handling missing values or discrepancies through user consultation or predefined rules.

**Value**: A dataframe that mirrors the structure and formatting of the `PNAS_plus` dataset, making it ready for comparative analysis and further taphonomic study.

**References**:

- Dominguez-Rodriguez, et al.

**Developers**:

**Reviewers**:

**Examples**:

```
# Load new site data from a CSV file
newDataPath <- "path/to/your/new_site_data.csv"
newSiteData <- loadNewSiteData(newDataPath)

# Display the first few rows of the prepared dataset
head(newSiteData)
```





---

`checkBoneNamesAndCategories` 	A function to check spelling of the bone names and check "bone categories"

---

**Description**: This function checks bone names within the dataset for spelling accuracy and categorizes them according to predefined bone categories (level of detail). It aids in ensuring consistency and correctness in the dataset's bone names and facilitates the grouping of bones into meaningful categories for analysis.

**Usage**:

```
correctedData <- checkBoneNamesAndCategories(data)
```

**Arguments**:

- `data`: Dataset containing bone data. Expected to have a column specifying bone names.

**Details**: The function employs a two-step process:

1. **Spelling Correction**: Utilizes a dictionary of recognized bone names to identify and correct misspellings. The dictionary includes common variations and synonyms to ensure comprehensive coverage.
2. **Categorization**: Based on the corrected bone names, the function assigns each bone to a category. 
3. 

**Value**: A dataframe that includes:

- Corrected bone names.
- Report about bone categories

**References**:

**Developers**:

**Reviewers**:

**Examples**:

```
# Load your dataset
data <- read.csv("path/to/your/dataset.csv")

# Check and correct bone names, and categorize
correctedData <- checkBoneNamesAndCategories(data)

# View the first few rows to verify corrections and categories
head(correctedData)
```

---

---

---

 `assessMissingValues`		Evaluates the dataset for missing values

---



**Description**: Evaluates the dataset for missing values, providing a detailed summary and recommendations for handling these gaps. 

**Usage**:

```
missingSummary <- assessMissingValues(data)
```

**Arguments**:

- `data`: The dataset to be assessed for missing values. It should be a dataframe where rows represent observations and columns represent variables, including bone names and categories.

**Details**: The function checks missing data across all variables in the dataset. 

The function also identifies variables with complete data, aiding in immediate analytical decisions. The recommendations provided by the function take into account common practices in taphonomic analysis and the potential impact of missing data on study outcomes.

**Value**: A list containing:

- `summaryTable`: A dataframe summarizing the proportion of missing values for each variable and the suggested action.
- `recommendations`: A text summary of general recommendations for handling missing data in the dataset.

**Developers**:

**Reviewers**:

**Examples**:

```
# Load your dataset
data <- read.csv("path/to/your/dataset.csv")

# Assess missing values and get recommendations
missingSummary <- assessMissingValues(data)

# View the summary table of missing values
print(missingSummary$summaryTable)

```



---

`dropNAFeatures`			Elimination of empty bone categories

---



**Description**: This function identifies and removes features (columns) with missing values (NA) from both the new archaeological dataset and the comparison dataset, such as `PNAS_plus`. 



**Usage**:

```
cleanedData <- dropNAFeatures(newData, comparisonData)
```

**Arguments**:

- `newData`: The new archaeological site dataset to be cleaned of NA features.
- `comparisonData`: The comparison dataset (e.g., `PNAS_plus`) from which NA features will also be removed.

**Details**: The function operates by first scanning both datasets to identify any columns that contain only missing values. It then simultaneously removes these columns from both datasets, ensuring that the comparison between the new data and the `PNAS_plus` dataset (or any other comparison dataset) is based on variables that are present in both datasets. 

**Value**: A list containing two elements:

- `newDataCleaned`: The new archaeological dataset with NA features removed.
- `comparisonDataCleaned`: The comparison dataset with the same NA features removed.

**Developers**:

**Reviewers**:

**Examples**:

```
# Load new dataset and 'PNAS_plus' is loaded as the comparison dataset
newSiteData <- read.csv("path/to/new_site_data.csv")
PNAS_plus <- data("PNAS_plus")

# Drop NA features from both datasets
cleanedDatasets <- dropNAFeatures(newSiteData, PNAS_plus)

# Access the cleaned new site data
newDataCleaned <- cleanedDatasets$newDataCleaned

# Access the cleaned comparison data
comparisonDataCleaned <- cleanedDatasets$comparisonDataCleaned

# Optionally, check the structure of the cleaned datasets
str(newDataCleaned)
str(comparisonDataCleaned)
```



---

`imputeBoneCategories`		Imputation of missing values in bone categories 

---

**Description**: Imputes missing values within bone categories using a specified method, ensuring that the dataset is complete and retains as much original information as possible. 

**Usage**:

```
imputedData <- imputeBoneCategories(data, method = "mode")
```

**Arguments**:

- `data`: The dataset containing bone categories with missing values. It is assumed to have categorical variables indicating bone types or categories.
- `method`: The imputation method to be used for filling in missing values within bone categories. Default is "mode", which imputes the most frequent category. Other supported methods might include "predictive" for model-based imputation or "custom" for user-defined imputation strategies.

**Details**: This function first identifies columns related to bone categories in the dataset, then applies the selected imputation method to fill in missing values. 



**Value**: A copy of the input dataset with missing values in bone categories imputed according to the specified method.

**References**:

- Techniques for handling missing categorical data in archaeological research.
- Domain-specific guidelines for imputation in osteological analysis.

**Developers**:

**Reviewers**:

**Examples**:

```
# Load your dataset
data <- read.csv("path/to/your/dataset.csv")

# Impute missing values in bone categories using the mode
imputedData <- imputeBoneCategories(data)

# Optionally, use a predictive model for imputation (requires implementation)
# imputedData <- imputeBoneCategories(data, method = "predictive")

# Check the summary to see the effect of imputation
summary(imputedData)
```





---

`mergeSkeletalSubcategories`		Merges skeletal part sub categories into its categories 

---



**Description**: Consolidates skeletal part subcategories into broader anatomical categories within the dataset. This function aims to simplify the analysis by reducing the granularity of skeletal part data, aligning it with common categories used in taphonomic analysis. By merging detailed subcategories into main categories (e.g., merging various types of vertebrae into a single 'Vertebrae' category), it facilitates comparisons and analyses at a more general level.

**Usage**:

```
consolidatedData <- mergeSkeletalSubcategories(data, mergeRules)
```

**Arguments**:

- `data`: The dataset containing detailed skeletal part information. It should include columns for each skeletal part subcategory.
- `mergeRules`: A list or dataframe defining how subcategories should be merged into main categories. Each entry should specify a main category and the subcategories that belong to it.

**Details**: The function operates by iterating over the `mergeRules`, identifying columns in `data` that match the specified subcategories, and summing or averaging their values (as appropriate) to create a new column for the main category. The original subcategory columns can then be optionally removed from the dataset, leaving only the consolidated categories. This process not only simplifies the dataset but also aligns it more closely with common anatomical groupings, making subsequent analyses more intuitive and meaningful.

**Value**: The dataset with skeletal part subcategories merged into broader categories according to the provided rules. This modified dataset retains the original information in a simplified form, enhancing usability for taphonomic analysis.

**References**:

- Guidelines for skeletal part categorization in osteological and taphonomic studies.
- Best practices for data preparation in archaeological research.

**Developers**:

**Reviewers**:

**Examples**:

```
# Define merge rules for skeletal parts
mergeRules <- list(
  Vertebrae = c("Cervical", "Thoracic", "Lumbar", "Sacrum", "Coccyx"),
  Hand = c("Carpals", "Metacarpal", "Hand phalanx"),
  Foot = c("Tarsal", "Metatarsal", "Foot phalanx")
)

# Load your dataset
data <- read.csv("path/to/your/dataset.csv")

# Merge skeletal part subcategories into main categories
consolidatedData <- mergeSkeletalSubcategories(data, mergeRules)

# View the structure of the consolidated dataset
str(consolidatedData)
```





---

`convertMNEtoVariables`	 Converts loaded MNE values into common derived variables

---

**Description**: This function processes the Minimum Number of Elements (MNE) data to compute common derived variables used in taphonomic analysis. These variables include Mean Number of Individuals (MNI), Abundance, Mean Abundance (MA), Mean Part Abundance (MPA), Minimum Animal Units (MAU), Minimum Number of Anatomic Units (MNAU), and their respective percentages and cumulative values. 

**Usage**:

```
analysisResults <- convertMNEtoVariables(MNE, skeleton, individuals = NULL)
```

**Arguments**:

- `MNE`: A vector or dataframe column containing the Minimum Number of Elements for each skeletal part.
- `skeleton`: A dataframe specifying the expected number of each skeletal element in one complete skeleton (`One_Skeleton`) and the corresponding skeletal part names (`Elements`).
- `individuals`: Optional. The total number of individuals estimated in the assemblage. If not provided, it is calculated based on MNE and skeleton data.

**Details**: The function calculates various key taphonomic metrics from the provided MNE data. It checks for consistency in the length of the MNE vector against the skeleton dataframe, ensuring accurate calculations. If the `individuals` argument is not provided, it computes an MNI based on the ceiling of the ratio of MNE to the expected number per skeleton, using this to calculate abundance and related metrics.

**Value**: A list containing:

- `MNE`: The input vector of Minimum Number of Elements for each skeletal part.
- `Elements`: The names of skeletal parts as specified in the `skeleton` dataframe.
- `Abundance`, `MNI`, `MAU`, `MNAU`, `PercentMAU`, `PercentMNAU`, `ReMNAU`, `AcReMNAU`, `MeanAbundance`, `MeanPartAbundance`: Calculated metrics providing insights into the composition and preservation of the skeletal assemblage.

**Developers**:

**Reviewers**:

**Examples**:

```
# Assuming 'MNE' contains your MNE data and 'skeleton' describes the expected numbers
MNE <- c(6, 4, 5, 3, ...) 
# Example MNE values
skeleton <- data.frame(
  Elements = c("Cranium", "Mandible", "Maxillae", "Hyoid"),
  One_Skeleton = c(1, 1, 1, 1) # Expected numbers per complete skeleton
)

# Conduct the analysis
analysisResults <- convertMNEtoVariables(MNE, skeleton)

# Access and view the results
print(analysisResults)
```





---

`compareEDAwithPNASplus`		Convert loaded MNE values into common derived variables

---



**Description**: Conducts an exploratory data analysis (EDA) on a new archaeological dataset, comparing its findings against the `PNAS_plus` dataset. 

**Usage**:

```
edaComparisonResults <- compareEDAwithPNASplus(newData, PNAS_plus)
```

**Arguments**:

- `newData`: The new archaeological dataset to be analyzed and compared. It should be structured similarly to `PNAS_plus`, with columns for skeletal part representation and other relevant taphonomic variables.
- `PNAS_plus`: The comparison dataset, loaded internally from the package, containing aggregated data from various archaeological findings.

**Details**: The function initiates by performing a standalone EDA on `newData`, examining distributions, missing values, and key statistical measures for each variable. It then repeats the process for the `PNAS_plus` dataset. Subsequently, it overlays findings from both datasets to identify and visualize:

- Common patterns and distributions across datasets.
- Unique outliers or anomalies present in `newData`.
- Statistical comparisons of mean, median, and range values for skeletal part representations between the datasets.

This comparative approach allows for a nuanced understanding of how the new findings align with or diverge from established data, offering potential insights into the archaeological site's characteristics and the preservation or deposition processes involved.

**Value**: A comprehensive EDA report that includes:

- Summary statistics comparison between `newData` and `PNAS_plus`.
- Visualizations such as histograms, box plots, and scatter plots for both datasets, with annotations highlighting key comparisons.
- An interpretive summary highlighting significant findings from the comparative analysis.

**Developers**:

**Reviewers**:



**Examples**:

```
# Assuming 'newSiteData' is your newly loaded dataset for comparison
newSiteData <- loadNewSiteData("path/to/new_site_data.csv")

# Perform the comparative EDA
edaComparisonResults <- compareEDAwithPNASplus(newSiteData, PNAS_plus)

# Access the EDA report
view(edaComparisonResults$report)
```





---

`exploreDatasetCorrelation`	      Calculates the correlation matrix of the data and pnas_plus data

---

**Description**: This function assesses and visualizes the correlations among variables within an archaeological dataset, focusing on skeletal part representation, preservation states, and other relevant taphonomic variables. 

**Usage**:

```
correlationResults <- exploreDatasetCorrelation(data)
```

**Arguments**:

- `data`: The archaeological dataset for which correlations among variables are to be explored. It is expected to be a dataframe where each column represents a different variable or skeletal part.

**Details**: The function calculates the correlation coefficients between all pairs of variables in the dataset using appropriate methods (e.g., Pearson, Spearman) based on the data's scale and distribution. It then generates a correlation matrix and visualizes it using a heatmap, providing an intuitive representation of how variables are related. The function automatically detects and handles non-numeric variables by either excluding them from the analysis or converting them to numeric where feasible. Additionally, it can identify and suggest handling of highly correlated variables, which may indicate redundancy.

**Value**: An object containing:

- `correlationMatrix`: A matrix of correlation coefficients between variables.
- `heatmapPlot`: A heatmap visualization of the correlation matrix, enhancing interpretability of the correlations.



**Developers**:

**Reviewers**:

**Examples**:

```
# Load your dataset
data <- read.csv("path/to/your/dataset.csv")

# Explore correlations in the dataset
correlationResults <- exploreDatasetCorrelation(data)

# View the correlation matrix
print(correlationResults$correlationMatrix)

# Display the heatmap of correlations
plot(correlationResults$heatmapPlot)
```



---

`performStatisticalExploration`	Calculates descriptive statistics, p-values, Bayes Factor bounds

---

### 

**Description**: Executes a comprehensive statistical exploration on an archaeological dataset, providing a tendencies, dispersion, and distribution properties of skeletal part representations and other taphonomic variables.

**Usage**:

```
statisticalSummary <- performStatisticalExploration(data)
```

**Arguments**:

- `data`: The archaeological dataset subjected to statistical exploration. The dataset should be a dataframe with rows representing observations and columns representing quantitative and categorical variables.

**Details**: This function encompasses a variety of statistical analyses including but not limited to:

- **Descriptive Statistics**: Calculation of mean, median, mode, range, variance, and standard deviation for quantitative variables.
- **Outlier Detection**: Identification of outliers using methods such as IQR (Interquartile Range) or Z-scores.
- **Normality Tests**: Application of tests like Shapiro-Wilk or Kolmogorov-Smirnov to assess the distribution of data.
- **Distribution Visualizations**: Generation of histograms, box plots, and Q-Q plots to visually inspect data distributions and outliers. The function is designed to be flexible, accommodating both continuous and categorical data by applying relevant statistical measures and tests.

**Value**: A comprehensive report that includes:

- `descriptiveStats`: A dataframe summarizing the descriptive statistics of the dataset.
- `outliersReport`: Details of identified outliers and recommendations for handling them.
- `normalityReport`: Results from normality tests indicating which variables follow or deviate from a normal distribution.
- `visualizationPlots`: A collection of plots providing visual insights into the data's distribution and potential relationships among variables.

**Developers**:

**Reviewers**:

**Examples**:

```
# Load dataset
data <- read.csv("path/to/your/archaeological_data.csv")

# Perform statistical exploration
statisticalSummary <- performStatisticalExploration(data)

# Access and review the descriptive statistics
print(statisticalSummary$descriptiveStats)

# Review outlier detection report
print(statisticalSummary$outliersReport)

# Examine normality test results
print(statisticalSummary$normalityReport)

# Display distribution visualizations
plot(statisticalSummary$visualizationPlots$histogram)
plot(statisticalSummary$visualizationPlots$boxPlot)
```



---

`evaluateFeatureImportance`		     Calculates feature importance between 

---

**Description**: This function assesses the importance of features within an archaeological dataset to identify which variables most significantly influence the outcomes of interest, such as skeletal part representation patterns or taphonomic processes. 

**Usage**:

```
featureImportanceResults <- evaluateFeatureImportance(data, targetVariable)
```

**Arguments**:

- `data`: The dataset for which feature importance is to be evaluated. It should be a dataframe where rows represent observations and columns represent features, including both predictors and the outcome variable.
- `targetVariable`: The name of the outcome variable (as a string) within `data` for which the feature importance is being assessed. This could relate to specific taphonomic outcomes or categories of skeletal part representation.

**Details**: The function employs a Random Forest or Gradient Boosting Machine (GBM) model, owing to their inherent capability of providing feature importance measures. 

**Value**: An object containing:

- `importanceScores`: A dataframe listing features alongside their importance scores, sorted in descending order of importance.
- `importancePlot`: A plot visualizing the ranked importance of features, making it easy to identify the most influential variables.

**Developers**:

**Reviewers**:

**Examples**:

```
# Load your dataset
data <- read.csv("path/to/your/archaeological_data.csv")

# Specify the target variable for which you want to evaluate feature importance
targetVariable <- "TaphonomicOutcome"

# Evaluate feature importance
featureImportanceResults <- evaluateFeatureImportance(data, targetVariable)

# View the importance scores
print(featureImportanceResults$importanceScores)

# Display the importance plot
plot(featureImportanceResults$importancePlot)
```



---

`plotPNASplusSamples` 	Plots abundance histrogram comparison en order of abundance

---

**Description**: Visualizes each sample in the `PNAS_plus` dataset within a parallel plot, displaying numerical values for key variables. This function also generates bar plots for all samples, ordered by their mean values, providing a clear comparison across the dataset. 

**Usage**:

```
plotPNASplusSamples(PNAS_plus, variables)
```

**Arguments**:

- `PNAS_plus`: The `PNAS_plus` dataset to be visualized. It should already be loaded and contain both categorical and numerical variables relevant to the analysis.
- `variables`: A vector of variable names (as strings) from the `PNAS_plus` dataset to be included in the parallel plot and ordered bar plots. These should be numerical variables that represent key metrics or counts.

**Details**: The function operates in two main steps:

1. **Parallel Plot Creation**: Generates a parallel plot for the specified variables, with each line representing a sample from the `PNAS_plus` dataset. This plot allows for the visualization of patterns across multiple dimensions simultaneously, aiding in the identification of outliers and commonalities among samples.
2. **Bar Plot Generation**: For each specified variable, creates a bar plot displaying all samples in the `PNAS_plus` dataset, with bars ordered by their mean values. This visualization highlights the distribution and central tendencies of key metrics across samples, facilitating comparative analysis.

The function is designed to handle a large number of samples and variables efficiently, ensuring clarity in the visual output by implementing interactive features or segmenting plots as necessary.

**Value**: Visual representations including:

- A parallel plot for the selected variables across all samples.
- A series of bar plots for each variable, with samples ordered by their mean values.

**Developers**:

**Reviewers**:

**Examples**:

```
# Plot the samples in PNAS_plus dataset, variables might be "MNI", "MAU", "MNAU"
plotPNASplusSamples(new_data, PNAS_plus, variable = "MNAU")
```





---

plot_compare		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**





---

`plotAcReMNAUComparison`	Convert loaded MNE values into common derived variables

---



**Description**: Generates a plot comparing Accumulative Relative Minimum Number of Anatomic Units (AcReMNAU) between selected samples or categories from the `PNAS_plus` dataset and a new archaeological dataset. This function allows users to select either specific names or categories within `PNAS_plus` for comparison, offering insights into the preservation and representation patterns of skeletal parts across different archaeological findings.

**Usage**:

```
plotAcReMNAUComparison(PNAS_plus, newData, comparisonType = "name", selected = NULL)
```

**Arguments**:

- `PNAS_plus`: The loaded `PNAS_plus` dataset for comparison.
- `newData`: The new archaeological dataset to compare against `PNAS_plus`.
- `comparisonType`: Specifies the type of comparison. Can be "name" for specific sample names or "category" for broader categories within the dataset. Default is "name".
- `selected`: A vector of sample names or categories to be compared, depending on the `comparisonType`. If `NULL`, the function may default to comparing all available samples or categories, or prompt the user to select.

**Details**: This function calculates the AcReMNAU for each selected sample or category within both `PNAS_plus` and the new dataset, providing a basis for direct comparison. The AcReMNAU metric is pivotal for understanding the distribution and abundance of skeletal parts, reflecting on deposition practices, site use, and post-depositional processes. The visualization juxtaposes the AcReMNAU curves from both datasets, highlighting differences and similarities in preservation patterns. This comparison can be instrumental in drawing inferences about the archaeological context of the new findings.

**Value**: A plot visualizing the AcReMNAU comparisons between `PNAS_plus` and the new dataset, tailored based on the user's selection of samples or categories. The plot includes:

- Separate lines or bars for each selected sample or category, with clear differentiation between `PNAS_plus` and new data.
- Annotations or a legend indicating the names or categories being compared.
- Axes labels and a title reflecting the comparison being made.

**Developers**:

**Reviewers**:

**Examples**:

```
# Specify the names or categories for comparison
selectedNames <- c("Sample1", "Sample2") # Example for "name" comparisonType
# or for "category" comparisonType
selectedCategories <- c("Category1", "Category2")

# Plot AcReMNAU comparison between PNAS_plus and new dataset for selected names
plotAcReMNAUComparison(PNAS_plus, newSiteData, comparisonType = "name", selected = selectedNames)

# Plot AcReMNAU comparison between PNAS_plus and new dataset for selected categories
plotAcReMNAUComparison(PNAS_plus, newSiteData, comparisonType = "category", selected = selectedCategories)

```



---

calc_clutster		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**





---

cal_pca		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**





---

plot_cluster		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**





---

plot_cluster_hist		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**





---

plot_pca		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**





---

`subyRegression`		Convert loaded MNE values into common derived variables

---

**Description**: Conducts a regression analysis to explore the relationship between Bone Mineral Density (BMD) values, obtained through Photon Absorptiometry methods (DXA) and (VDM), and various taphonomic metrics such as MAU (Minimum Animal Units), MNAU (Minimum Number of Anatomic Units), their percentages, and Accumulative Relative MNAU (AcReMNAU). 

**Usage**:

```
regressionResults <- subyRegression(data, yVariable, xVariable = "DXA")
```

**Arguments**:

- `data`: The dataset containing the variables for analysis. It should include BMD values alongside taphonomic metrics.
- `yVariable`: The name of the taphonomic metric variable (e.g., "MAU", "MNAU", "PercentMAU", "PercentMNAU", "AcReMNAU") to be analyzed as the dependent variable.
- `xVariable`: The independent variable representing BMD values. Default is set to "BMD", assuming the dataset includes a column by this name.

**Details**: The function fits a linear regression model to the data, examining the influence of BMD on the selected taphonomic metric. It plots the data points along with the regression line to visually represent the relationship between the two variables. Additionally, the function calculates and reports key statistical measures, including the Pearson correlation coefficient (r²) to quantify the strength of the relationship and the p-value to assess its statistical significance.

**Value**: An object containing:

- `modelSummary`: A summary of the linear regression model, including coefficients, r², p-value, and other relevant statistics.
- `plot`: A plot visualizing the regression analysis, with data points and the fitted regression line.
- `correlationCoefficient`: The Pearson correlation coefficient (r²), indicating the strength of the relationship.
- `pValue`: The p-value, assessing the statistical significance of the observed relationship.

**References**:

**Developers**:

**Reviewers**:

**Examples**:

```
# Load data
data <- read.csv("path/to/your/archaeological_data.csv")

# Perform regression analysis with BMD as the independent variable and MAU as the dependent variable
regressionResults <- subyRegression(data, yVariable = "MAU")

# View the model summary
print(regressionResults$modelSummary)

# Display the regression plot
plot(regressionResults$plot)

# Access the Pearson correlation coefficient (r²) and p-value
cat("r²:", regressionResults$correlationCoefficient, "p-value:", regressionResults$pValue)
```





---

suby_regression_fauna		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**





---

suby_comparison		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**





---

plot_suby		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**





---

read_breakage_data		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**





---

breakage_cluster		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**





---

plot_breakage_cluster		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**

----

pnas_data							Skeletal part abundance PNAS_plus dataset 

----

**Description** 

**Usage** 

**Format** 

**References** 

**Source**



----

`loadBreakageData`	    Normalized long bone breakage data from archaeological sites 

----

**Description**  Normalized long  bone fracture patterns across various taphonomic contexts, including cannibalism, carnivore activity, cemeteries, burials, and mass graves, represented through percentage-based categories for each feature, aligning with methodologies established by Villa and Mahieu (1991).  

**Usage** breakageData <- loadBreakageData()

**Format** A data frame with 8 rows and 17 normalized semi-categorical one-hot-encoded  variables:

- `index `   Name of the archaeological site.
- `Fracture_Outline_Longitudinal`: Numeric, percentage of longitudinal fractures.
- `Fracture_Outline_Transverse`: Numeric, percentage of transverse fractures.
- `Fracture_Outline_Oblique_Curved`: Numeric, percentage of oblique/curved fractures.
- `Fracture_Angle_Right`: Numeric, percentage of fractures with a right angle.
- `Fracture_Angle_Oblique`: Numeric, percentage of fractures with an oblique angle.
- `Fracture_Angle_Mixed`: Numeric, percentage of fractures with mixed angles.
- `Fracture_Edge_Smooth`: Numeric, percentage of fractures with a smooth edge.
- `Fracture_Edge_Jagged`: Numeric, percentage of fractures with a jagged edge.
- `Fracture_Edge_Mixed`: Numeric, percentage of fractures with mixed edges.
- `Shaft_Circumference_Less_Than_Half`: Numeric, percentage of shaft circumferences less than half.
- `Shaft_Circumference_More_Than_Half`: Numeric, percentage of shaft circumferences more than half.
- `Shaft_Circumference_Complete`: Numeric, percentage of shaft circumferences complete.
- `Shaft_Fragment_Less_Than_Quarter`: Numeric, percentage of shaft fragments less than a quarter of the diaphysis.
- `Shaft_Fragment_Quarter_Half`: Numeric, percentage of shaft fragments between a quarter and half of the diaphysis.
- `Shaft_Fragment_Half_Three_Quarters`: Numeric, percentage of shaft fragments between half and three-quarters of the diaphysis.
- `Shaft_Fragment_More_Than_Three_Quarters`: Numeric, percentage of shaft fragments more than three-quarters of the diaphysis.

**References**  DEATHREVOL & Villa and Mahieu (1991)

**Source**	Data compiled from a multitude of published taphonomic studies, archaeological findings, and ethnoarchaeological research, all adhering to the classification standards set by Villa and Mahieu (1991). 



----

loadBreakageData_fauna				    Normalized fauna breakage data from archaeological sites 

----

**Description** 

**Usage** 

**Format** 

**References** 

**Source**



---

breakage_cleaning		Convert loaded MNE values into common derived variables

---

**Description** 

**Usage** 

**Arguments** 

**Details**

**Value** 

**References** 

**Developers** 

**Reviewers**

**Examples**



---

`validateBreakageData`       	Validates the dataset to expected formats and criteria necessary for analysis.

------

**Description**: This function checks the dataset to ensure it meets the specific requirements. It verifies column names, data types, and checks for missing values, ensuring that the dataset is correctly formatted and ready for further processing and analysis.

**Usage**:

```
validateBreakageData(data, autoCorrect = TRUE, verbose = TRUE)
```

**Arguments**:

- `data`: The dataset to be validated. This could be a path to a file or a dataframe already loaded into the R environment.
- `autoCorrect`: Logical flag indicating whether to automatically correct recognized issues (e.g., misspelled column names) based on predefined rules and mappings. Default is `TRUE`.
- `verbose`: Logical flag indicating whether to print detailed information about the validation process and any issues found. Default is `TRUE`.

**Details**: The function checks for:

- Missing values in essential columns.
- Correctness of column names, offering corrections for common misspellings or synonyms.
- Data type consistency across columns.
- Presence of all required columns for analysis.

If `autoCorrect` is enabled, the function will attempt to automatically resolve common issues, such as correcting column names based on a predefined list of known synonyms and common misspellings. The `verbose` option allows users to see detailed output of the validation process, which can aid in troubleshooting and ensuring data integrity.

**Value**: A list containing the following elements:

- `validatedBreakageData`: The validated (and possibly corrected) dataset, ready for further analysis.
- `validationBreakageReport`: A detailed report of the validation process, including any corrections made, issues found, and suggestions for unresolved issues.

**Developers**:

**Reviewers**: 

**Examples**:

```
# Load and validate dataset
datasetPath <- "path/to/your/dataset.csv"
validated <- validateBreakageData(datasetPath)

# Check the validation report
print(validated$validationBreakageReport)
```





----

`imputeMissingValues`  Imputes missing values in the dataset using different methods for taphonomic data.

------

**Description**: A function to identify missing values in the dataset and applies selected imputation methods to fill these gaps. 

**Usage**:

```
imputeMissingValues(data, method = "auto", fields = NULL, verbose = TRUE)
```

**Arguments**:

- `data`: The dataset in which missing values are to be imputed. This can either be a dataframe already loaded into the R environment or a path to a file.
- `method`: The imputation method to be used. Options include an Integer,  "mean", "median", "knn", "most_frequent" and "custom". Default is 0.
- `verbose`: Logical flag indicating whether to print detailed information about the imputation process, including the methods used. Default is `TRUE`.

**Details**: The function is designed to address various types of missing data scenarios commonly encountered in taphonomic datasets. Categorical fields may be imputed with the mode of most frequent values or through custom logic, while continuous fields may use mean, median, or k-nearest neighbors (KNN) for imputation. The function also supports user-defined functions for custom imputation strategies.

**Value**: A list containing the following elements:

- `imputedData`: The dataset after missing values have been imputed.
- `imputationReport`: A report detailing the imputation process, including the number of imputations performed for each field and the methods used.

**Developers**: 

**Reviewers**:

**Examples**:

```
# Load dataset and impute missing values with automatic method selection
data <- read.csv("path/to/your/dataset.csv")
imputedResults <- imputeMissingValues(data)

# Impute missing values in specific fields using the KNN method
imputedResultsKNN <- imputeMissingValues(data, method = "knn", fields = c("fracture_angle", "shaft_circumference"))

# View the imputation report
print(imputedResults$imputationReport)
```



---

`checkFeatureNames` Validates and corrects column names in the dataset to match expected standard names, addressing misspellings and synonyms.

------

**Description**: This function assesses the column names in the provided dataset, ensuring they align with the expected nomenclature required for taphonomic analysis. 

**Usage**:

```
checkFeatureNames(data, autoCorrect = TRUE, verbose = TRUE)
```

**Arguments**:

- `data`: The dataset whose column names are to be validated. This should be a dataframe already loaded into the R environment.
- `autoCorrect`: Logical flag indicating whether to automatically correct recognized misspellings and synonyms to their standard names. Default is `TRUE`.
- `verbose`: Logical flag indicating whether to print detailed information about the corrections made, including original and corrected column names. Default is `TRUE`.

**Details**: The function utilizes a predefined list of expected column names along with common misspellings and synonyms for those names. If `autoCorrect` is enabled, it will automatically replace incorrect names with the correct ones based on this list. If a column name cannot be confidently corrected, the function will prompt the user for clarification if `verbose` is `TRUE`, ensuring that all column names accurately reflect their respective data content before analysis.

**Value**: A list containing the following elements:

- `correctedData`: The dataset with corrected column names.
- `correctionReport`: A detailed report of the corrections made, including a mapping of original column names to their corrected versions.

**Developers**: 

**Reviewers**: 

**Examples**:

```
# Load dataset
data <- read.csv("path/to/your/dataset.csv")

# Validate and correct feature names
correctedResults <- checkFeatureNames(data)

# Optionally, to see detailed corrections without automatic correction
checkFeatureNames(data, autoCorrect = FALSE, verbose = TRUE)

# Access the corrected dataset and review the correction report
correctedData <- correctedResults$correctedData
print(correctedResults$correctionReport)
```



---

`exploreTaphoData`           Performs exploratory data analysis on taphonomic breakage datasets.

------

**Description**: This function facilitates a exploratory analysis of taphonomic datasets, employing a variety of statistical summaries, visualizations, and diagnostic tests to give insights into bone fractures data. 

**Usage**:

```
exploreTaphoData(data, reportType = "interactive", outputDir = NULL)
```

**Arguments**:

- `data`: The taphonomic dataset to be explored. This should be a dataframe containing variables relevant to taphonomic analysis.
- `reportType`: Specifies the type of report to generate. Options include "interactive" for a dynamic, web-based report, and "static" for a traditional, printed report. Default is "interactive".
- `outputDir`: The directory path where the report or output files should be saved. If `NULL` (default), the report is displayed directly in the R session or viewer pane without saving to disk.

**Details**: The function automatically performs various EDA tasks, such as:

- Generating summary statistics for each variable (mean, median, mode, range, etc.).
- Creating visualizations like histograms, box plots, and scatter plots to display distributions and relationships.
- Conducting basic diagnostic tests to check for normality, homogeneity of variances, etc.
- Identifying potential outliers or anomalies in the dataset.

**Value**: Depending on the `reportType` selected, the function either generates an interactive web-based report (HTML format) that can be viewed in a web browser or produces a series of static plots and summaries presented directly in the R console or saved to the specified `outputDir`.

**Examples**:

```
# Load taphonomic dataset
data <- read.csv("path/to/your/dataset.csv")

# Perform exploratory data analysis with an interactive report
exploreTaphoData(data)

# Generate a static report and save to a specified directory
exploreTaphoData(data, reportType = "static", outputDir = "path/to/save/report")
```



---

`clusterBreakageData`                   Applies clustering algorithms to taphonomic breakage data.

------

**Description**: A function for clustering taphonomic datasets, supporting various algorithms such as hierarchical clustering (HCLUST), K-means, K-medoids (PAM), and DBSCAN.

**Usage**:

```
clusterBreakageData(data, method = "kmeans", clusters = "auto" , distMeasure = "euclidean" )
```

**Arguments**:

- `data`: The dataset containing bone breakage characteristics to be clustered. Expected to be a dataframe where rows represent observations, and columns represent features relevant to clustering.
- `method`: The clustering algorithm to use. Options include "hclust" for hierarchical clustering, "kmeans" for K-means clustering, "kmedoids" for K-medoids clustering, and "dbscan" for DBSCAN. Default is "kmeans".
- `clusters`: The number of clusters to form (for K-means and K-medoids) or the height (for hierarchical clustering). For DBSCAN, this parameter is ignored. In "auto" choses best number of clusters by running silhouette method and/or Elbow method. Default is `auto`. 
- `distMeasure`: The distance measure to be used. Default is "euclidean". Other options (e.g., "manhattan") may be available depending on the chosen method.

**Details**: The function preprocesses the data as needed (e.g., scaling) based on the chosen method, performs the clustering, and then outputs the results, which can include cluster assignments for each observation and measures of cluster quality. For hierarchical clustering, an option to plot a dendrogram is available.

**Value**: An object containing the results of the clustering analysis. This includes:

- `clusterAssignments`: A vector of cluster assignments for each observation in the dataset.
- `clusterCenters`: (For K-means and K-medoids) The centroids or medoids of each cluster.
- `silhouetteWidth`: A measure of cluster cohesion and separation, if applicable.
- Additional output specific to the chosen clustering method.

**Examples**:

```
# Load breakage data
data <- read.csv("path/to/breakage_data.csv")

# Cluster using K-means with 3 clusters
resultsKmeans <- clusterBreakageData(data, method = "kmeans", clusters = 3)

# Cluster using hierarchical clustering
resultsHclust <- clusterBreakageData(data, method = "hclust", clusters = 2)

# Cluster using DBSCAN with default parameters
resultsDBSCAN <- clusterBreakageData(data, method = "dbscan")
```





----

`performPCA` 					Conducts PCA on bone breakage data

------

**Description**: This function applies PCA to taphonomic datasets, transforming the original variables into a new set of uncorrelated variables (principal components) ordered by the amount of variance they capture from the data. 

**Usage**:

```
pcaResults <- performPCA(data, components = NULL, scale = TRUE)
```

**Arguments**:

- `data`: The dataset to be analyzed, expected to be a dataframe where rows represent observations (e.g., bone samples) and columns represent features (e.g., fracture outline, angle).
- `components`: The number of principal components to retain. If `NULL` (default), all components are retained.
- `scale`: Logical flag indicating whether to scale (standardize) the variables before applying PCA. Default is `TRUE`, which standardizes variables to have mean 0 and variance 1, ensuring that PCA results are not biased by the original variables' scale.

**Details**: The function starts by optionally scaling the data, then computes the covariance matrix (or correlation matrix if data is scaled) from which the eigenvalues and eigenvectors are derived. These eigenvalues and eigenvectors represent the principal components and their associated variances. The function then projects the original data onto these principal components to transform the dataset into its principal component space.

**Value**: An object containing the PCA results, which includes:

- `components`: The principal components (eigenvectors) of the data.
- `explainedVariance`: The proportion of variance explained by each principal component.
- `scores`: The original data transformed into the principal component space.
- `loadings`: The loadings (coefficients) of the original variables on the principal components, useful for interpreting the components.

**Examples**:

```
# Load taphonomic dataset
data <- read.csv("path/to/your/dataset.csv")

# Perform PCA retaining all components
pcaAll <- performPCA(data)

# Perform PCA focusing on the first two components
pcaTwoComponents <- performPCA(data, components = 2)

# Examine the variance explained by the first two components
print(pcaTwoComponents$explainedVariance)
```



----

`plotAnalysisResults` 		Generates 2D or 3D plots of bone breakage data

------

**Description**: This function plots results from clustering algorithms (`clusterBreakageData`) and PCA (`performPCA`) to create interpretable visualizations. 

**Usage**:

```
plotAnalysisResults(data, analysisType = "PCA", plotType = "2D", components = c(1, 2), clusterResults = NULL)
```

**Arguments**:

- `data`: The original dataset or the transformed dataset from PCA. For clustering visualizations, this should be the dataset with cluster assignments.
- `analysisType`: Specifies the type of analysis to visualize. Options are "PCA" for Principal Component Analysis and "Cluster" for clustering results. Default is "PCA".
- `plotType`: The dimensionality of the plot. Options include "2D" and "3D". Default is "2D".
- `components`: For PCA, a vector specifying which principal components to plot. For 2D plots, two components (e.g., `c(1, 2)`); for 3D plots, three components (e.g., `c(1, 2, 3)`). Ignored for clustering plots.
- `clusterResults`: For clustering visualizations, a vector of cluster assignments corresponding to each observation in `data`. Required if `analysisType` is "Cluster".

**Details**: For PCA plots, the function uses the specified principal components to create scatter plots, highlighting the variance and structure captured by the PCA. For clustering plots, the data points are colored based on their cluster assignments, illustrating the grouping discovered by the clustering algorithm. The 3D plots are interactive, allowing users to rotate and explore the data from different angles.

**Value**: A plot object (2D or 3D) visualizing the specified analysis results. This could be a static plot for quick exploration or an interactive plot for in-depth examination, depending on the `plotType`.

**Examples**:

```
# Load and preprocess dataset
data <- read.csv("path/to/your/dataset.csv")
pcaResults <- performPCA(data)

# Plot the first two principal components in 2D
plotAnalysisResults(data = pcaResults$scores, analysisType = "PCA", plotType = "2D", components = c(1, 2))

# Assuming clustering was performed on the PCA scores
clusterAssignments <- clusterBreakageData(pcaResults$scores, method = "kmeans", clusters = 3)$clusterAssignments

# Plot clustering results in 3D based on the first three PCA components
plotAnalysisResults(data = pcaResults$scores, analysisType = "Cluster", plotType = "3D", com
```

----





## Index





***datasets**

​	pnas_plus

​	breakage_data

​	breakage_data_fauna

plot.a

plot.b

plot.b

print.a

print.b

print.c

