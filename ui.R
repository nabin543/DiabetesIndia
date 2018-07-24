library(shiny)
shinyUI(fluidPage(
  titlePanel("Diabetes Probability Prediction"),
  h4('This webapp enables the user to predict the  probability of diabetes in future with 78.3% acuuracy'),
 # h4('The prediction is based on Travel Class, Gender, Age Group, Family and Embarked variables'),
  h4('Based on the probability of survival calculated by Prediction Algorithm the app decides whether person will be diabetic or not.'),
  
  sidebarLayout(
    sidebarPanel(
      list(tags$head(tags$style("body {background-color: #ADD8E6; }"))),
      
      #sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100),
      numericInput("Pregnancies","Pregnancies", value = 0, min = 0),
      numericInput("Glucose","Glucose : Plasma glucose concentration of 2 hours in an oral glucose tolerance test", value = 0,min = 0),
      numericInput("BloodPressure","BloodPressure : Diastolic blood pressure (mm Hg)", value = 0,min = 0),
      numericInput("SkinThickness","SkinThickness : Triceps skin fold thickness (mm)", value = 0,min = 0),
      numericInput("Insulin","Insulin : 2-Hour serum insulin (mu U/ml)", value = 0,min = 0),
      numericInput("BMI","BMI : Body mass index (weight in kg/(height in m)^2)", value = 0,min = 0),
      numericInput("DiabetesPedigreeFunction","DiabetesPedigreeFunction", value = 2,min = 0),
      numericInput("Age","Age", value = 0,min = 0),
      submitButton('Predict' )
  
    ),
    mainPanel(
      list(tags$head(tags$style("body {background-color: #ADD8E6; }"))),
      
      h3("Results of Prediction"),
              h4("Based on the data enetered the probability of person suffering is:"),
      verbatimTextOutput("test2"),
      h4("The estimated result is:"),
      verbatimTextOutput("test")
      )
      
  )
))
