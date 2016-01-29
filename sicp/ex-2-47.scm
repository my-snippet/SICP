(load "ex-2-46.scm")


(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-frame-cons origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

;; in case of cons, last element is combined with '(), therefore
;; it is not pair (not enclosed with parenthesis)
(define (edge2-frame-in-cons frame)
  (cddr frame))
;;(pair? (car (cons 1 '())))
