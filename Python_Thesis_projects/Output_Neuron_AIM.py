import numpy as np
import array
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
    print(Weight)
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
    print(output)
    return(output)

#A=[int(i) for i in input().split()]
Activation = np.array([0, 52, -41, 0, -12, 115, 65, 0, 90])
N = len(Activation)
print(Activation)
Weight = np.array([1, -1, 0, 0, -1, 1, 0, -1, -1])



output = Output_neuron(Activation, Weight)
