# college-assigments-NeuralNetworks-BalanceScale
Neural Network in R - Balance Scale Data Set

In this assignment was performed a training process using a MLP (MultiLayer Perceptron) with three different learning functions. The three learning functions used were Std_Backpropagation (Backpropagation), Rprop (Resilient propagation) and BackpropChunck. My main goal here was to compare the accuracy of those learning functions to classify the balance scale weight&distance database. This data set was taken  from UCI Machine Learning Repository and it was generated to model psychological experimental results. Each example is classified as having the balance scale tip to the right, tip to the left, or be balanced. The attributes are the left weight, the left distance, the right weight, and the right distance. The correct way to find the class is the greater of (left-distance * left-weight) and (right-distance * right-weight). If they are equal, it is balanced.

Attribute Information:

1. Class Name: 3 (L, B, R) 
2. Left-Weight: 5 (1, 2, 3, 4, 5) 
3. Left-Distance: 5 (1, 2, 3, 4, 5) 
4. Right-Weight: 5 (1, 2, 3, 4, 5) 
5. Right-Distance: 5 (1, 2, 3, 4, 5)

 For more information about each of those learning functions click here: (http://www.ra.cs.uni-tuebingen.de/SNNS/UserManual/node52.html). 
