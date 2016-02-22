;; idea 1
;; interval of a : a'
;; interval of b : b'
;; min(a'-b') or min(b'-a') = min(a,b) - max(a,b)
;; max(a'-b') or max(b'-a') = max(a,b) - min(a,b)

;; * note
;; but idea 1 is not correct. because, interval procedure will always
;; be executed from a to b ( not b to a )

(load "chap-2-1-4.scm")


(define (sub-interval x y)
  (make-interval (- (lower-bound x)
					(upper-bound y))
				 (- (upper-bound x)
					(lower-bound y))))
