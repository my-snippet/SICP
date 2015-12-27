(define (union-set s1 s2)
  ;; null? s1 : then s2
  ;; s1 > s2 : cons (car s2) (union-set s1 (cdr s2))
  ;; s1 < s2 : cons (car s1) (union-set (cdr s1) s2)
  ;; s1 = s2 : cons (car s1) (union-set (cdr s1) (cdr s2))
  )
