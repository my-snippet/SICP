;; First 3 Carmichael numbers : 561, 1105, 1729
(load "ex-1-27.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")

(test-begin "Carmichael detection test")

(test-assert "First 3 Carmichaels detection"
			 (and (carmichael? 561)
				  (carmichael? 1105)
				  (carmichael? 1729)))

(test-end "Carmichael detection test")
