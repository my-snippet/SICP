(load "ex-2-27.scm")


(define x (list (list 1 2) (list 3 4)))
(define y (list (list (list 0 1) 2) (list 3 4)))

(deep-reverse x)
(deep-reverse y)

(deep-reverse-version0 x)
(deep-reverse-version0 y)

(deep-reverse-version2 x)
(deep-reverse-version2 y)

(deep-reverse-version3 x)
(deep-reverse-version3 y)

(deep-reverse-version4 x)
(deep-reverse-version4 y)
