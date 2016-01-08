;; reference : http://www.giovannisfois.net/content/sicp-exercise-52
;; reg machine simulator
(load "lib/register/ch5-regsim")


(define (gcd a b)
  (if (= b 0)
	  a
	  (gcd b (remainder a b))))


(define gcd-machine
  (make-machine
   '(a b t)
   (list (list '= =)
		 (list 'rem remainder))
   '(test-b
	  (test (op =) (reg b) (const 0))
	  (branch (label gcd-done))
	  (assign t (op rem) (reg a) (reg b))
	  (assign a (reg b))
	  (assign b (reg t))
	  (goto (label test-b))
	  gcd-done)
   ))


;; set data
(set-register-contents! gcd-machine 'a 48)
(set-register-contents! gcd-machine 'b 180)

;; operate machine
(start gcd-machine)
(newline)
(display (get-register-contents gcd-machine 'a))
