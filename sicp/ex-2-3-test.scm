(load "ex-2-3.scm")
(load "ex-2-2.scm")

;;;; external lib
(load "lib/test/chicken-scheme-test.scm")


(test-begin "rectangle operations")

(define w 2)
(define h 3)

(define p-tl (make-point 0 0))
(define p-bl (make-point 0 (- h)))
(define p-br (make-point w (- h)))
(define p-tr (make-point w 0))
(define r (make-rectangle p-tl p-bl p-br p-tr))

(define r-seg (make-rectangle-seg p-tl p-bl p-br p-tr))

(define r-2p (make-rectangle-2p p-tl p-br))

(define r-1d (make-rectangle-1d (make-segment p-tl p-br)))

(define r-3p (make-rectangle-3p p-br p-tr p-tl))

(test-assert "points ver : perimeter containing negative coordinates"
			 (= (perimeter-rect r) (* 2 (+ w h))))

(test-assert "points ver : area containing negative coordinates"
			 (= (area-rect r) (* w h)))

(test-assert "segments ver : perimeter containing negative coordinates"
			 (= (perimeter-rect-seg r-seg) (* 2 (+ w h))))

(test-assert "segments ver : area containing negative coordinates"
			 (= (area-rect-seg r-seg) (* w h)))

(test-assert "2 points ver : perimeter containing negative coordinates"
			 (= (perimeter-rect-2p r-2p) (* 2 (+ w h))))

(test-assert "2 points ver : area containing negative coordinates"
			 (= (area-rect-2p r-2p) (* w h)))

(test-assert "1 diagonal ver : perimeter containing negative coordinates"
			 (= (perimeter-rect-1d r-1d) (* 2 (+ w h))))

(test-assert "1 diagonal ver : area containing negative coordinates"
			 (= (area-rect-1d r-1d) (* w h)))

(test-assert "3 points ver : perimeter containing negative coordinates"
			 (= (perimeter-rect-3p r-3p) (* 2 (+ w h))))

(test-assert "3 points ver : area containing negative coordinates"
			 (= (area-rect-3p r-3p) (* w h)))

(test-end "rectangle operations")
