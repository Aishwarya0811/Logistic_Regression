

Ledoitte, a management consulting firm, is studying the roles played by experience and
training in a system administrator’s ability to complete a set of tasks in a specified
amount of time. 
Ledoitte is interested in figuring out which administrators can
complete given tasks within a specified time and those who are not.

Data are collected on the performance of 75 randomly selected administrators. 

They are stored in the file SystemAdministrators.csv.

The variable Experience measures months of full-time system administrator experience,
while Training measures the number of relevant training credits. 

The outcome variable Completed is either Yes or No, according to whether or not the administrator completed
the tasks.

#Explanation :-

confusion matrix
Accuracy <- ((531+231)/920)*100 
Sensitivity<- (231/(231+125))*100 #sensitivity <- (Actual spam identified as spam/ Actual spam)*100
What can we learn from this matrix?
There are two possible predicted classes: "Non Spam or o" and "Spam or 1". If we were predicting spam emails, for example, "1" would mean they are spam emails, and "0" would mean they are non-spam emails.
The classifier made a total of 920 predictions .
Out of those 920 , the classifier predicted "Spam" 356 times, and "Non Spam" 564 times.
In reality, 264 are spam emails , and 656 non spam . The model is correctly classifying 231 email messages as SPAM out of actual 356 spam email messages(64.88%)

#DECILE LIFT CHARTS
 The top decile shows that our Model is  2.3 times approx better in identifying important class(Spam in our case) than naive or benchamrk or average when 10% is used.As  decile chart is telling us that , model is slightly more than twice likely to identify the class of interest as compared to average would do.
Second decile which is detecting spam 2.5 times is more than first decile indicating that  model could have performed better. Further on descending order indicate that our model is doing a great job. 

LIFT CHART 
 The model is accuarte in identifying approx 175 as Spam out of 200 email maessages whereas naive selection would have identified only 75 as Spam.
 Greater the area between lift curve and baseline, better the model indicating most gain 
Lift chart shows improvement of the model i.e,how good is our model in predicting the Class of interest in Type.Spams .
lift chart simply shows "how does my model compare to random guessing given X number of Email Messages".



