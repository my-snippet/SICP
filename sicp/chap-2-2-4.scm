#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
;; Reference : http://www.billthelizard.com/2011/08/sicp-244-245-picture-language.html
;; I used Racket for picture language. 
;; Because it has convenient to import picture-lang libraries.

(require "ex-2-44.scm")
  

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

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))
(paint (corner-split einstein 1))
(paint (corner-split einstein 2))

(define (corner-split-ver-2 painter n)
  (if (= n 0)
      (beside painter painter)
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split-ver-2 painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))
(paint (corner-split-ver-2 einstein 1))
(paint (corner-split-ver-2 einstein 2))


;; frame-coord-map example
(define origin (make-vect 0 0))
(define unit-vect (make-vect 1 1))
(define edge1 (make-vect 2 4))
(define edge2 (make-vect 3 9))
(define a (make-frame origin edge1 edge2))
((frame-coord-map a) unit-vect)