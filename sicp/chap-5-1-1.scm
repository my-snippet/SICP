;; reference : http://www.giovannisfois.net/content/sicp-exercise-52
;; reg machine simulator
(load "lib/register/ch5-regsim")


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


;;
(set-register-contents! gcd-machine 'a 8)
(set-register-contents! gcd-machine 'b 8)

(start gcd-machine)
(newline)
(display (get-register-contents gcd-machine 't))
