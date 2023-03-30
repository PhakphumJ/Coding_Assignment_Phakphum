#!/usr/bin/env python
# coding: utf-8

# # Using python to do silly stuff

# ## Import CSV file

# In[1]:


pwd


# In[2]:


import pandas as pd
df = pd.read_csv(r'data\hotels-vienna.csv')


# In[3]:


df


# ## Outcome to demonstrate: 

# ### Aggregate data (average rating in each district). 

# In[4]:


df.groupby('neighbourhood')[['ratingta', 'rating']].agg("mean")


# ### Define and use functions (create dummy variables base on value of a column). ( #13)

# In[5]:


def walkable_tocenter(d):
    if d['distance'] <= 1:
        return 'yes'
    else:
        return 'no'


# In[6]:


df['walkable_tocenter'] = df.apply(walkable_tocenter, axis = 1)


# In[7]:


def high_rating(d):
    if d['rating'] > 4:
        return 'yes'
    else:
        return 'no'


# In[8]:


df['high_rating'] = df.apply(high_rating, axis = 1)


# In[9]:


df


# ### Create a list of price of hotels in USD using for loop. Then merge it with the original dataframe. (Outcome #2, #3)

# In[10]:


usd_price = []

for i in range(len(df)):
    price_in_usd = df['price'].iloc[i] * 1.05
    usd_price.append(price_in_usd)
    
usd_price


# In[11]:


usd_price_df = pd.DataFrame(usd_price, columns =['price_in_usd'])
new_df = pd.concat([df, usd_price_df], axis=1)
new_df

