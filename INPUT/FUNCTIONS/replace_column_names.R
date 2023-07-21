# Function to replace empty spaces and parentheses with a backslash
replace_column_names <- function(df) {
  colnames(df) <- gsub("[ ()+]+", "_", colnames(df))
  return(df)
}