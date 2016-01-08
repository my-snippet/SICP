;;;;;; The query evaluator and the driver loop
;;;; query-driver-loop
;; 1. It(query-driver-loop) repeatedly reads input expressions
;; 2. The driver passes this query to the evaluator qeval together with an initial frame stream
;; 3. The result of the evaluation is a stream of frames generated by satisfying the query
;; 4. query variable is changed to the values supplied by the stream of frames
(define input-prompt  ";;; Query input:")
(define output-prompt ";;; Query results:")

(define (query-driver-loop)
  (prompt-for-input input-prompt)
  (let ((q (query-syntax-process (read))))
	(cond ((assertion-to-be-added? q)
		   (add-rule-or-assertion!
			(add-assertion-body q))
		   (newline)
		   (display
			"Assertion added to data base.")
		   (query-driver-loop))
		  (else
		   (newline)
		   (display output-prompt)
		   (display-stream
			(stream-map
			 (lambda (frame)
			   (instantiate
				q
				frame
				(lambda (v f)
				  (contract-question-mark v))))
			 (qeval q (singleton-stream '()))))
		   (query-driver-loop)))))
;; The expressions of the query language
;; 1. The implementation of the expression syntax
;; predicate : assertion-to-be-added?
;; selector : add-assertion-body 
;; 2. transformations to make the processing more efficient 
;; procedure : query-syntax-process, contract-question-mark


;;;; Instantiation
;; To instantiate an expression, we copy it, replacing any variables
;; in the expression by their values in a given frame.
;; The values are themselves instantiated, since they could contain variables
(define (instantiate
		 exp frame unbound-var-handler)
  (define (copy exp)
	(cond ((var? exp)
		   (let ((binding
				  (binding-in-frame
				   exp frame)))
			 (if binding
				 (copy
				  (binding-value binding))
				 (unbound-var-handler
				  exp frame))))
		  ((pair? exp)
		   (cons (copy (car exp))
				 (copy (cdr exp))))
		  (else exp)))
  (copy exp))


;;;; qeval
;; - It is called by the query-driver-loop
;; - the basic evaluator of the query system
;; - input : a query and a stream of frames
;; - output : a stream of extended frames
;; - It identifies special forms by a data-directed dispatch.
;; - else : it is assumed to be a simple query
;; - type, contents : implement the abstract syntax of the special forms.
(define (qeval query frame-stream)
  (let ((qproc (get (type query) 'qeval)))
	(if qproc
		(qproc (contents query) frame-stream)
		(simple-query query frame-stream))))


(define (simple-query query-pattern
					  frame-stream)
  (stream-flatmap
   (lambda (frame)
	 (stream-append-delayed
	  (find-assertions query-pattern frame)
	  (delay
		(apply-rules query-pattern frame))))
   frame-stream))
;; find-assertions : match each frame in the input stream against
;; all assertions in the data base, producing a stream of extended frames
;; apply-rules : apply all possible rules, producing another stream of extended frames.
;; stream-append-delayed : It combines assertion frames with rule frames as a stream.
;; stream-flatmap : It makes all the streams as a stream that
;; can be extended to produce a match with the given pattern.


;;;;;; Compound query
;;;; conjoin
;; - It handles And queries.
;; - It takes as inputs the conjuncts(logical multiplication) and the frame stream
;; - 1. It finds frame extensions that satisfy the first query in the conjunction.
;; - 2. using this as the new frame stream, it recursively applies conjoin
;; to the rest of the queries.
(define (conjoin conjuncts frame-stream)
  (if (empty-conjunction? conjuncts)
	  frame-stream
	  (conjoin (rest-conjuncts conjuncts)
			   (qeval
				(first-conjunct conjuncts)
				frame-stream))))

;;(put 'and 'qeval conjoin)

;; disjoin
;; The output streams for the various disjuncts(logical summation) of the or
;; are computed separately and merged using the interleave-delayed procedure
(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
	  the-empty-stream
	  (interleave-delayed
	   (qeval (first-disjunct disjuncts)
			  frame-stream)
	   (delay (disjoin
			   (rest-disjuncts disjuncts)
			   frame-stream)))))

;;(put 'or 'qeval disjoin)


