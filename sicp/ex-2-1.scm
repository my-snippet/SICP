;; must refer to ref1 and ref2
(define (make-rat-enhanced n d)  
  (let ((g (gcd n d)))
	(cond ((zero? d) (error "Denominator cannot be zero"))		  
		  ((and (positive? n) (negative? d))
		   (cons (- (/ n g)) (abs (/ d g))))
		  ((and (negative? n) (negative? d))
		   (cons (abs (/ n g)) (abs (/ d g))))		  
		  (else (cons (/ n g) (/ d g))))))

#| ref 1
;; http://www.billthelizard.com/2010/09/sicp-21-rational-numbers.html
(define (make-rat n d)
  (let ((g (gcd n d)))
	(if (< d 0)
		(cons (/ (* n -1) g) (/ (* d -1) g))
		(cons (/ n g) (/ d g)))))
|#

#| ref 2
;; http://community.schemewiki.org/?sicp-ex-2.1
 (define (make-rat n d) 
   (let ((g ((if (< d 0) - +) (gcd n d)))) 
     (cons (/ n g) (/ d g)))) 
|#
