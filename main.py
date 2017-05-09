#!/bin/env python3

import numpy as np
from scipy.sparse.linalg import eigs
import os
import time


def main():    
    count = int(os.popen("ls Pages/ | wc -l").read().strip())
    matrix = [x[:] for x in [[0]*count]*count]
    parserOutput = os.popen("./parser.sh").read().split()
    i = 0
    while i < len(parserOutput):
        matrix[int(parserOutput[i])][int(parserOutput[i+1])] = float(parserOutput[i+2])
        i += 3
    print("Constructed Matrix:\n" + str(np.matrix(matrix)) + "\n\n")
    vals, vecs = eigs(np.array(matrix), k=1)
    print("Eigenvalues:\n" + str(np.matrix(vals)) + "\n\n")
    print("Eigenvectors:\n"+ str(np.matrix(vecs)) + "\n\n")

main()


