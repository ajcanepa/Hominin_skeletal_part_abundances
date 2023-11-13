import pandas as pd

# Read the entire Excel file
all_sheets = pd.read_excel("pnas.1718678115.sd01.xlsx", sheet_name=None)

# Get the sheet names
sheet_names = list(all_sheets.keys())

# Drop Dinaledi 
#sheet_names = sheet_names[:-1]

# Dynamically create dataframes for each sheet
for sheet_name in sheet_names:
    globals()[sheet_name.replace(" ", "_").replace("-", "_")] = all_sheets[sheet_name]

# List all dataframe names
dataframe_names = [sheet_name.replace(" ", "_").replace("-", "_") for sheet_name in sheet_names]

# Prepare the columns based on Dinaledi["Unnamed: 0"]
columns = Sima_de_los_Huesos["Unnamed: 0"].iloc[1:27].tolist()

# Create an empty dataframe with the desired structure
Summary_Dataset_Multivar_Percentage_MAU = pd.DataFrame(index=dataframe_names, columns= columns)

# Repopulate the dataframe using .iloc for positional indexing
for df_name in dataframe_names:
    df = globals()[df_name]
    
    # Find the column containing "%MAU"
    for col in df.columns:
        if df[col].iloc[0] == "%MAU":
            target_col = col
            break
    
    # Extract the relevant values and assign to the summary dataframe
    values = df[target_col].iloc[1:27].tolist()
    Summary_Dataset_Multivar_Percentage_MAU.iloc[dataframe_names.index(df_name), :len(values)] = values

# Merge same "yacimentos" with MNE weights
#index_pairs = [
#    ("Dolni_Vestonice","Dolni_Vestonice_I_DV_3", "Dolni_Vestonice_IITriple_Burial", 2, 1),
#    ("Shanidar_Layer","Shanidar_Layer_D_Upper", "Shanidar_Layer_D_Lower", 3, 4),
#    ("Liang_Bua","Liang_Bua_Layer_OQ", "Liang_Bua_Layer_R", 1, 1)
#]

# Loop through the index pairs
#for name, index1, index2, weight1, weight2 in index_pairs:
    # Convert the values to numeric type
#    values1 = pd.to_numeric(Summary_Dataset_Multivar_Percentage_MAU.loc[index1], errors='coerce')
#    values2 = pd.to_numeric(Summary_Dataset_Multivar_Percentage_MAU.loc[index2], errors='coerce')
    
    # Calculate the weighted mean
#    weighted_mean = (weight1 * values1 + weight2 * values2) / (weight1 + weight2)
    
    # Update the merged index with the weighted mean
#    Summary_Dataset_Multivar_Percentage_MAU.loc[name] = weighted_mean
    
    # Drop index2 from the DataFrame
#    Summary_Dataset_Multivar_Percentage_MAU = Summary_Dataset_Multivar_Percentage_MAU.drop([index1, index2])
    

# Add "Type" feature
def assign_type(index_name):
    if index_name in ['Hummingbird_Pueblo_Pueblo_I', 'Pottery_Mound_Pueblo_IV', 'Kuaua_Pueblo_Pueblo_IV',
                      'Dolni_Vestonice_I_DV_3', 'Dolni_Vestonice_IITriple_Burial', 'Dolni_Vestonice']:
        return 'Primary hominin interment'    
    elif index_name in ['Skhul_Layer_B', 'Qafzeh_Couche_XVII', 'Regourdou', 'La_Chapelle_aux_Saints',
                        'Tabun_Layer_C', 'Shanidar_Layer_D_Upper', 'Shanidar_Layer_D_Lower', 'Shanidar_Layer', 'Kebara_Couche_XII', 'El_Miron']:
        return 'Possible Primary hominin interment'    
    elif index_name in ['Sima_de_los_Huesos', 'Dinaledi']:
        return 'Possible hominin deliberate disposal'    
    elif index_name in ['Fontbregoua_H1', 'Fontbregoua_H3', 'Gran_Dolina_TD6', 'El_Mirador_MIR4A', "Gough's_Cave",
                        '5MT_3', '5MT_10010_Feature_3', 'La_Tolita_Cama_de_Huesos', 'Crow_Creek', 'Krapina']:
        return 'Hominin cannibalism/ secondary interment'
    elif index_name in ['Liang_Bua_Layer_R', 'Liang_Bua_Layer_OQ', 'Liang_Bua', 'Dmanisi_Layer_B1y', 'Malapa', 'AL_333']:
        return 'Nonanthropogenic hominin accumulation'    
    elif index_name == 'Misgrot_Cave':
        return 'Natural Baboon accumulation'    
    elif index_name == 'Unscavenged_human_corpses_WA':
        return 'Unscavenged human corpses'    
    elif index_name in ['Scavenged_human_corpses_WA', 'Scavenged_human_corpses_NM', 'Scavenged_human_corpse_NC']:
        return 'Scavenged human corpses'    
    elif index_name in ['Mapungubwe_leopard_kills', 'Leopard_refuse']:
        return 'Leopard refuse'    
    else:
        return 'Unknown'

