(load "lib/register/ch5-regsim")


(define (factorial n)
  (define (iter product counter)
	(if (> counter n)
		product
		(iter (* counter product)
			  (+ counter 1))))
  (iter 1 1))

(define fact-machine
  (make-machine
   '(n p c)
   (list (list '> >)
		 (list '* *)
		 (list '+ +))
   '(test-b
	  (test (op >) (reg c) (reg n))
	  (branch (label fact-done))
	  (assign p (op *) (reg c) (reg p))
 	  (assign c (op +) (reg c) (const 1))
	  (goto (label test-b))
	  fact-done)
   ))


;; set data
(set-register-contents! fact-machine 'p 1)
(set-register-contents! fact-machine 'c 1)

;; test range : [1..10]
(map (lambda (n)
	   (set-register-contents! fact-machine 'n n)
	   (start fact-machine)
	   (newline)
	   (display (get-register-contents fact-machine 'p)))
	 (list 1 2 3 4 5 6 7 8 9 10))
