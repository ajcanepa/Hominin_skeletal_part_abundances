library(dplyr)
library(rsample)
library(purrr)


preprocess <- function(data) {
  # Set "Ref" as Index
  data <- tibble::column_to_rownames(data, var = "X")
  
  # Drop subcategories in extremities
  cols = c("Metacarpal", "Metatarsal", "Hand.phalanx", "Foot.phalanx")
  data <- data %>% select(-all_of(cols[cols %in% names(data)]))
  
  # Divide "bone-cols" by 100
  cols_to_convert <- setdiff(names(data), c("Type", "AccumulationType", "Individuals"))
  if ("Cluster_Pnas" %in% names(data)){
    cols_to_convert <- setdiff(cols_to_convert, "Cluster_Pnas")
  }
  data[cols_to_convert] <- lapply(data[cols_to_convert], function(x) x / 100)
  
  return(data)
}

########

split_train_SH <- function(data, row_names = NULL) {
  
  # Default to "Sima_de_los_Huesos" if test_condition is not provided or empty
  if (is.null(row_names) || row_names == "") {
    row_names <- "Sima_de_los_Huesos"
  }
  
  # Convert rownames to a vector if it's not already
  rownames_vector <- rownames(data)
  
  # Find indices of specified row names
  indices <- which(rownames_vector %in% row_names)
  
  # Split the data into test set and the rest based on the given condition
  sh_data <- data %>% slice(indices)
  train_data <- data %>% slice(-indices)
  
  return(list(train_data = train_data, sh_data = sh_data))
}

#########

split_train_test_SH <- function(data, row_names = NULL, strata = NULL, prop = 0.7) {
  
  # Default to "Sima_de_los_Huesos" if test_condition is not provided or empty
  if (is.null(row_names) || row_names == "") {
    row_names <- "Sima_de_los_Huesos"
  }
  
  # Convert rownames to a vector if it's not already
  rownames_vector <- rownames(data)
  
  # Find indices of specified row names
  indices <- which(rownames_vector %in% row_names)
  
  # Split the data into val set and the rest based on the given condition
  sh_data <- data %>% slice(indices)
  rest_data <- data %>% slice(-indices)
  
  # Split rest into into test and train set
  split_obj <- initial_split(rest_data, prop = prop, strata = strata)
  train_data <- training(split_obj)
  test_data <- testing(split_obj)
  
  return(list(train_data = train_data, test_data = test_data,sh_data = sh_data))
}

###########


abbreviated_columns <- function(data) {
  
  name_mapping <- c(
    "Type" = "Type",
    "AccumulationType" = "AccumulationType",
    "CRN" = "Cranium",
    "MR" = "Mandible",
    "CE" = "Cervical",
    "TH" = "Thoracic",
    "LM" = "Lumbar",
    "SAC" = "Sacrum",
    "ST" = "Sternum",
    "CLA" = "Clavicle",
    "RB" = "Rib",
    "SC" = "Scapula",
    "HM" = "Humerus",
    "RD" = "Radius",
    "UL" = "Ulna",
    "CP" = "Carpal",
    #"MC" ="Metacarpal" ,
    "IM" = "Innominate",
    "FM" = "Femur",
    "PT" = "Patella",
    "TA" = "Tibia",
    "FB" = "Fibula",
    "TR" = "Tarsal",
    #"MT" = "Metatarsal",
    #"HDPH" = "Hand.phalanx",
    #"FTPH" = "Foot.phalanx",
    "HD" = "Hand..metacarpals...manual.phalanges.",
    "FT" = "Foot..metatarsals...pedal.phalanges.",
    "Cluster_Pnas" = "Cluster_Pnas"
  )  
  
  # Use rename() with unquote-splicing (!!!) to apply the name mapping
  data_cor <- data %>% rename(!!!name_mapping)
  return(data_cor)
}

##########

abbreviated_columns_multi <- function(data) {
  
  name_mapping <- c(
    "Type" = "Type",
    "AccumulationType" = "AccumulationType",
    "CRN" = "Cranium",
    "MR" = "Mandible",
    "CE" = "Cervical",
    "TH" = "Thoracic",
    "LM" = "Lumbar",
    "SAC" = "Sacrum",
    "ST" = "Sternum",
    "CLA" = "Clavicle",
    "RB" = "Rib",
    "SC" = "Scapula",
    "HM" = "Humerus",
    "RD" = "Radius",
    "UL" = "Ulna",
    "CP" = "Carpal",
    #"MC" ="Metacarpal" ,
    "IM" = "Innominate",
    "FM" = "Femur",
    "PT" = "Patella",
    "TA" = "Tibia",
    "FB" = "Fibula",
    "TR" = "Tarsal",
    #"MT" = "Metatarsal",
    #"HDPH" = "Hand.phalanx",
    #"FTPH" = "Foot.phalanx",
    "HD" = "Hand..metacarpals...manual.phalanges.",
    "FT" = "Foot..metatarsals...pedal.phalanges."
    #"Cluster_Pnas" = "Cluster_Pnas"
  )  
  
  # Use rename() with unquote-splicing (!!!) to apply the name mapping
  data_cor <- data %>% rename(!!!name_mapping)
  return(data_cor)
}

###########

merge_bone_cat_by_mean <- function(data) {
  # Store original row names
  original_row_names <- rownames(data)
  
  # Define groups of features
  groups <- list(
    Vertebra = c("Cervical", "Thoracic", "Lumbar", "Sacrum", "Rib"),
    Arm = c("Humerus", "Radius", "Ulna"),
    Leg = c("Femur", "Tibia", "Fibula"),
    Extremities = c("Carpal", "Tarsal", "Hand..metacarpals...manual.phalanges.", "Foot..metatarsals...pedal.phalanges.")
  )
  
  # List to keep track of all features used
  all_used_features <- c()
  
  # Calculate the mean for each group and add as new column
  for (group_name in names(groups)) {
    features <- groups[[group_name]]
    all_used_features <- c(all_used_features, features)
    data[[group_name]] <- rowMeans(data[, features, drop = FALSE], na.rm = TRUE)
  }
  
  # Drop used features and restore original row names
  data <- data %>% select(-all_of(all_used_features))
  rownames(data) <- original_row_names
  
  return(data)
}