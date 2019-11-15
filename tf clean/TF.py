import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)

import seaborn as sns
import matplotlib.pyplot as plt
import re
import chart_studio.plotly as py
import plotly.graph_objs as go
from plotly.offline import init_notebook_mode, iplot
init_notebook_mode(connected=True)
import os

# My modules
from functions.preprocessing import *
from functions.graphips import *
from functions.dataset import *
from functions.datatreatment import *
from functions.algorithms import *

if __name__ == "__main__":
    #Read dataset from file
    data = read_dataset("./resources/all_matches.csv",pd)

    #Select data we need
    data = select_data(data)

    # Pre-procesamiento
    ## Drop na values
    drop_na_values(data)
    ## Normalizate columns
    indices = [1,6,7,8,9]
    data = normalize_columns(indices,data)

    #Tratamiendo de datos

    ## Promedio ponderado
    indices_wa = [6,7,8,9]
    pesos = [1,2,3,3]
    dfWA = weightedAverage(data, pesos, indices_wa)
    #print_details(dfWA)

    ## Maximin
    indices_maximin = [7,8,9]
    dfMM = maximin(data, indices_maximin)
    #print_details(dfMM)
    
    ## Maximax
    indices_minimax = [7,8,9]
    dfMinmax = minimax(data, indices_minimax)
    #print_details(dfMinmax)

    ## Leximin
    indices_leximin = [7,8,9]
    dfLexmin = leximin(data, indices_leximin)
    #print_details(dfLexmin)

    ## Leximax
    indices_leximax = [7,8,9]
    dfLeximax = leximax(data, indices_leximax)
    #print_details(dfLeximax)

    ##Skylines
    indices_skylines = [7,8,9]
    dfSky = skylines(data, indices_skylines)
    #print_details(dfSky)

    #Skylines graphips
    # radarAllPlot(dfWA.head(4),indices_skylines)
    # radarAllPlot(dfMM.head(4),indices_skylines)
    # radarAllPlot(dfMinmax.head(4),indices_skylines)
    # radarAllPlot(dfLexmin.head(4),indices_skylines)
    # radarAllPlot(dfLeximax.head(4),indices_skylines)
    # radarAllPlot(dfSky.head(4),indices_skylines)

    # Agrupamiento de datos K-means 
    dataP = data[['prize_money', 'num_sets', 'sets_won', 'games_won', 'games_against']]
    dataP.head()
    X = np.array(dataP)
    kmeans(X, data, 5, 3)

    # Reduccion de dimensionalidad con PCA
    pca = PCA().fit(X)
    plt.plot(np.cumsum(pca.explained_variance_ratio_))
    plt.xlabel('numero de componentes')
    plt.ylabel('varianza explicada acumulada')

    

