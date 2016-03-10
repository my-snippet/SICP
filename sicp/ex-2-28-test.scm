(load "ex-2-28.scm")


(define x (list (list 1 2) (list 3 4)))
(define y (list (list (list 0 1) 2) (list 3 4)))

x
y

(fringe x)
(fringe y)

(fringe-version0 x)
(fringe-version0 y)

(fringe-version1 x)
(fringe-version1 y)

(fringe-version2 x)
(fringe-version2 y)
