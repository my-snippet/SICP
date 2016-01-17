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


;;;; negate
;; include a given frame in the output stream only if it cannot be extended.
;; (query being negated, that is, query being not statisfied)
(define (negate operands frame-stream)
  (stream-flatmap
   (lambda (frame)
	 (if (stream-null?
		  (qeval (negated-query operands)
				 (singleton-stream frame)))
		 (singleton-stream frame)
		 the-empty-stream))
   frame-stream))

;;(put 'not 'qeval negate)


;;;; lisp-value
;; - if the predicate returns false,
;; then the frame filtered out of the input stream.
;; - An error results if there are unbound pattern variables.
(define (lisp-value call frame-stream)
  (stream-flatmap
   (lambda (frame)
	 (if (execute
		  (instantiate
		   call
		   frame
		   (lambda (v f)
			 (error
			  "Unknown pat var: LISP-VALUE"
			  v))))
		 (singleton-stream frame)
		 the-empty-stream))
   frame-stream))

;;(put 'lisp-value 'qeval lisp-value)


;; execute
;; it applies the predicate to the arguments
;; must eval the predicate expression to get the procedure to apply
;; but it must not evaluate the arguments,
;; since they are already the actual arguments
(define (execute exp)
  (apply (eval (predicate exp)
			   user-initial-environment)
		 (args exp)))


;;;; Finding Assertions by Pattern Matching
;; find-assertions
;; it use fetch-assertions to get a stream of all the assertions in the data base
;; fetch-assertions : to apply simple tests that will eliminate many of the entries
;; The system would still work if we eliminated fetch-assertions, but less efficient.
(define (find-assertions pattern frame)
  (stream-flatmap
   (lambda (datum)
	 (check-an-assertion datum pattern frame))
   (fetch-assertions pattern frame)))


;; check-an-assertion
;; input(arguments) : a pattern, a data object (assertion), a frame
;; ouput(return) : one-element stream or the-empty-stream
(define (check-an-assertion
		 assertion query-pat query-frame)
  (let ((match-result
		 (pattern-match
		  query-pat assertion query-frame)))
	(if (eq? match-result 'failed)
		the-empty-stream
		(singleton-stream match-result))))


;; pattern-match
;; output : failed sign or an extension of the given frame
;; It accumulates bindings for the pattern variables
;; Three possible types of arguments
;; 1. the pattern and the data object are the same : It returns the frame of bindings
;; accumulated so far
;; 2. the pattern is a variable : It extends the current frame by binding the variable
;; to the data
;; 3. the pattern and the data are both pairs : It (recursively) matches the car of
;; the pattern against the car of the data to produce a frame
(define (pattern-match pat dat frame)
  (cond ((eq? frame 'failed) 'failed)
		((equal? pat dat) frame)
		((var? pat)
		 (extend-if-consistent
		  pat dat frame))
		((and (pair? pat) (pair? dat))
		 (pattern-match
		  (cdr pat)
		  (cdr dat)
		  (pattern-match
		   (car pat) (car dat) frame)))
		(else 'failed)))


;; extend-if-consistent
;; 1. No binding for the variable? : It Just adds the binding of the variable to
;; the data.
;; 2. Otherwise? :  It matches the data against the value of the variable in the
;; frame.
;; 3. Stored value contains only constants : It simply tests whether the stored
;; and new values are the same. If so, it returns the unmodified frame; if not,
;; it returns a failure indication.
;; 4. The stored value may contain pattern variables if it was stored during
;; unification. The recursive match of the stored pattern against the new data
;; will add or check bindings for the variables in this pattern. ( for more
;; detail, read [4.4.4.3 Finding Assertions by Pattern Matching]. )

(define (extend-if-consistent var dat frame)
  (let ((binding (binding-in-frame var frame)))
	(if binding
		(pattern-match
		 (binding-value binding) dat frame)
		(extend var dat frame))))
