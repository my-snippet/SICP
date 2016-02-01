"""
these libraries may are useful when use fixed_point.
from math import log2
from statistics import mean
"""

tolerance = 0.00001

def fixed_point(f, first_guess):
    def close_enough(v1, v2):
        return (abs(v1-v2)) < tolerance
    
    def try_(guess, count=1):
        print("%sth : %s" % (count, guess))
        return (lambda next: 
                next if close_enough(guess, next) 
                else try_(next, count=count+1))(f(guess))
    
    try_(first_guess)
