;; If last-pair checks (not pair?) it can causes error because
;; last pair can be pair.
(define (last-pair l)
  (if (null? (cdr l))
	  l
	  (last-pair (cdr l))))
