(load "infinite-stream-of-pairs.ss")
;;(display-stream-range (pairs integers integers) 0 200)

;; pairs produce
Period A = A Period of ( 'n' th of S, 'n' th of T ) : 2^n, ( except for n = 0 )
Period B = A Period of ( 'n' th of S, 'n+1+k' th of T ) : 2^(n+1)

Position A(  'n' th of S, 'n' th of T )  = 2^1 + 2^2 + ... + 2^n

* If A(  'n' th of S, 'n' th of T ) appears, then B will appears after 2^n times from A
that is : Position B = (2^1 + 2^2 + ... + 2^n) + 2^n

* 0 th of stream means a pair of stream ( no need to subtract 1 to result )

1. The position of (0 th of S, 99 th of T) = 2*99
So, There are 2*99 pairs before The position of (99 th of S, 100 th of T)


2. The position of (98 th of S, 99 th of T) = (2^1 + 2^2 + ... + 2^98) + 2^98
So, There are (2^1 + 2^2 + ... + 2^98) + 2^98 pairs before The position of (98 th of S, 99 th of T)


3. The position of (99 th of S, 99 th of T) = (2^1 + 2^2 + ... + 2^99)
So, There are (2^1 + 2^2 + ... + 2^99) pairs before The position of (99 th of S, 99 th of T)
