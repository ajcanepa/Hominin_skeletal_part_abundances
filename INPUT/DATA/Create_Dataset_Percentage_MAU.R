# Load necessary library
library(tidyverse)
library(readxl)
library(dplyr)

# Read the entire Excel file
file_path <- "INPUT/DATA/pnas.1718678115.sd01.xlsx"

all_sheets <- import_list(file_path)


# Create dataframes for each sheet
sheet_names <- names(all_sheets)

for (sheet_name in sheet_names) {
  assign(gsub(" |-", "_", sheet_name), all_sheets[[sheet_name]], envir = .GlobalEnv)
}

# List all dataframe names
dataframe_names <- gsub(" |-", "_", sheet_names)

# Prepare the columns/feature names based on SH$"Unnamed: 0"
columns = Sima_de_los_Huesos$"...1"[2:27]


# Create an empty dataframe
Summary_Dataset_Multivar_Percentage_MAU <- as.data.frame(matrix(nrow = length(dataframe_names), ncol = length(columns)))

names(Summary_Dataset_Multivar_Percentage_MAU) <- columns
rownames(Summary_Dataset_Multivar_Percentage_MAU) <- dataframe_names


# Repopulate the dataframe
for (df_name in dataframe_names) {
  df <- get(df_name)
  
  # Find the column containing "%MAU"
  target_col <- colnames(df)[which(df[1,] == "%MAU")]
  
  # Extract the relevant values and assign to the summary dataframe
  values <- df[[target_col]][2:28]
  Summary_Dataset_Multivar_Percentage_MAU[df_name, 1:length(values)] <- values
}


#### Add "Type" feature ####
assign_type <- function(index_name) {
  if (index_name %in% c('Hummingbird_Pueblo_Pueblo_I', 'Pottery_Mound_Pueblo_IV', 'Kuaua_Pueblo_Pueblo_IV',
                        'Dolni_Vestonice_I_DV_3', 'Dolni_Vestonice_IITriple_Burial', 'Dolni_Vestonice')) {
    return('Primary hominin interment')
  } else if (index_name %in% c('Skhul_Layer_B', 'Qafzeh_Couche_XVII', 'Regourdou', 'La_Chapelle_aux_Saints',
                               'Tabun_Layer_C', 'Shanidar_Layer_D_Upper', 'Shanidar_Layer_D_Lower', 'Shanidar_Layer', 'Kebara_Couche_XII', 'El_Miron')) {
    return('Possible Primary hominin interment')
  } else if (index_name %in% c('Sima_de_los_Huesos', 'Dinaledi')) {
    return('Possible hominin deliberate disposal')
  } else if (index_name %in% c('Fontbregoua_H1', 'Fontbregoua_H3', 'Gran_Dolina_TD6', 'El_Mirador_MIR4A', "Gough's_Cave",
                               '5MT_3', '5MT_10010_Feature_3', 'La_Tolita_Cama_de_Huesos', 'Crow_Creek', 'Krapina')) {
    return('Hominin cannibalism/ secondary interment')
  } else if (index_name %in% c('Liang_Bua_Layer_R', 'Liang_Bua_Layer_OQ', 'Liang_Bua', 'Dmanisi_Layer_B1y', 'Malapa', 'AL_333')) {
    return('Nonanthropogenic hominin accumulation')
  } else if (index_name == 'Misgrot_Cave') {
    return('Natural Baboon accumulation')
  } else if (index_name == 'Unscavenged_human_corpses_WA') {
    return('Unscavenged human corpses')
  } else if (index_name %in% c('Scavenged_human_corpses_WA', 'Scavenged_human_corpses_NM', 'Scavenged_human_corpse_NC')) {
    return('Scavenged human corpses')
  } else if (index_name %in% c('Mapungubwe_leopard_kills', 'Leopard_refuse')) {
    return('Leopard refuse')
  } else {
    return('Unknown')
  }
}

# Create the "Type" column based on row names
Summary_Dataset_Multivar_Percentage_MAU$Type <- sapply(rownames(Summary_Dataset_Multivar_Percentage_MAU), assign_type)

