
# Python ver. implementation sketch of Stream in SICP
def f(n):
    yield (n , f(n+1))
