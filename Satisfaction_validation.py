# -*- coding: utf-8 -*-
"""
Created on Wed Jun 21 12:57:25 2023

@author: ubanerje
"""

file1 = 'C:/Users/ubanerje/OneDrive - rush.edu/Desktop/WWP Submissions/Validation_Automation/satisfaction_data_202305.txt'
file2 = 'C:/Users/ubanerje/OneDrive - rush.edu/Desktop/WWP Submissions/Validation_Automation/satisfaction_data_202306.txt'

import pandas as pd
import sqlite3
import pyodbc

# Read the text files into Pandas DataFrames, assuming the first row as the header
df1 = pd.read_csv(file1, sep='|', header=0, keep_default_na=False)
df2 = pd.read_csv(file2, sep='|', header=0, keep_default_na=False)

# Compare the rows and find the new rows
new_rows_df = pd.concat([df1, df2]).drop_duplicates(keep=False)
new_rows_df = new_rows_df.reset_index(drop=True)
new_rows_df['MISSED_APPT_REASON'] = new_rows_df['MISSED_APPT_REASON'].astype(int)
new_rows_df['SURVEY_DATE'] = pd.to_datetime(new_rows_df['SURVEY_DATE'])
print(new_rows_df)

#Obtaining Redcap Data through Rush Maestro API Pull
cnxn_str = ("Driver={SQL Server Native Client 11.0};"
            "Server=maestroprod-db001.rush.edu;"
            "Database=Stage;"
            "Trusted_Connection=yes;")

cnxn = pyodbc.connect(cnxn_str)
with open('C:/Users/ubanerje/OneDrive - rush.edu/Desktop/WWP Submissions/Validation_Automation/satisfaction_data_redcap.sql', 'r') as f:
    query = f.read()
data_sql = pd.read_sql(query, cnxn)
cnxn.close()

new_satisfaction_data_redcap = data_sql[data_sql['SURVEY_ID_NUM'].isin(new_rows_df['SURVEY_ID_NUM'])]
new_satisfaction_data_redcap = new_satisfaction_data_redcap.reset_index(drop=True)
new_satisfaction_data_redcap['SURVEY_DATE'] = pd.to_datetime(new_satisfaction_data_redcap['SURVEY_DATE'])

column_to_preserve = 'SURVEY_ID_NUM'
merged_rows = pd.concat([new_rows_df, new_satisfaction_data_redcap], keys=['validation_file','redcap'])
mismatched_rows = merged_rows.drop_duplicates(keep=False)

mismatched_columns = mismatched_rows.columns[mismatched_rows.nunique() > 1]
mismatched_columns = [column_to_preserve] + list(mismatched_columns)
mismatched_rows = mismatched_rows[mismatched_columns]
mismatched_rows['Source'] = mismatched_rows.index.get_level_values(0)


mismatched_rows.to_excel("C:/Users/ubanerje/OneDrive - rush.edu/Desktop/WWP Submissions/Validation_Automation/mismatched_rows.xlsx", index=False)