#"Type" column as the first column
Summary_Dataset_Multivar_Percentage_MAU <- Summary_Dataset_Multivar_Percentage_MAU[, c("Type", names(Summary_Dataset_Multivar_Percentage_MAU)[-ncol(Summary_Dataset_Multivar_Percentage_MAU)])]


#### Add "AccumulationType" feature ####
categorize_types <- function(type_value) {
  if (type_value %in% c('Primary hominin interment', 'Possible Primary hominin interment', 
                        'Possible hominin deliberate disposal')) {
    return('Burial')
  } else if (type_value == 'Hominin cannibalism/ secondary interment') {
    return('Cannibalism/Mass Grave')
  } else if (type_value %in% c('Nonanthropogenic hominin accumulation', 'Natural Baboon accumulation', 
                               'Unscavenged human corpses')) {
    return('Non-human/ non-carnivore intervention')
  } else if (type_value %in% c('Leopard refuse', 'Scavenged human corpses')) {
    return('Carnivore intervention')
  } else {
    return('Unknown')
  }
}

# Add the 'AccumulationType' column based on 'Type' column
Summary_Dataset_Multivar_Percentage_MAU <- Summary_Dataset_Multivar_Percentage_MAU %>%
  mutate(AccumulationType = sapply(Type, categorize_types))

# Move the 'AccumulationType' column to the second position
Summary_Dataset_Multivar_Percentage_MAU <- Summary_Dataset_Multivar_Percentage_MAU %>%
  select(Type, AccumulationType, everything())


# Save dataset Summary_Dataset_Multivar_Percentage_MAU as CSV
write.csv(Summary_Dataset_Multivar_Percentage_MAU, "INPUT/DATA/Summary_Dataset_Multivar_Percentage_MAU.csv", row.names = TRUE)


##### Used dataset ####

# Save dataset used in Pnas
samples_used <- c(
  "Pottery_Mound_Pueblo_IV",
  "Kuaua_Pueblo_Pueblo_IV",
  "Skhul_Layer_B",
  "Fontbregoua_H1",
  "Fontbregoua_H3",
  "Gran_Dolina_TD6",
  "El_Mirador_MIR4A",
  "Krapina",
  "AL_333",
  "Unscavenged_human_corpses_WA",
  "Scavenged_human_corpses_WA",
  "Mapungubwe_leopard_kills",
  "Leopard_refuse",
  "Misgrot_Cave",
  "Sima_de_los_Huesos",
  "Dinaledi"
)

Summary_Dataset_Used_Percentage_MAU <- Summary_Dataset_Multivar_Percentage_MAU[samples_used,]

# Add Cluster categories from Pnas for multiclass classification
# Define the clusters based on the index names
cluster_A <- c('Pottery_Mound_Pueblo_IV', 'Unscavenged_human_corpses_WA', 'Kuaua_Pueblo_Pueblo_IV')
cluster_B <- c('Mapungubwe_leopard_kills', 'Skhul_Layer_B', 'Leopard_refuse')
cluster_C <- c('Fontbregoua_H1', 'El_Mirador_MIR4A', 'Gran_Dolina_TD6', 'AL_333', 'Fontbregoua_H3', 'Krapina')
cluster_D <- c('Scavenged_human_corpses_WA', 'Sima_de_los_Huesos', 'Dinaledi', 'Misgrot_Cave')

assign_clusters <- function(df) {
  df$Cluster_Pnas <- NA
  df[rownames(df) %in% cluster_A, "Cluster_Pnas"] <- 'A'
  df[rownames(df) %in% cluster_B, "Cluster_Pnas"] <- 'B'
  df[rownames(df) %in% cluster_C, "Cluster_Pnas"] <- 'C'
  df[rownames(df) %in% cluster_D, "Cluster_Pnas"] <- 'D'
  return(df)
}

# Assign the cluster labels to the four dataframes
Summary_Dataset_Used_Percentage_MAU = assign_clusters(Summary_Dataset_Used_Percentage_MAU)

# Save "used" dataset
write.csv(Summary_Dataset_Used_Percentage_MAU, "INPUT/DATA/Summary_Dataset_Used_Percentage_MAU.csv", row.names = TRUE)


