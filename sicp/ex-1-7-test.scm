(load "ex-1-7")


(map (lambda (x) (sqrt-newton-law x)) (list 1 2 3 4 5))

;; sqrt-slightly causes stack overflow if x is more than 5.
(map (lambda (x) (sqrt-slightly x)) (list 1 2 3 4 5))
