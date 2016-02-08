(load "ex-2-2.scm")


;; What is the minimum form of a rectangle
;; 1. The four segments
;; 2. The four points
;; 3. One diagonal
;; 
;; How to specify the index of the point
;; 1. User input
;; 2. Computer decision in the order of coordinates
;; 
;; Either 1. and 2. , there are more left to think about it.
;; How can it indexes the points consistently?
;; The two points that have the same x-coordinate,
;; The two points that have the same y-coordinate,
;; Ane what x-coordinate of two points are larger than other two points
;; 
;; ... Yes, it is a little complex than first guess.
;; 
;; Therefore for now It starts with a hope that users will 
;; use the interface in the specified manner.
;; 
;; Like this,
;; p1 -- p3
;; :      :
;; p2 -- p4
;;
;; For clarity
;; tl : top left
;; tr : top right
;; bl : bottom left
;; br : bottom right
;;
;;         s-t
;;    p-tl -- p-tr
;; s-l :        : s-r
;;    p-bl -- p-br
;;         s-b

;; First ver : it takes 4 points and constructs a list which contains 4 points
(define (make-rectangle p-tl p-bl p-br p-tr)
  (cons p-tl (cons p-bl (cons p-br (cons p-tr '())))))

(define (p-tl-rect r)
  (car r))

(define (p-bl-rect r)
  (cadr r))

(define (p-br-rect r)
  (caddr r))

(define (p-tr-rect r)
  (cadddr r))

(define (y-diff-points p1 p2)
  (abs (- (y-point p1)
		  (y-point p2))))

(define (x-diff-points p1 p2)
  (abs (- (x-point p1)
		  (x-point p2))))

(define (perimeter-rect r)
  (let ((h (y-diff-points (p-bl-rect r) (p-tl-rect r)))
		(w (x-diff-points (p-br-rect r) (p-bl-rect r))))
	(* 2 (+ h w))))

(define (area-rect r)
  (let ((h (y-diff-points (p-bl-rect r) (p-tl-rect r)))
		(w (x-diff-points (p-br-rect r) (p-bl-rect r))))
	(* h w)))


;; Second version
;; it takes 4 points and constructs 4 segments
;; it uses ex-2-2 libraries as segments
(define (make-rectangle-seg p-tl p-bl p-br p-tr)
  (cons (make-segment p-tl p-bl)
		(cons (make-segment p-bl p-br)
			  (cons (make-segment p-br p-tr)
					(cons (make-segment p-tr p-tl)
						  '())))))

(define (s-l-rect r)
  (car r))

(define (s-b-rect r)
  (cadr r))

(define (s-r-rect r)
  (caddr r))

(define (s-t-rect r)
  (cadddr r))

(define (height-seg s)
  (abs (- (y-point (end-segment s))
		  (y-point (start-segment s)))))

(define (width-seg s)
  (abs (- (x-point (end-segment s))
		  (x-point (start-segment s)))))

(define (perimeter-rect-seg r)
  (let ((h (height-seg (s-l-rect r)))
		(w (width-seg (s-b-rect r))))
	(* 2 (+ h w))))

(define (area-rect-seg r)
  (let ((h (height-seg (s-l-rect r)))
		(w (width-seg (s-b-rect r))))
	(* h w)))


;; Third ver : it takes 2 points and constructs a list which contains 2 points
;; ( a point & opposite side point )
(define (make-rectangle-2p p p-opposite)
  (cons p p-opposite))

(define (p-rect-2p r)
  (car r))

(define (p-opposite-rect-2p r)
  (cdr r))

;; it uses first version procedures to calculate height, width
(define (perimeter-rect-2p r)
  (let ((h (y-diff-points (p-rect-2p r) (p-opposite-rect-2p r)))
		(w (x-diff-points (p-rect-2p r) (p-opposite-rect-2p r))))
	(* 2 (+ h w))))

(define (area-rect-2p r)
  (let ((h (y-diff-points (p-rect-2p r) (p-opposite-rect-2p r)))
		(w (x-diff-points (p-rect-2p r) (p-opposite-rect-2p r))))
	(* h w)))


;; Fourth ver : it takes 1 diagonal of a rectangle
(define (make-rectangle-1d d)
  (cons (start-segment d) (end-segment d)))

(define (start-diag-point r)
  (car r))

(define (end-diag-point r)
  (cdr r))

;; it uses first version procedures to calculate height, width
(define (perimeter-rect-1d r)
  (let ((h (y-diff-points (start-diag-point r) (end-diag-point r)))
		(w (x-diff-points (start-diag-point r) (end-diag-point r))))
	(* 2 (+ h w))))

(define (area-rect-1d r)
  (let ((h (y-diff-points (start-diag-point r) (end-diag-point r)))
		(w (x-diff-points (start-diag-point r) (end-diag-point r))))
	(* h w)))


;; Fifth ver
;; If a rectangle is not parallel to x axis & y axis, second, third, fourth
;; versions may causes an error. Therefore it is needed to use pythagoras
;; theorem.

;; Models 
;; 1. Three points
;; 2. Two segments( Adjacent, Parallel )
;; Here it uses - 1. Three points - as arguments and constructs adjacent 2 segments

;; It assumes that users input point arguments in order of counter-clockwise
;; like these,
;;  p2         p1        p3
;;p3  p1    p2              p2
;;             p3        p1

(define (make-rectangle-3p p1 p2 p3)
  (cons (make-segment p1 p2) (make-segment p2 p3)))

(define (point-dist p1 p2)
  (sqrt (+ (square (- (x-point p1) (x-point p2)))
		   (square (- (y-point p1) (y-point p2)))))) 

(define (start-seg-rect-3p r)
  (car r))

(define (end-seg-rect-3p r)
  (cdr r))

;; it uses first version procedures to calculate height, width
(define (perimeter-rect-3p r)
  (let ((h (y-diff-points (start-segment (start-diag-point r))
						  (end-segment (start-diag-point r))))
		(w (x-diff-points (start-segment (end-diag-point r))
						  (end-segment (end-diag-point r)))))
	(* 2 (+ h w))))

(define (area-rect-3p r)
  (let ((h (y-diff-points (start-segment (start-diag-point r))
						  (end-segment (start-diag-point r))))
		(w (x-diff-points (start-segment (end-diag-point r))
						  (end-segment (end-diag-point r)))))
	(* h w)))


;; Other versions
;; If it takes two parellel segments as arguemtns, it is needed to use
;; pythagoras theorem to calculate a unknown width(or height)
;; http://www.billthelizard.com/2010/10/sicp-23-rectangles-in-plane.html
;; http://community.schemewiki.org/?sicp-ex-2.3
