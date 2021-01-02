import numpy as np

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



def clip(original_weight):
    row, column = original_weight.shape
    clip_weight = np.zeros([row, column])
    #clip_weight = np.zeros([row])
    for i in range(row):
        #clip_weight[i] = max(-1, min( (original_weight[i,:]), 1)) 
        for j in range(column):
            clip_weight[i][j] = max(-1, min( (original_weight[i][j]), 1))
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

def Sparsity(Ternary_weight):
    row, column = Ternary_weight.shape
    Sparse = 0
    for i in range(row):
        for j in range(column):
            if (Ternary_weight[i,j] == 0):
                Sparse +=1
    Total_weights = (row * column)
    Sparsity_percent = (Sparse / Total_weights)*100
    return(Sparse, Sparsity_percent)

    
    
def Sparse_cal(original_weight):
    clip_output = clip(original_weight)
    Ternary_weight = ternary_weight(clip_output)
    Sparse, Sparsity_percent = Sparsity(Ternary_weight)
    return(Ternary_weight, Sparse, Sparsity_percent)


def optimized_Sparse_cal(original_weight):
    clip_output = Weight_func(original_weight)
    Ternary_weight = ternary_weight(clip_output)
    Sparse, Sparsity_percent = Sparsity(Ternary_weight)
    return(Ternary_weight, Sparse, Sparsity_percent)





original_weight = np.random.randn( 5, 5)
print('Original Weights = {}'.format(original_weight))
print()
print()
out0, Sparse0, Sparsity_percent0 = Sparse_cal(original_weight)
print('Ternary Matrix via Existing Method = {}'.format(out0))
print()
print('Sparse value of Existing Method = {}, Percentage of Sparsity = {}'.format(Sparse0, Sparsity_percent0))
print()
print()
out1, Sparse1, Sparsity_percent1 = optimized_Sparse_cal(original_weight)
print('Ternary Matrix via Proposed Method = {}'.format(out1))
print()
print('Sparse value of Proposed Method = {}, Percentage of Sparsity = {}'.format(Sparse1, Sparsity_percent1))
