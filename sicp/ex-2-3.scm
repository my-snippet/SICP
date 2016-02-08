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

(define (height-points p-tl p-bl)
  (abs (- (y-point p-bl)
		  (y-point p-tl))))

(define (width-points p-tl p-bl)
  (abs (- (x-point p-bl)
		  (x-point p-tl))))

(define (perimeter-rect r)
  (let ((h (height-points (p-bl-rect r) (p-tl-rect r)))
		(w (width-points (p-br-rect r) (p-bl-rect r))))
	(* 2 (+ h w))))

(define (area-rect r)
  (let ((h (height-points (p-bl-rect r) (p-tl-rect r)))
		(w (width-points (p-br-rect r) (p-bl-rect r))))
	(* h w)))

;; Second version
;; it takes 4 points and returns 4 segments
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
