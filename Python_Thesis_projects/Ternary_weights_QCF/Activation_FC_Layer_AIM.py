import timeit
start = timeit.default_timer()

import numpy as np

def activation_indexing(Activation):
    B=[]
    Ac_element=[]
    count=0
    for i in range(N):
        if(Activation[i]==0):
            B.append(count)
        else:
            Ac_element.append(Activation[i])
            Activation[i]=1
            count+=1
            B.append(count)
    #print(Activation)
    #print(Ac_element)
    #print(B)
    return(Activation,Ac_element,B)

def weight_indexing(Weight, Activation):
    #print(Weight)
    Weight_index = np.absolute(Weight)
    #print(Weight_index)
    effective_index =Activation & Weight_index
    index =[]
    for i in range(N):
        if (effective_index[i] and Weight[i]==(-1)):
            index.append(i)
        
    return(effective_index, index)

def final_result(Ac_element, B, effective_index, index):
    output=0
    for i in range(N):
        if (effective_index[i]):
            if(i in index):
                #x = B[i]-1
                output -= Ac_element[B[i]-1]
            else:
                #x = B[i]-1
                output += Ac_element[B[i]-1]
    return(output)                      

def Output_neuron(Activation, Weight):
    Activation,Ac_element,B = activation_indexing(Activation)
    effective_index, index = weight_indexing(Weight, Activation)
    output = final_result(Ac_element, B, effective_index, index)
    #print(output)
    return(output)

def clip(original_weight):
    row, column = original_weight.shape
    clip_weight = np.zeros([row, column])
    #clip_weight = np.zeros([row])
    for i in range(row):
        #clip_weight[i] = max(-1, min( (original_weight[i,:]), 1)) 
        for j in range(column):
            clip_weight[i][j] = max(-1, min( (original_weight[i][j]), 1))
    return(clip_weight)


def Weight_func(original_weight):
    row, column = original_weight.shape
    clip_weight = np.zeros([row, column])
    for i in range(row):
        for j in range(column):
            if( original_weight[i][j]>=0 ):
                clip_weight[i][j] = min((original_weight[i][j])**2, 1)
            else:
                clip_weight[i][j] = max(-(original_weight[i][j])**2, -1)
    return(clip_weight)




def ternary_weight(clip_output):
    row, column = clip_output.shape
    #Ternary_weight = np.empty((row, column))
    #Ternary_weight = [0 for x in range(column)]
    # create 5 copies of zeros2
    #Ternary_weight = [Ternary_weight[:] for x in range(row)] 
    #Ternary_weight = int(np.zeros([row, column]))
    Ternary_weight = []
    for i in range(row):
        for j in range(column):
            if (clip_output[i,j] >= 0):
                P_one = clip_output[i,j]
                P_zero = 1-clip_output[i,j]
                if (P_one >= P_zero):
                    #Ternary_weight[i,j] = 1
                    Ternary_weight.append(1)
                else:
                    #Ternary_weight[i,j] = 0
                    Ternary_weight.append(0)
            else:
                P_negative_one = - clip_output[i,j]
                P_zero = 1 + clip_output[i,j]
                if (P_negative_one >= P_zero):
                    #Ternary_weight[i,j] = -1
                    Ternary_weight.append(-1)
                else:
                    #Ternary_weight[i,j] = 0
                    Ternary_weight.append(0)
    Ternary_weight = np.reshape(Ternary_weight, (row, column))
                    
    return(Ternary_weight)                

def weight_conversion(original_weight):
    clip_output = clip(original_weight)
    Ternary_weight = ternary_weight(clip_output)
    return(Ternary_weight)


def efficient_weight_conversion(original_weight):
    clip_output = Weight_func(original_weight)
    Ternary_weight = ternary_weight(clip_output)
    return(Ternary_weight)



def fullyconnected_layer_AIM(Activation, original_weight):
    row, column = original_weight.shape
    Activation,Ac_element,B = activation_indexing(Activation)
    Ternary_weight = efficient_weight_conversion(original_weight)
    print("Ternary_weight = {}\n".format(Ternary_weight))
    Output_neuron_array  = []
    for i in range(row):
        Ternary_set = Ternary_weight[i,:]
        effective_index, index = weight_indexing(Ternary_set, Activation)
        output_element = final_result(Ac_element, B, effective_index, index)
        Output_neuron_array.append(output_element)
    Output_neuron_array = np.reshape(Output_neuron_array, (row, 1))
    return(Output_neuron_array)

def Relu_Act(Output_neuron_array):
    row, column = Output_neuron_array.shape
    for i in range(row):
        if (Output_neuron_array[i,:] >= 0):
            pass
        else:
            Output_neuron_array[i,:]=0
    return(Output_neuron_array)

def sigmoid(Output_neuron_array):
    sigmoid_Act = 1/(1+np.exp(-Output_neuron_array))
    return sigmoid_Act
    
def softmax(Output_neuron_array):
    """Calculates the softmax for each row of the input x.
​
    Your code should work for a row vector and also for matrices of shape (n, m).
​
    Argument:
    x -- A numpy matrix of shape (n,m)
​
    Returns:
    s -- A numpy matrix equal to the softmax of x, of shape (n,m)
    """
    Output_neuron_array = Output_neuron_array/100
    # Apply exp() element-wise to x. Use np.exp(...).
    x_exp = np.exp(Output_neuron_array)
    # Create a vector x_sum that sums each row of x_exp. Use np.sum(..., axis = 1, keepdims = True).
    x_sum = np.sum(x_exp, axis = 0, keepdims = True)
    # Compute softmax(x) by dividing x_exp by x_sum. It should automatically use numpy broadcasting.
    softmax_output = x_exp/x_sum
    return (softmax_output)
    

#A=[int(i) for i in input().split()]
Activation = np.array([0, 52, -41, 0, -12, 115, 65, 0, 90, 0, 89, 22, -72, 0, 54])
N = len(Activation)
print("Activation = {}\n".format(Activation))
#Weight = np.array([1, -1, 0, 0, -1, 1, 0, -1, -1])
original_weight = np.random.randn( 10, 15)
print("Original weight shape = {}\n".format(original_weight.shape))
print('Fully Connected Layer with Activation functions by AIM Algorithm')
print()
Output_neuron_array = fullyconnected_layer_AIM(Activation, original_weight)
print("Output_neuron_array shape = {}\n".format(Output_neuron_array.shape))
print("Output_neuron_array = {}\n".format(Output_neuron_array))
Output_Relu_activation = Relu_Act(Output_neuron_array)
print("Output_Relu_activation = {}\n".format(Output_Relu_activation))
Output_sigmoid_activation = sigmoid(Output_neuron_array)
print("Output_Sigmoid_activation = {}\n".format(Output_sigmoid_activation))
Output_softmax_activation = softmax(Output_neuron_array)
print("Output_Softmax_activation = {}\n".format(Output_softmax_activation))
#output = Output_neuron(Activation, Weight)

stop = timeit.default_timer()

print('Time: ', (stop - start)*1000,'ms')
