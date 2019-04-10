#lib/functs.py
import numpy as np
import matplotlib.pyplot as plt


def crap(turd):
    return f'fart{turd}'

def svdcmp(x):
    return f'{np.linalg.svd(np.array(x))}'
    #return np.linalg.svd(np.array(x))

def fluffer(x):
    plt.plot(x)
    plt.ylabel('some numbers')
    plt.show()


