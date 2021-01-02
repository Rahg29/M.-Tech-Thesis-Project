import numpy as np
import array

def CM(Activation, Weight):
    N = len(Activation)
    out = 0
    for i in range(N):
        out += Activation[i] * Weight[i]
    return(out)

#A=[int(i) for i in input().split()]
Activation = np.array([0, 52, -41, 0, -12, 115, 65, 0, 90])
print(Activation)
print()
Weight = np.array([1, -1, 0, 0, -1, 1, 0, -1, -1])

output = CM(Activation, Weight)
print('Output of CM = ',output)
