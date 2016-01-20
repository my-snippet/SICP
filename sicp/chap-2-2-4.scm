#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
;; Reference : http://www.billthelizard.com/2011/08/sicp-244-245-picture-language.html
;; I used Racket for picture language. 
;; Because it has convenient to import picture-lang libraries.

;; Basic functions
#|
(paint einstein)
(paint (flip-vert einstein))
(paint (beside einstein (flip-vert einstein)))
(paint (below einstein einstein))
|#

;; Procedures
(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))
(paint (flipped-pairs einstein))

;; see Figure 2.13 (SICP Book)
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))
(paint (right-split einstein 1))
(paint (right-split einstein 2))

