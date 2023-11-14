preprocess <- function(data) {
  #set "Ref" as Index
  data <- tibble::column_to_rownames(data, var = "Ref")
  
  #Drop subcategories in extremities
  cols = c("Metacarpal", "Metatarsal", "Hand phalanx", "Foot phalanx")
  for (col in cols) {
    if (col %in% names(data))
    {
      data <- data %>% select(-col)
    }}
  
  # divide "bone-cols" by 100
  if ("Cluster_Pnas" %in% names(data)){
  cols_to_convert <- setdiff(names(data), c("Type", "AccumulationType", "Individuals", "Cluster_Pnas"))
  } else{
    cols_to_convert <- setdiff(names(data), c("Type", "AccumulationType", "Individuals"))
  }
  data[cols_to_convert] <- lapply(data[cols_to_convert], function(x) x / 100)
  
  return(data)
}

