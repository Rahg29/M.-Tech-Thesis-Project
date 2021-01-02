import numpy as np
import array
def Activation_indexing(Activation):
    Act_acc =[]
    Ac_element =[]
    count=0
    for i in range(N):
        if(Activation[i]==0):
            Act_acc.append(count)
        else:
            Ac_element.append(Activation[i])
            Activation[i]=1
            count+=1
            Act_acc.append(count)
    #print(Activation)
    #print(Ac_element)
    #print(B)
    return(Activation,Ac_element,Act_acc)

def Weight_indexing(Weight):
    Wg_acc =[]
    Wg_element =[]
    count=0
    for i in range(N):
        if(Weight[i]==0):
            Wg_acc.append(count)
        else:
            Wg_element.append(Weight[i])
            Weight[i]=1
            count+=1
            Wg_acc.append(count)
    #print(Activation)
    #print(Ac_element)
    #print(B)
    return(Weight,Wg_element,Wg_acc)

def And_operation(Activation, Weight):
    Effective_index = Activation & Weight
    return(Effective_index)

def Effective_emt(Effective_index, Ac_element, Act_acc, Wg_element, Wg_acc):
    Ef_Ac_emt = []
    Ef_Wg_emt = []
    for i in range(N):
        if (Effective_index[i]):
            Ef_Ac_emt.append(Ac_element[Act_acc[i]-1])
            Ef_Wg_emt.append(Wg_element[Wg_acc[i]-1])
        
    return(Ef_Ac_emt, Ef_Wg_emt)

def Effective_mul(Ef_Ac_emt, Ef_Wg_emt):
    M = len(Ef_Ac_emt)
    output  =0
    for i in range(M):
        output += Ef_Ac_emt[i] * Ef_Wg_emt[i]
    return(output)        


def DIM(Activation, Weight):
    Activation,Ac_element,Act_acc = Activation_indexing(Activation)
    Weight,Wg_element,Wg_acc = Weight_indexing(Weight)
    Effective_index = And_operation(Activation, Weight)
    Ef_Ac_emt, Ef_Wg_emt = Effective_emt(Effective_index, Ac_element, Act_acc, Wg_element, Wg_acc)
    output = Effective_mul(Ef_Ac_emt, Ef_Wg_emt)
    return(output)

#A=[int(i) for i in input().split()]
Activation = np.array([0, 52, -41, 0, -12, 115, 65, 0, 90])
N = len(Activation)
print(Activation)
print()
Weight = np.array([1, -1, 0, 0, -1, 1, 0, -1, -1])


output = DIM(Activation, Weight)
print('Output of DIM = ',output)
