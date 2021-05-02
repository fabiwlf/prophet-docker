import numpy as np 
import pandas as pd 
import matplotlib.pyplot as plt
#disable interactive
plt.ioff()
from prophet import Prophet

df = pd.read_csv("data.csv")
df.head()

# Select Date and Price
df = df[["Date","Close"]] 
# Rename the features: These names are required for the model fitting
df = df.rename(columns = {"Date":"ds","Close":"y"}) 
df.head()

# The Prophet class (model)
m = Prophet(daily_seasonality = True) 
 # Fit the model 
m.fit(df)
# We need to specify the number of days in future
fut = m.make_future_dataframe(periods=365) 
prediction = m.predict(fut)

resultplot = m.plot(prediction)
print('Exporting to plot.png')
resultplot.savefig('plot.png')