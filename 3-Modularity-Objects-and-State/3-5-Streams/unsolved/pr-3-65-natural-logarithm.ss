(load "../../modules/3/stream-paradigm.ss")


(define ln-2
  (cons-stream 1.0
	       (stream-map - (proc (/ 1.0 (+ n 1))))))
