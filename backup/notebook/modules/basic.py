from types import GeneratorType


"""
1.
"""

def is_even(n):
    return n % 2 == 0


"""
2. 
"""

def accumulate(op, initial, sequence):
    if sequence == []:
        return initial
    else:
        return op(sequence[0], accumulate(op, initial, sequence[1:]))


def accumulate_n(op, init, seqs):
    if seqs[0] == ():
        return []
    else:
        return [
            accumulate(
                op, 
                init, 
                list(map(lambda sqs: sqs[0], seqs)))
        ] + accumulate_n(
                op,
                init,
                list(map(lambda sqs: sqs[1:], seqs)))


"""
3.
"""
def promise(x):
    yield x


def cons_stream(a, b):
    return (a, promise(b))


def display_stream(s):
    def inner(s):
        if isinstance(s, tuple):
            print(s[0])
            return display_stream((s[1]))
        else:
            print(s)

    try:
        inner(yield_stream(s))
    except:
        pass


def stream_enumerate_interval(low, high):
    if high > low:
        return cons_stream(
            low, 
            stream_enumerate_interval(low+1, high))
    else:
        return high


def stream_filter(pred, stream):
    if not isinstance(stream, tuple):
        return stream
    elif pred(stream[0]):
        return cons_stream(
            stream[0],
            stream_filter(pred, next(stream[1])))
    else:
        return stream_filter(pred, next(stream[1]))


def apply(op, sequence):
    if len(sequence) == 1:
        return sequence[0]
    else:
        return op(sequence[0], apply(op, sequence[1:]))


def nth_elements_extractor(index, sequences):
    if len(sequences) == 0:
        return ()
    else:
        return (sequences[0][index],) + \
            nth_elements_extractor(index, sequences[1:])


""" For finite stream
def stream_map(f, argstreams):
    if not isinstance(argstreams[0], tuple):
        return apply(f, argstreams)
    else:
        return cons_stream(
            apply(f, nth_elements_extractor(argstreams, 0)),
            apply(stream_map, (
                    f, 
                    tuple(map(lambda e: next(e), 
                              nth_elements_extractor(argstreams, 1))))))
"""

def yield_stream(stream):
    if isinstance(stream, GeneratorType):
        return yield_stream(next(stream))
    else:
        return stream


def is_generator_contained(sequence):
    if isinstance(sequence, GeneratorType):
        return 
    
    if len(sequence) == 0:
        return False

    if isinstance(sequence[0], GeneratorType):
        return True
    else:
        return is_generator_contained(sequence[1:])

def yield_sequence(sequence):
    def operate(s):
        return tuple(map(lambda e:
            next(e) if isinstance(e, GeneratorType)
            else e, s))
    
    if is_generator_contained(sequence):
        return yield_sequence(operate(sequence))
    else:
        return sequence


"""
For infinite stream
"""
def stream_map(f, argstreams):
    def inner(f, argstreams):
        if not isinstance(argstreams[0], tuple):
            return apply(f, argstreams)
        else:
            yield cons_stream(
                apply(f, nth_elements_extractor(0, argstreams)),
                stream_map(f, yield_sequence(
                            nth_elements_extractor(1, argstreams))))
    return inner(f, yield_sequence(argstreams))
