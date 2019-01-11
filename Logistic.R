---

date: "11/4/2018"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r}
sysad.df<- read.csv('SystemAdministrators.csv')
summary(sysad.df)
library(caret)
library(ggplot2)
library(caret)
```

#Q1 Using ggplot2 package, create a scatter plot of Experience vs. Training using color or symbol to distinguish programmers who completed the task from those who did not complete it.

```{r}
ggplot(sysad.df, aes(Experience,Training, color= factor(Completed.task))) + geom_point(shape=2,alpha = 0.6)+ggtitle("Scatter Plot of Experience vs.Training distinguishing programmers")
```

#Q1 Which predictor(s) appear(s) potentially useful for classifying task completion?

##Experience is potentially useful for classifying task completion.

## When the unit of experience is increasing there are more Completed.Task(Yes) showing that more tasks are completed when the unit of experience increases.

##There is no clear interpretation with training. As the unit of training increases we dont clearly see more completed task.It has both Yes and No which is not helping us to interpret if more training leads to increased task completition.

##When we analyse we come to know that experience is statistically significant whereas training is not.

##There is a positive correlation between experience and training. 

#Q2 Run a logistic regression model with both predictors using the entire dataset as training data. Generate a confusion matrix and answer the following: among those who completed the task, what is the percentage of programmers incorrectly classified as failing to complete the task?
```{r}
logit.reg <- glm(Completed.task ~ ., data = sysad.df, family = "binomial") 
summary(logit.reg)
exp(coef(logit.reg))
```
### propensities are predicted below :
```{r}
logit.reg.pred <- predict(logit.reg, sysad.df[, -3], type = "response")
```
#confusion matrix is generated
```{r}
table(sysad.df$Completed.task, logit.reg.pred > 0.5)
```
#Incorrect Classification Calculation
```{r}
prop.table(table(sysad.df$Completed.task, logit.reg.pred > 0.5))
```
###Incorrect Classification : (ACTUAL YES WRONGLY PREDICTED AS NO / ACTUAL YES) * 100
##= (0.06666667/.2)*100 or (5/15)*100 = 33.33% (answer)

#Q3 How much experience must be accumulated by a programmer with 6 training credits before his or her estimated probability of completing the task exceeds 0.6? (Hint: in a logistic regression you can write the left hand-side of the regression equation as the log of odds).
```{r}
#Given
p=0.6
Training <- 6
#Formula for odds= p/(1-p)
#Formula used - log(p/(1-p))= β0 + β1*x1 + … + βk*xk

LHS<- log(p/(1-p))
#To put values in RHS we need to do the following calculations
coef(logit.reg)

#Intercept β0<-(coef(logit.reg)[1])
#β1<-(coef(logit.reg)[2])
#β2<-(coef(logit.reg)[3])
β0<--10.9813
β1<-1.1269
β2<-.1805

#LHS = β0 + β1*Experience + β2*Training
#Value for Training is given - 6
Valueforexperience<-((LHS-β0-(β2*6))/β1)
Valueforexperience
```









