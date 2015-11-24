#lang racket

(require "../../../modules/2/binary-tree.ss")

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result
               (partial-tree elts left-size)))
          (let ((left-tree (car left-result)) 
                (non-left-elts (cdr left-result)) 
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts)) (right-result
                                                    (partial-tree
                                                     (cdr non-left-elts)
                                                     right-size)))
              (let ((right-tree (car right-result)) (remaining-elts
                                                     (cdr right-result)))
                (cons (make-tree this-entry
                                 left-tree
                                 right-tree)
                      remaining-elts))))))))


(list->tree (list 1 3 5 7 9 11))

;; Question a : Describe how this procedure works
;; Answer : 
;; First, Seperate left side of middle position and right side of middle position
;; Second, Do each sides as left tree, right tree
;; Third, Insert Middle position element of upper tree & 
;; Repeat partial-tree inserted left tree, right tree

;; Question b : THETA(log n)