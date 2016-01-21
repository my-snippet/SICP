;; reference
;; https://tobilehman.com/blog/2013/04/07/visualization-of-sicp-exercise-1-dot-14/
(define (cc-graph amount kinds-of-coins)

  (define display-node (lambda (label amount kinds-of-coins)
						 (begin
						   (display "  ")
						   (display label)
						   (display " [label=\"")
						   (display `(cc ,amount ,kinds-of-coins))
						   (display "\"];")
						   (newline))))

  (define display-edge (lambda (a b)
						 (begin
						   (display "  ")
						   (display a)
						   (display " -> ")
						   (display b)
						   (display ";")
						   (newline))))

  (define base-case (lambda (amount kinds-of-coins)
					  (or (< amount 0)
						  (= kinds-of-coins 0)
						  (= amount 0))))

  (define left (lambda (label)
				 (string-append label "l")))

  (define right (lambda (label)
				  (string-append label "r")))


										; label is the unique label of the function invocation
  (define (recurse label amount kinds-of-coins)
	(if (base-case amount kinds-of-coins)
		(display-node label amount kinds-of-coins)
		(begin
		  (display-node label amount kinds-of-coins)
		  (display-edge label (left label))
		  (display-edge label (right label))
		  (recurse (left label) amount (- kinds-of-coins 1))
		  (recurse (right label)
				   (- amount (first-denomination kinds-of-coins))
				   kinds-of-coins))))

  (begin
	(display "digraph {")
	(newline)
	(recurse "s" amount kinds-of-coins)
	(newline)
	(display "}")))


(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 5) 50)
		((= kinds-of-coins 4) 25)
		((= kinds-of-coins 3) 10)
		((= kinds-of-coins 2) 5)
		((= kinds-of-coins 1) 1))) 
