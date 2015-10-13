(define (lookup key table)
  (let ((record (assoc key (cdr table))))
	;; why (cdr table)? because first table content is the dummy
	(if record
		(cdr record)
		false)))

(define (assoc key records)
  (cond ((null? records) false)
		((equal? key (caar records)) (car records))
		;; note : 'caar' means double car, for example '(car (car list))'
		(else (assoc key (cdr records)))))

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
	(if record
		(set-cdr! record value)
		(set-cdr! table
				  (cons (cons key value)
						(cdr table))))))

(define (make-table)
  (list '*table*))


(define t1 (make-table))
t1
(insert! 'key1 'value1 t1)
t1
(insert! 'key2 'value2 t1)
t1
(lookup 'key1 t1)

(caar (cdr t1))
