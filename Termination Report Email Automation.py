# -*- coding: utf-8 -*-
"""
Created on Wed Apr  5 16:55:05 2023

@author: ubanerje
"""

import pandas as pd
import win32com.client as win32
from datetime import datetime

# Read the Excel file
df = pd.read_excel("C:/Users/ubanerje/OneDrive - rush.edu/Desktop/Ad Hoc Reporting RHP/RHP Termination Report Validation Automation Test File.xlsx")

# Get a list of unique email addresses
emails = df['Provider_Email_Placeholder'].unique().tolist()

# Loop through each email address and send the corresponding rows in an email
for email in emails:
    # Filter the rows for this email address
    rows = df.loc[df['Provider_Email_Placeholder'] == email]
    
    # Convert the rows to an HTML table
    html_table = rows.to_html(index=False)
    
    # Set up the Outlook application and create a new email
    outlook = win32.Dispatch('Outlook.Application')
    mail = outlook.CreateItem(0)
    mail.To = email
    mail.Subject = 'Data from Termination file (Automation Test Email Please Ignore)'
    now = datetime.now()
    date_string=now.strftime('%B %d, %Y')
    date = f"{date_string}"
    signature=f"Sincerely,<br>RHP Research Team"
    mail.HTMLBody = f"Hi,<br><br>Please find the termination data for {date} below:<br><br>{html_table}<br><br>Please go through the list and make changes as you see fit. Please note that some patients might still be under active treatment and should not be terminated in the system currently<br><br>{signature}"
    
    # Send the email
    mail.Send()