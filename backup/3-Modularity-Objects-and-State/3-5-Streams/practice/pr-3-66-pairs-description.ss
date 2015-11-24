(load "infinite-stream-of-pairs.ss")


;; pairs produce
;; Period A = A Period of ( 'n' th of S, 'n' th of T ) : 2^(n+1), ( except for n = 0 )
;; Period B = A Period of ( 'n' th of S, 'n+1+k' th of T ) : 2^(n+1)
;;
;; Position A(  'n' th of S, 'n' th of T )  = 2^1 + 2^2 + ... + 2^n
;;
;; * If A(  'n' th of S, 'n' th of T ) appears, then B will appears after 2^n times from A
;; that is : Position B = (2^1 + 2^2 + ... + 2^n) + 2^n
;;
;; * 0 th of stream means a pair of stream ( no need to subtract 1 to result )
;;
;; 1. The position of (0 th of S, 99 th of T) = 1 + 2 * (99 - (0 + 1))
;; So, There are 1 + 2*98 pairs before The position of (99 th of S, 100 th of T)
;;
;;
;; 2. The position of (98 th of S, 99 th of T) = (2^1 + 2^2 + ... + 2^98) + 2^98
;; So, There are (2^1 + 2^2 + ... + 2^98) + 2^98 pairs before The position of (98 th of S, 99 th of T)
;;
;;
;; 3. The position of (99 th of S, 99 th of T) = (2^1 + 2^2 + ... + 2^99)
;; So, There are (2^1 + 2^2 + ... + 2^99) pairs before The position of (99 th of S, 99 th of T)

;; And these patterns are produced because of calling '(pairs s2 (stream-cdr s1))'
;; -->> (stream-cdr pairs) makes pairs 2^n times

(define (pow var)
  (lambda (exp)
    (define (iter n result)
      (if (= n 0)
	  result
	  (iter (- n 1) (* result var))))
    (iter exp 1)))
;; ((pow 2) 3)

(define (sum f start end)
  (define (iter k result)
    (if (> k end)
	result
	(iter (+ k 1) (+ result (f k)))))
  (iter start 0))
;; (sum (pow 2) 0 2)


(define int-pairs (pairs integers integers))
(display-stream-range int-pairs 0 200)

;; 1. 
(stream-ref int-pairs (+ 1 (* 2 (- 99 (+ 0 1)))))


;; * Problem 2 and 3 has too big size, so I substituted this small size
;; 2. The number of pairs before (S10, T11) = (11, 12) = (2^1 + 2^2 + ... + 2^10) + 2^10
(stream-ref int-pairs (+ (sum (pow 2) 1 10) ((pow 2) 10)))

;; 3. The number of pairs before (S14, T14) = (15, 15) = (2^1 + 2^2 + ... + 2^14)
(stream-ref int-pairs (sum (pow 2) 1 14))
