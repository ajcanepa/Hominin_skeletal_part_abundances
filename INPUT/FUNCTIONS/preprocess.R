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


############


grid_cluster <-function(list_of_dfs){
  
  
  # Number of clusters to evaluate for K-means
  k_values <- c(2, 3, 4, 5,6,7,8)
  
  # Hyperparameters for DBSCAN (example ranges)
  eps_values <- seq(0.1, 1, 0.2)
  minPts_values <- c(5, 10, 15)
  
  # Parameters for hierarchical clustering
  hclust_methods <- c("ward.D", "single", "complete", "average")
  
  # List to store results and best models
  results <- list()
  best_models <- list(kmeans = list(score = -Inf, model = NULL),
                      dbscan = list(score = -Inf, model = NULL),
                      hclust = list(score = -Inf, model = NULL))
  
  # Function to perform K-means clustering
  perform_kmeans <- function(data, k, method) {
    set.seed(42)
    kmeans_result <- kmeans(data, centers = k, nstart = 25, algorithm = method)
    silhouette_score <- mean(silhouette(kmeans_result$cluster, dist(data))[, 3])
    return(list(cluster = kmeans_result$cluster, score = silhouette_score))
  }
  
  # Function to perform DBSCAN clustering
  perform_dbscan <- function(data, eps, minPts) {
    # Perform DBSCAN clustering
    dbscan_result <- dbscan::dbscan(data, eps = eps, minPts = minPts)
    
    # Exclude noise points (cluster = 0) from silhouette score calculation
    valid_clusters <- dbscan_result$cluster[dbscan_result$cluster != 0]
    valid_data <- data[dbscan_result$cluster != 0, ]
    
    # Check if there are valid clusters to avoid errors in silhouette calculation
    if (length(unique(valid_clusters)) > 1) {
      silhouette_score <- mean(silhouette(valid_clusters, dist(valid_data))[, 3])
    } else {
      # Assign a default low score if there's only one cluster or none
      silhouette_score <- -1
    }
    
    return(list(cluster = dbscan_result$cluster, score = silhouette_score))
  }
  
  
  # Function to perform hierarchical clustering
  perform_hclust <- function(data, method, k) {
    hc <- hclust(dist(data), method = method)
    clusters <- cutree(hc, k = k)
    silhouette_score <- mean(silhouette(clusters, dist(data))[, 3])
    return(list(cluster = clusters, score = silhouette_score))
  }
  
  # Loop through each dataframe
  for (i in seq_along(list_of_dfs)) {
    df <- list_of_dfs[[i]]
    
    # K-means
    for (k in k_values) {
      for (method in c("Hartigan-Wong", "Lloyd", "Forgy",
                       "MacQueen")) {
        result <- perform_kmeans(df, k, method)
        if (result$score > best_models$kmeans$score) {
          best_models$kmeans <- list(score = result$score, model = result$cluster, dataframe = i, k = k, method = method)
        }
      }
    }
    
    # DBSCAN
    for (eps in eps_values) {
      for (minPts in minPts_values) {
        result <- perform_dbscan(df, eps, minPts)
        if (result$score > best_models$dbscan$score) {
          best_models$dbscan <- list(score = result$score, model = result$cluster, dataframe = i, eps = eps, minPts = minPts)
        }
      }
    }
    
    # Hierarchical Clustering
    for (method in hclust_methods) {
      for (k in k_values) {
        result <- perform_hclust(df, method, k)
        if (result$score > best_models$hclust$score) {
          best_models$hclust <- list(score = result$score, model = result$cluster, dataframe = i, k = k, method = method)
        }
      }
    }
  }
  
  return(best_models)
}