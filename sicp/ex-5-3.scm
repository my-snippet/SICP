(load "lib/register/ch5-regsim")


(define (sqrt x)
  (define (good-enough? guess)
	(< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
	(average guess (/ x guess)))
  (define (sqrt-iter guess)
	(if (good-enough? guess)
		guess
		(sqrt-iter (improve guess))))
  (sqrt-iter 1.0))


#|
;; By assuming that good-enough? and improve operations 
;; are available as primitives
(controller
   (test-b
	(test (op good-enough?) (reg g) (reg x))
	(branch (label sqrt-done))
	(assign g (op improve) (reg g) (reg x))
	(goto (label test-b))
	sqrt-done)
|#


(define sqrt-machine
  (make-machine
   '(g x t)
   (list (list '= =)
		 (list '+ +)
		 (list '- -)
		 (list '* *)
		 (list '/ / )
		 (list '< <)
		 (list 'abs abs))
   '(test-b
	 ;; get-enough? start
	 (assign t (op *) (reg g) (reg g))
	 (assign t (op -) (reg t) (reg x))
	 (assign t (op abs) (reg t))
	 (test (op <) (reg t) (const 0.001))
	 ;; get-enough? end

	 (branch (label sqrt-done))
	 ;; improve start
	 (assign t (op /) (reg x) (reg g))
	 (assign t (op +) (reg g) (reg t))	
	 (assign g (op /) (reg t) (const 2.0))
	 ;; improve end
	 (goto (label test-b))
	 sqrt-done)
   ))

(set-register-contents! sqrt-machine 'g 1.0)
(set-register-contents! sqrt-machine 'x 2)

;; test range : [1..10]
(map (lambda (x)
	   (set-register-contents! sqrt-machine 'x x)
	   (start sqrt-machine)
	   (newline)
	   (display (get-register-contents sqrt-machine 'g)))
	 (list 1 2 3 4 5 6 7 8 9 10))
