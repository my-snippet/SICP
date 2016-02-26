(load "ex-2-27.scm")


(define x (list (list 1 2) (list 3 4)))
(define y (list (list (list 0 1) 2) (list 3 4)))

(deep-reverse x)
(deep-reverse y)

(deep-reverse-version1 x)
(deep-reverse-version2 y)
