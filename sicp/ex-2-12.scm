;; code references
;; http://www.billthelizard.com/2010/12/sicp-212-216-extended-exercise-interval.html
;; http://community.schemewiki.org/?sicp-ex-2.12
(load "chap-2-1-4.scm")


;; It uses library in chapter 2.1.4 more well than below.
(define (make-center-percent center percent-tolerance)
  (make-center-width center
					 (* center (/ percent-tolerance 100.0))))

;;(define (make-center-percent-version-0 center percent-tolerance)
;;  (make-interval (- center (* center percent-tolerance))
;;				 (+ center (* center percent-tolerance))))

(define (percent interval)
  (* 100.0 (/ (width interval) (center interval))))
