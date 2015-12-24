(load "lib/hof/fold.scm")

(define (nums-freq x ls)
  (cond ((null? ls) 0)
		((= x (car ls)) (+ 1 (nums-freq x (cdr ls))))
		(else (nums-freq x (cdr ls)))))
