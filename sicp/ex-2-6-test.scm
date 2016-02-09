(load "ex-2-6.scm")
(load "lib/basic/operations.scm")


((zero inc) 0)
((one inc) 0)
((two inc) 0)

(((church-number 10) inc) 0)

(((church-plus two two) inc) 0)
(((church-mult two three) inc) 0)
(((church-exp two three) inc) 0)
