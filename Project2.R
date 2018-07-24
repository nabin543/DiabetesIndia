hello <- read.csv("good.csv", header = TRUE)

hello$Pregnancies <- (hello$Pregnancies - min(hello$Pregnancies))/(max(hello$Pregnancies)-min(hello$Pregnancies))
hello$Glucose <- (hello$Glucose - min(hello$Glucose))/(max(hello$Glucose)-min(hello$Glucose))
hello$BloodPressure <- (hello$BloodPressure - min(hello$BloodPressure))/(max(hello$BloodPressure)-min(hello$BloodPressure))
hello$SkinThickness <- (hello$SkinThickness - min(hello$SkinThickness))/(max(hello$SkinThickness)-min(hello$SkinThickness))
hello$Insulin <- (hello$Insulin - min(hello$Insulin))/(max(hello$Insulin)-min(hello$Insulin))
hello$BMI <- (hello$BMI - min(hello$BMI))/(max(hello$BMI)-min(hello$BMI))
hello$DiabetesPedigreeFunction <- (hello$DiabetesPedigreeFunction - min(hello$DiabetesPedigreeFunction))/(max(hello$DiabetesPedigreeFunction)-min(hello$DiabetesPedigreeFunction))
hello$Age <- (hello$Age - min(hello$Age))/(max(hello$Age)-min(hello$Age))

hello <- hello[,-1]


ind <- sample( 2, nrow(hello), replace = TRUE, prob = c(0.3, 0.7))
testing<- hello[ind == 1,]
training <- hello[ind == 2,]

myFormula <-Outcome ~ Pregnancies + 
  Glucose + BloodPressure + SkinThickness +
  Insulin + BMI + DiabetesPedigreeFunction +
  Age

library(neuralnet)
set.seed(122334)

#dammi <- neuralnet(myFormula, training, hidden = 7, err.fct = "ce",lifesign = "full" ,linear.output = FALSE, rep = 10)
#hid_7 <- dammi
#at rep = 10

#hid_8 <- neuralnet(myFormula, training, hidden = 8, err.fct = "ce",lifesign = "full" ,linear.output = FALSE, rep = 10)

hid_9 <- neuralnet(myFormula, training, hidden = 9, err.fct = "ce",lifesign = "full" ,linear.output = FALSE, rep = 20)

res <- compute(hid_9, testing[,-9],rep=9)
#res2<- compute(hid_8, hello[,-9],rep=1)
#hid_6 <- neuralnet(myFormula, training, hidden = 6, err.fct = "ce",lifesign = "full" ,linear.output = FALSE, rep = 10)
#res <- compute(hid_6, testing[,-9],rep=1)

 


pred <- res$net.result
p1 <- ifelse(pred>0.5,1,0)


tab <- table(p1,testing$Outcome)
tab
1-sum(diag(tab))/sum(tab)



library
library(ggplot2)
library()
confusionMatrix(tab)