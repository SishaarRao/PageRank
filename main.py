#!/bin/env python3

import numpy as np
import os

def main():
    count = int(os.popen("ls Pages/ | wc -l").read().strip())
    matrix = [[0]*count]*count
    print(matrix)
    
    

main()
