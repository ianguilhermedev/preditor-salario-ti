import pandas as pd
from pandas import CategoricalDtype

def prepare_data(df):
    df = df.copy()
    for column in df.select_dtypes(include=["object", "category"]).columns:
        df[column] = df[column].fillna('Nao Informado')

    return df


def prepare_data_classifier(df):
    df = df.copy()
    for column in df.select_dtypes(include=["object", "category"]).columns:
        df[column] = df[column].fillna('Nao Informado')

    categorias = CategoricalDtype(categories=[
    'até R$ 3.000/mês',           
    'de 3.001/mês a R$ 6.000/mês',      
    'de R$ 6.001/mês a R$ 8.000/mês',      
    'de R$ 8.001/mês a R$ 12.000/mês',     
    'de R$ 12.001/mês a R$ 20.000/mês',    
    'acima de R$ 20.000/mês'      
], ordered=True)

    df['categorias_target'] = df['categorias_target'].astype(categorias)
    
    return df