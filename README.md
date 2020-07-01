## Logistic-Regression-at-Two-Levels

Logistic regression is a classification algorithm. It is used to predict a binary (or can also multiple) outcome 
based on a set of independent variables. A binary outcome is one where there are only two possible scenarios—either 
the event happens (1) or it does not happen (0). Independent variables are those variables or factors which may 
influence the outcome (or dependent variable). For further information we can also use Logistic Regression for more than
two outcomes that means multiple logistic regression, but in this section we're going to focus on two outcome model only. 

Logistic regression is the correct type of analysis to use when 
you’re working with binary data. You know you’re dealing with binary
data when the output or dependent variable is dichotomous or categorical 
in nature; in other words, if it fits into one of two categories (such as “yes” or “no”, “pass” or “fail”, and so on).

In this repository the data I used is from Kaggle that can be downloaded in this link https://www.kaggle.com/rakeshrau/social-network-ads
This data consist of five column, those are : User ID, Gender, Age, Estimated Salary and Purchased (0 for no, 1 for yes).

For data preparation we change the class of Gender (Male to be 1, Female to be 0) and Purchased column should be converted to Factor class.
By using logistic analysis we could also find the probability of each two outcome, and can adjust it based on our consideration model. 

