#lang racket

(define tolerance 0.00001)

(define (even? n)
  (= (/ n 2) 0))

(define (square n)
  (* n n))

(define (fast-exp a n)
  (if (> n 0)
      (if (even? n)
          (square (fast-exp a (/ n 2)))
          (* a (fast-exp a (- n 1))))
      1))

(define (average a b)
  (/ (+ a b) 2.0))

(define (average-damp f)
  (lambda (x) 
    (average x (f x))))

(define (fixed-point f first-guess)

  (define (close-enough? v1 v2)
    ;(display (abs (- v1 v2)))
    ;(newline)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))

  (try first-guess))

(define (sqrt-fixed x)
  (fixed-point (lambda (y) (average (/ x y) y))
               1.0))

(define (repeated f x)
  (define (repeated-inner n)
    (if (> n 0)
        (f (repeated-inner (- n 1)))
        x))
  (lambda (n) (repeated-inner n)))  

(define (root-of-n x n)
  (fixed-point ((repeated
                average-damp
                (lambda (y)
                  (/ x (fast-exp y (- n 1)))))
                (+ (/ n 4) 1))
               1.0))

;; repeated procedure usage example
;; ((repeated (lambda (n) (+ n 1)) 2) 3) 


;; No problem to solve cube root without repetition of average damp
(root-of-n 8 3)
(root-of-n 27 3)


;; But it causes problem more than 4th root
;; So add that procedure in fixed-point argument f like this
;; ((repeated f x) n-times)
;; -->> x can be procedure
;; n-times = After I searched, repeated count follow this rule
;; plus 1 to the quotient of dividing n by 4
(root-of-n (fast-exp 3 4) 4)
(root-of-n (fast-exp 3 5) 5)
(root-of-n (fast-exp 3 8) 8)
(root-of-n (fast-exp 3 12) 12)