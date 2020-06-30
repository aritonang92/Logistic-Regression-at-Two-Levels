# Getting data
social_network <- read.csv(file.choose(), header = TRUE)

# Data Preparation
social_network$Purchased <- as.factor(social_network$Purchased) # makes Purchased column be a Factor class
social_network$Gender <- gsub("Male","1", social_network$Gender) # Subtitute "Male" into 1
social_network$Gender <- gsub("Female","0", social_network$Gender) # Subtitute "Female" into 0
social_network$Gender <- as.factor(social_network$Gender)  # Makes Gender column be a Factor class

str(social_network)

# Two way table of factor variables
xtabs(~Gender + Purchased, data = social_network)

# Partition data - train (80%) & test (20%)
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

# Misclassification error - train data
predict1 <- ifelse(p1 > 0.5,1,0) # Makes own prediction stated that If p1 > 0.5 then he/she will purchased
tab1 <- table(Prediction = predict1, Actual = train$Purchased) # This is confusion matrix
1 - sum(diag(tab1)) / sum(tab1) # Misclassification error

# Misclassification error - test data
p2 <- predict(mymodel, test, type = "response")
predict2 <- ifelse(p2 > 0.5,1,0) # Makes own prediction stated that If p1 > 0.5 then he/she will purchased
tab2 <- table(Prediction = predict2, Actual = test$Purchased) # This is confusion matrix
1 - sum(diag(tab2)) / sum(tab2) # Misclassification error

# Goodness of fit
with(mymodel, pchisq(null.deviance - deviance,
                     df.null-df.residual, lower.tail = F)) # Tye result is 1.547195e-41