# Create the "Type" column
Summary_Dataset_Multivar_Percentage_MAU.insert(0, "Type", Summary_Dataset_Multivar_Percentage_MAU.index.map(assign_type), True)


# Add domaine knowledge 4-categories
def categorize_types(type_value):
    if type_value in ['Primary hominin interment', 'Possible Primary hominin interment', 'Possible hominin deliberate disposal']:
        return 'Burial'
    elif type_value == 'Hominin cannibalism/ secondary interment':
        return 'Cannibalism'
    elif type_value in ['Nonanthropogenic hominin accumulation', 'Natural Baboon accumulation', 'Unscavenged human corpses']:
        return 'Non-human/ non-carnivore intervention'
    elif type_value in ['Leopard refuse', 'Scavenged human corpses']:
        return 'Carnivore intervention'
    else:
        return 'Unknown' 

# Add the 'AccumulationType' column to dataframe
Summary_Dataset_Multivar_Percentage_MAU.insert(1, "AccumulationType", Summary_Dataset_Multivar_Percentage_MAU['Type'].apply(categorize_types), True)


# Save dataset
Summary_Dataset_Multivar_Percentage_MAU.to_csv("Summary_Dataset_Multivar_Percentage_MAU.csv", index_label="Ref")

# Save dataset used in Pnas 83
samples_used = [
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
]

Summary_Dataset_Used_Percentage_MAU = Summary_Dataset_Multivar_Percentage_MAU.loc[samples_used]


# Add Cluster categories from Pnas 83 for multiclass classification
# Define the clusters based on the index names
cluster_A = ['Pottery_Mound_Pueblo_IV','Unscavenged_human_corpses_WA','Kuaua_Pueblo_Pueblo_IV']
cluster_B = ['Mapungubwe_leopard_kills','Skhul_Layer_B','Leopard_refuse']
cluster_C = ['Fontbregoua_H1','El_Mirador_MIR4A','Gran_Dolina_TD6', 'AL_333', 'Fontbregoua_H3','Krapina']
cluster_D = ['Scavenged_human_corpses_WA', 'Sima_de_los_Huesos', 'Dinaledi','Misgrot_Cave']

def assign_clusters(df):
    df = df.copy() 
    df['Cluster_Pnas'] = ''
    df.loc[cluster_A, 'Cluster_Pnas83'] = 'A'
    df.loc[cluster_B, 'Cluster_Pnas83'] = 'B'
    df.loc[cluster_C, 'Cluster_Pnas83'] = 'C'
    df.loc[cluster_D, 'Cluster_Pnas83'] = 'D'
    return df

# Assign the cluster labels to the four dataframes
Summary_Dataset_Used_Percentage_MAU = assign_clusters(Summary_Dataset_Used_Percentage_MAU)


# Save "used" dataset
Summary_Dataset_Used_Percentage_MAU.to_csv("Summary_Dataset_Used_Percentage_MAU.csv", index_label="Ref")
