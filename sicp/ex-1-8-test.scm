(load "ex-1-8")
(load "lib/basic/operations")


;; test : 1^3 2^3 ... 10^3
(map (lambda (x) (cube-root (power x 3))) (list 1 2 3 4 5 6 7 8 9 10))
