(load "lib/hof/fold.scm")

(define (nums-freq x ls)
  (cond ((null? ls) 0)
		((= x (car ls)) (+ 1 (nums-freq x (cdr ls))))
		(else (nums-freq x (cdr ls)))))

(define (duplicate-elem? ls)
  (cond ((null? ls) false)
		((> (nums-freq (car ls) ls) 1) true)
		(else (duplicate-elem? (cdr ls)))))
