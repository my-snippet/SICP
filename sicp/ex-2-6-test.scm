(load "ex-2-6.scm")

(load "lib/test/chicken-scheme-test.scm")


#|
;; manual decoding version
(load "lib/basic/operations.scm")


((zero inc) 0)
((one inc) 0)
((two inc) 0)

(((church-number 10) inc) 0)

(((church-plus two two) inc) 0)
(((church-mult two three) inc) 0)
(((church-exp two three) inc) 0)

;;(((sub-1 dec) 0) 1)
|#


(test-begin "church operation")

(test-assert "one = 1, two = 2"
			 (and (= 1 (church-decode one))
				  (= 2 (church-decode two))))

(test-assert "2+1 = 1+2 = 3"
			 (and (= 3
					 (church-decode (church-plus two one))
					 (church-decode (church-plus one two)))))

(test-assert "2*3 = 3*2 = 6"
			 (and (= 6
					 (church-decode (church-mult three two))
					 (church-decode (church-mult two three)))))

(test-assert "3^3 = 27"
			 (= 27 (church-decode (church-exp three three))))

(test-assert "pred(3) = 2"			 
			 (= 2 (church-decode (pred three))))

(test-assert "3-2 = 2-1 = 1"
			 (and (= 1
					 (church-decode (church-minus three two))
					 (church-decode (church-minus two one)))))

;;(church-decode (church-minus two three))
(test-assert "church-minus(2-3) = 0"
			 (= 0 
				(church-decode (church-minus two three))))

(test-assert "church-pred_(3) = 2, (pred_ : named version of pred)"
			 (= 2
				(church-decode (pred_ three))))

(test-end "church operation")
