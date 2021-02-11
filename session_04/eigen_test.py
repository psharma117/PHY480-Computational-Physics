import numpy as np

def construct_matrix(N):
    H = np.zeros((N,N))
    for i in range(N):
        for j in range(N):
            H[i,j] = 1/(i + j + 1)

    return H

print(np.linalg.eigvalsh(construct_matrix(4)))

