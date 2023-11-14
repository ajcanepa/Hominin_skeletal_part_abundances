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
Summary_Dataset_Multivar_Percentage_MNAU <- as.data.frame(matrix(nrow = length(dataframe_names), ncol = length(columns)))

names(Summary_Dataset_Multivar_Percentage_MNAU) <- columns
rownames(Summary_Dataset_Multivar_Percentage_MNAU) <- dataframe_names


# Repopulate the dataframe
for (df_name in dataframe_names) {
  df <- get(df_name)
  
  # Find the column containing "MAU"
  target_col <- colnames(df)[which(df[1,] == "MAU")]
  
  # Extract the relevant values and assign to the summary dataframe
  values <- df[[target_col]][2:27]
  Summary_Dataset_Multivar_Percentage_MNAU[df_name, 1:length(values)] <- values
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
Summary_Dataset_Multivar_MPercentage_MNAU$Type <- sapply(rownames(Summary_Dataset_Multivar_Percentage_MNAU), assign_type)

#"Type" column as the first column
Summary_Dataset_Multivar_Percentage_MNAU <- Summary_Dataset_Multivar_Percentage_MNAU[, c("Type", names(Summary_Dataset_Multivar_Percentage_MNAU)[-ncol(Summary_Dataset_Multivar_Percentage_MNAU)])]


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
Summary_Dataset_Multivar_Percentage_MNAU <- Summary_Dataset_Multivar_Percentage_MNAU %>%
  mutate(AccumulationType = sapply(Type, categorize_types))

# Move the 'AccumulationType' column to the second position
Summary_Dataset_Multivar_Percentage_MNAU <- Summary_Dataset_Multivar_Percentage_MNAU %>%
  select(Type, AccumulationType, everything())


#### Add number of individuals as feature ####
individuals_dict <- c("Hummingbird_Pueblo_Pueblo_I" = 6,
                      "Pottery_Mound_Pueblo_IV" = 49,
                      "Kuaua_Pueblo_Pueblo_IV" = 84,
                      "Dolni_Vestonice_I_DV_3" = 1,
                      "Dolni_Vestonice_IITriple_Burial" = 2,
                      "Skhul_Layer_B" = 6,
                      "Qafzeh_Couche_XVII" = 2,
                      "Regourdou" = 1,
                      "La_Chapelle_aux_Saints" = 1,
                      "Tabun_Layer_C" = 1,
                      "Shanidar_Layer_D_Upper" = 3,
                      "Shanidar_Layer_D_Lower" = 4,
                      "Kebara_Couche_XII" = 1,
                      "Fontbregoua_H1" = 7,
                      "Fontbregoua_H3" = 6,
                      "Gran_Dolina_TD6" = 2,
                      "El_Mirador_MIR4A" = 5,
                      "Gough's_Cave" = 3,
                      "5MT_3" = 10,
                      "5MT_10010_Feature_3" = 5,
                      "El_Miron" = 1,
                      "La_Tolita_Cama_de_Huesos" = 11,
                      "Crow_Creek" = 476,
                      "Krapina" = 43,
                      "Liang_Bua_Layer_R" = 2,
                      "Liang_Bua_Layer_OQ" = 6,
                      "Dmanisi_Layer_B1y" = 4,
                      "Malapa" = 1,
                      "AL_333" = 13,
                      "Unscavenged_human_corpses_WA" = 17,
                      "Scavenged_human_corpses_WA" = 45,
                      "Scavenged_human_corpses_NM" = 7,
                      "Scavenged_human_corpse_NC" = 1,
                      "Mapungubwe_leopard_kills" = 7,
                      "Leopard_refuse" = 8,
                      "Misgrot_Cave" = 7,
                      "Sima_de_los_Huesos" = 18,
                      "Dinaledi" = 13)

# Add the "Individuals" column
Summary_Dataset_Multivar_Percentage_MNAU <- Summary_Dataset_Multivar_Percentage_MNAU %>%
  mutate(Individuals = individuals_dict[match(rownames(Summary_Dataset_Multivar_Percentage_MNAU), names(individuals_dict))])

# Move "Individuals" to the third position
Summary_Dataset_Multivar_Percentage_MNAU <- Summary_Dataset_Multivar_Percentage_MNAU %>%
  select(1:2, Individuals, everything())

# Convert '-' to "nan"
char_cols <- sapply(Summary_Dataset_Multivar_Percentage_MNAU, is.character)
Summary_Dataset_Multivar_Percentage_MNAU[char_cols] <- lapply(Summary_Dataset_Multivar_Percentage_MNAU[char_cols], na_if, '-')

# Convert non-numeric to type tumeric
cols_to_convert <- setdiff(names(Summary_Dataset_Multivar_Percentage_MNAU), c("Type", "AccumulationType"))
Summary_Dataset_Multivar_Percentage_MNAU[cols_to_convert] <- lapply(Summary_Dataset_Multivar_Percentage_MNAU[cols_to_convert], function(x) {
  if (is.character(x)) as.numeric(na_if(x, "-")) else x
})


# Caluculate MAU/MNI values by dividing by "Individuals" in "%" 
Summary_Dataset_Multivar_Percentage_MNAU <- Summary_Dataset_Multivar_Percentage_MNAU %>%
  mutate(across(-c(Type, AccumulationType, Individuals), ~./Individuals*100))



# Save dataset Summary_Dataset_Multivar_Percentage_MNAU as CSV
write.csv(Summary_Dataset_Multivar_Percentage_MNAU, "INPUT/DATA/Summary_Dataset_Multivar_Percentage_MNAU.csv", row.names = TRUE)


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

Summary_Dataset_Used_Percentage_MNAU <- Summary_Dataset_Multivar_Percentage_MNAU[samples_used,]

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
Summary_Dataset_Used_Percentage_MNAU = assign_clusters(Summary_Dataset_Used_Percentage_MNAU)

# Save "used" dataset
write.csv(Summary_Dataset_Used_Percentage_MNAU, "INPUT/DATA/Summary_Dataset_Used_Percentage_MNAU.csv", row.names = TRUE)


