(load "ex-1-27.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "Carmichael detection test")
;; First 3 Carmichael numbers : 561, 1105, 1729
;; 561 = 3 * 187, 1105 = 5 * 221, 1729 = 7 * 247

(test-assert "Prime numbers can pass Carmichael test"
			 (and (carmichael? 2)
				  (carmichael? 3)
				  (carmichael? 5)))

(test-assert "a number which is not Prime and Carmichael, 
cannot pass carmichael? test"
			 (not (and (carmichael? 4)
					   (carmichael? 9)
					   (carmichael? 16))))

;; 561 = 3 * 187, 1105 = 5 * 221, 1729 = 7 * 247
(test-assert "First 3 Carmichaels detection"
			 (and (carmichael? (* 3 187))
				  (carmichael? (* 5 221))
				  (carmichael? (* 7 247))))

(test-end "Carmichael detection test")
