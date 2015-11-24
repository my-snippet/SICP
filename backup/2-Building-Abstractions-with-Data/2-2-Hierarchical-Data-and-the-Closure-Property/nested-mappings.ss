#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval k n)
  (if (> k n)
      null
      (cons k (enumerate-interval (+ k 1) n))))

(define (filter predicate sequence)
  (if (null? sequence)
      null
      (if (predicate (car sequence))
          (cons (car sequence)
                (filter predicate (cdr sequence)))
          (filter predicate (cdr sequence)))))

(define (find-divisor n)
  (define (find-divisor-iter k)
    (cond ((> k n) n)
          ((= (remainder n k) 0) k)
          (else (find-divisor-iter (+ k 1)))))
  (find-divisor-iter 2))

(define (prime? n)
  (if (= (find-divisor n) n) true false))


(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 2 n)))))

(prime-sum-pairs 10)
;; notice
;; 1.
;; Variable 'i' can starts with 0, because (enumerate-interval 1 0) make ()
;; But this is unnecessary
;; So this example starts with 2
;;
;; 2.
;; cadr shows next element from first element
