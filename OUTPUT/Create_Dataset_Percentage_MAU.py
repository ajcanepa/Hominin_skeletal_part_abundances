import pandas as pd

# Read the entire Excel file
all_sheets = pd.read_excel("pnas.1718678115.sd01.xlsx", sheet_name=None)

# Get the sheet names
sheet_names = list(all_sheets.keys())

# Dynamically create dataframes for each sheet
for sheet_name in sheet_names:
    globals()[sheet_name.replace(" ", "_").replace("-", "_")] = all_sheets[sheet_name]

# 1) Prepare the columns based on Dinaledi["Unnamed: 0"]
columns = Dinaledi["Unnamed: 0"].iloc[1:27].tolist()

# 2) Create an empty dataframe with the desired structure
Summary_Dataset_Multivar_percentage_MAU = pd.DataFrame(index=dataframe_names, columns=columns)

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
    Summary_Dataset_Multivar_percentage_MAU.iloc[dataframe_names.index(df_name), :len(values)] = values


Summary_Dataset_Multivar_Percentage_MAU.to_csv("Summary_Dataset_Multivar_Percentage_MAU.csv", index=True)
