
# coding: utf-8
# ## Pre Processing Goals

# Create variables useful for association rule mining
import pandas as pd

df = pd.read_csv('online_retail.csv')

df['dt_obj'] = pd.to_datetime(df.InvoiceDate)

df['month_sold'] = list(map(lambda x: str(x.month)+'_', df.dt_obj))

df['day'] = list(map(lambda x: str(x.day)+'_', df.dt_obj))

df['day_of_year'] = list(map(lambda x: str(x.timetuple().tm_yday)+'_', df.dt_obj))

df['customer_id'] = list(map(lambda x: str(x)+'_', df.CustomerID))

# arules R function outputs following bins
# > table(discretize(df$Quantity, method='frequency',categories = 5))

# [-80995,    2)              2 [     3,    6) [     6,   13) [    13,80995] 
#         158851          81829          87362         143255          70612 

qty_bins = [-80995, 1.99, 2.01, 6, 13, 80995]

grp_names = ['Qty_Lvl_1','Qty_Lvl_2','Qty_Lvl_3','Qty_Lvl_4','Qty_Lvl_5']

new_qty = pd.cut(df.Quantity, qty_bins, labels=grp_names)

df['quantity_groups'] = new_qty


# arules R function outputs following bins
# > table(discretize(df$UnitPrice, method='frequency',categories = 5))

# [-11062.06,    0.86) [     0.86,    1.66) [     1.66,    2.60) [     2.60,    4.96) [     4.96,38970.00] 
#               113126               119971                93042               123061                92709 

price_bins = [-11062.06, 0.85, 1.65, 2.59, 4.95, 38970.00]

price_grps = ['Price_Lvl_1','Price_Lvl_2','Price_Lvl_3','Price_Lvl_4','Price_Lvl_5']

new_prc = pd.cut(df.UnitPrice, price_bins, labels=price_grps)

df['price_groups'] = new_prc


# Drop the other variables
drop = ['InvoiceNo','InvoiceDate','dt_obj','CustomerID','UnitPrice',
        'dt_obj','Quantity']
for_csv = df.drop(drop,1)

for_csv.to_csv('data_cleaned.csv',index=False)

