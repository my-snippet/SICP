def is_even(n):
    return n % 2 == 0


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
