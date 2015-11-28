# http://alexbowe.com/streams/
# lazy using lambda
# Only sieve function modified


null_stream = (None, None)

def map(f, stream):
    if stream is null_stream: return null_stream
    return (f(head(stream)), lambda: map(f, tail(stream)))

def reduce(f, result, stream):
    if stream is null_stream: return result
    return reduce(f, f(result, head(stream)), tail(stream))

def take(n, stream):
    if n <= 0 or stream is null_stream: return null_stream
    return (head(stream), lambda: take(n-1, tail(stream)))

def to_array(stream):
    return reduce(lambda a, x: a + [x], [], stream)

def filter(pred, stream):
    if stream is null_stream: return null_stream
    if pred(head(stream)):
        return (head(stream), lambda: filter(pred, tail(stream)))
    return filter(pred, tail(stream))

def sieve(stream):
    if stream is null_stream:
        return null_stream
    return (lambda h:
        (h, lambda: sieve(filter(lambda x: x%h != 0, tail(stream))))
    )(head(stream))

def head((H, _)): return H

def tail((_, T)): return T()

def integers_from(N): return (N, lambda: integers_from(N+1))

def rec_stream(f):
    return (f, lambda: rec_stream(lambda x: f(f(x))))

def newton(f, fdash):
    return lambda x: x - f(x)/float(fdash(x))

def newton_solver(iters, f, fdash):
    def solve(v):
        n = newton(lambda x: f(x) - v, fdash)
        stream = rec_stream(n)
        return to_array(take(iters, stream))[-1]
    return solve
