import numpy as np
#!/usr/bin/python

def send_force_values(jointVarsFilt):
    jointVarsFilt = [x * 10000 for x in jointVarsFilt]
    
    return jointVarsFilt

