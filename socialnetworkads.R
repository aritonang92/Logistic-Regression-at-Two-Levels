# Getting data from Computer
social_network <- read.csv(file.choose(), header = TRUE)

# Data Preparation
social_network$Purchased <- as.factor(social_network$Purchased) # makes Purchased column be a Factor class
social_network$Gender <- gsub("Male","1", social_network$Gender) # Subtitute "Male" into 1
social_network$Gender <- gsub("Female","0", social_network$Gender) # Subtitute "Female" into 0
social_network$Gender <- as.factor(social_network$Gender)  # Makes Gender column be a Factor class

str(social_network)

# Two way table of factor variables to see each distribution
xtabs(~Gender + Purchased, data = social_network)

# Partition data - train (80%) & test (20%). Take a random sampling
set.seed(1234)
ind <- sample(2, nrow(social_network), replace = TRUE,
              prob = c(0.8, 0.2))
train <- social_network[ind == 1,]
test <- social_network[ind == 2,]

# Logistic Regression Model with General Linear Model
mymodel <- glm(Purchased ~ Age + EstimatedSalary ,
               data = train, family = "binomial")
summary(mymodel)

# Prediction
p1 <- predict(mymodel, train, type = "response")
head(p1)
head(train)

# Misclassification error of train data
predict1 <- ifelse(p1 > 0.5,1,0) # Makes own prediction stated that If p1 > 0.5 then he/she will purchased
tab1 <- table(Prediction = predict1, Actual = train$Purchased) # This is confusion matrix formed by train data
(1 - sum(diag(tab1)) / sum(tab1))*100 # Misclassification error is 16 %

# Misclassification error of test data
p2 <- predict(mymodel, test, type = "response")
predict2 <- ifelse(p2 > 0.5,1,0) # Makes own prediction stated that If p1 > 0.5 then he/she will purchased
tab2 <- table(Prediction = predict2, Actual = test$Purchased) # This is confusion matrix formed by test data
(1 - sum(diag(tab2)) / sum(tab2))*100 # Misclassification error is 13.33 %

# Goodness of fit
with(mymodel, pchisq(null.deviance - deviance,
                     df.null-df.residual, lower.tail = F)) # The result is 1.547195e-41

