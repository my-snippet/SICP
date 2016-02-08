(load "ex-2-3.scm")
(load "ex-2-2.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "rectangle operations")

(define w 2)
(define h 3)

(define p1 (make-point 0 0))
(define p2 (make-point 0 (- h)))
(define p3 (make-point w (- h)))
(define p4 (make-point w 0))
(define r (make-rectangle p1 p2 p3 p4))

(define r-seg (make-rectangle-seg p1 p2 p3 p4))

(test-assert "points ver : perimeter containing negative coordinates"
			 (= (perimeter-rect r) (* 2 (+ w h))))

(test-assert "points ver : area containing negative coordinates"
			 (= (area-rect r) (* w h)))

(test-assert "segments ver : perimeter containing negative coordinates"
			 (= (perimeter-rect-seg r-seg) (* 2 (+ w h))))

(test-assert "segments ver : area containing negative coordinates"
			 (= (area-rect-seg r-seg) (* w h)))

(test-end "rectangle operations")
