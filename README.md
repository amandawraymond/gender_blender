##Overview
GenderBlender is a web application that is built on Naive Bayes sex classification algorithm and is used to predict the gender of "contestants" based on their height and weight. The application allows users to submit sample data to train the algorithm. My application also submits training data upon the "contestant" confirming or denying the GenderBlender's gender prediction.
MVC paradigm of fat model/skinny controller was followed with the inclusion of a Prediction Service to handle calculations. [Services in Rails article](https://blog.engineyard.com/2014/keeping-your-rails-controllers-dry-with-services)

Check it out at [GenderBlender](https://genderblender.herokuapp.com) and [Github](https://github.com/amandawraymond/gender_blender)

##Technologies Used
* Ruby 2.1.2
* Rails 4.1.8
* Rspec 3.1.0
* Bootstrap
* forked descriptive_statistics gem


##Assumptions
* The contestants and trainer data represent full-grown adults over 18
* Can be only male or female
* Equal (0.5) probability for being female to male 
* Weight is provided in pounds
* Height is provided in inches
* name included for contestant may help the old carnival genderblender if included in equation in future


##Improvements
* Unit testing in Rspec for calculations/ improved TDD practices
* Wrap gender predictin/naive bayes calculations in a gem for community re-use
* Front-end design and styling


##Assignment

### Summary
The U.S. Census Bureau had a hard-drive failure and lost a portion of their data about the gender of survey respondents. To help them guess at the gender of each respondent, we're going to use a Naive Bayes Classifier.

### Background
Before you begin, read over [the Wikipedia article on Naive Bayes classifiers.](http://en.wikipedia.org/wiki/Naive_Bayes_classifier)

Essentially, you need to implement the "Sex classification" algorithm as a web app. The most relevant parts of the article are:

**Parameter estimation**

* You'll need to implement the function given here
* This method depends on having the mean and variance of a data set, so you'll need to compute those values as well

**Constructing a classifier from the probability model**

* This boils down to "choose the classification that returns the biggest number"

### Requirements
The app must allow users to provide training data to train the classifier. Users should also be able to enter a weight and height and see the classifier's gender prediction for those values (separate from the training data interface).

**Users must be able to perform the following actions in order to add training data:**

* Add a new person
* Edit a person
* Delete a person
* List all people

**Each person should have the following attributes:**

* Gender ,* Height, * Weight

Gender must be either "male" or "female". To keep things simple, you can use integers for height and weight. You can ignore the "foot size" attribute from the Wikipedia example.
