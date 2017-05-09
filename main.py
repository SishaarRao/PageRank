#!/bin/env python3

import numpy as np
from scipy.sparse.linalg import eigs
import os
import time


def main():    
    # Figure out how many files there are to read, construct matrix with that size
    count = int(os.popen("ls Pages/ | wc -l").read().strip())
    matrix = [x[:] for x in [[0]*count]*count]

    # Parse the text files and populate matrix with data from Parser
    parserOutput = os.popen("./parser.sh").read().split()
    i = 0
    while i < len(parserOutput):
        matrix[int(parserOutput[i])][int(parserOutput[i+1])] = float(parserOutput[i+2])
        i += 3
        
    # Output Data while calculating the Eigenvectors
    print("Constructed Matrix:\n" + str(np.matrix(matrix)) + "\n\n")
    vals, vecs = eigs(np.array(matrix), k=1)
    print("Eigenvalues:\n" + str(np.matrix(vals)) + "\n\n")
    print("Eigenvectors:\n"+ str(np.matrix(vecs)) + "\n\n")

    # Discard Complex variables
    eigenvector = []
    for vec in vecs:
        eigenvector.append(float(vec[0]))

    # Print Search Results
    print("\nSearch Results:")
    for page in np.argsort(eigenvector)[::-1]:
        print("Page " + str(page+1))

start_time = time.time()
main()
print("--- %s seconds ---" % (time.time() - start_time))

