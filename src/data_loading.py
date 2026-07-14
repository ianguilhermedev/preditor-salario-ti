import pandas as pd

def load_data(data_path=None):
    if data_path == None:
        data_path = '../data/raw/state_of_data_survey_2024.csv'
    return pd.read_csv(data_path)