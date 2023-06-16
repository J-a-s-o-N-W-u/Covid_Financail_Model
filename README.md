# Pandemic Sentiment Index
## Abstract
In this repository, it introduces how to construct a 'Pandemic Sentiment Index'. The reason to construct this model is COVID-19 pandemic has a great impact on the world. 
The main idea is to consturct the idnex which is affected by the below two groups:\
1️⃣ Covid-19 variables (Non-financial)\
2️⃣ Fianacial Variables\
![image](https://github.com/dsChenWu/Pandemic-Sentiment-Index/assets/115355972/034b496e-9671-4213-afea-2da44dbf97d5)

## Variables Choosed
### Covid-19 variables (Non-financial)
1. Case Fatality Rate 
2. Positive Rate
3. Negative to Postive
4. Containment and Health Care Policy
5. Contact Rate or Transmission Rate\
### Financial variables
1. Dividedn Premium (PDND)
2. First day return on IPOs (RIPO)
3. Number of IPOs (NIPO)
4. Closed-end fund discount (CEFD)
5. Equity share in new issues (S)\
#### All these varibales are training variables which means it is not the raw data. If you have interested in how the variables are calculated, you can check my thesis.

## Training Models choosed
1. Binary Method
2. Partial Least Square (PLS)
3. Principal Component Anaysis (PCA)
4. Discriminant Analysis (DA)

## Correlation with VIX Index

## Summary
1. When combining the **Pandemic variables** and **Financial Variables** it can have better prediction to the next t+1 day comparining text-mining method or only using the financial variables
2. It provided a new concept in the future when we would like to know the sentiment during the pandemic or some short shock.
