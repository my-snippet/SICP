#lang racket

(require "../../../modules/2/list-to-tree.ss")

;; needed to fix
(define (lookup given-key set-of-records)
  (define (key set)
    (car set))

  (let ((key-of-record (key (car set-of-records))))
    (cond ((null? set-of-records) false)      
          ((equal? given-key key-of-record)
           (car set-of-records))
          ((> given-key key-of-record)
           (lookup given-key (right-tree set-of-records)))
          ((< given-key key-of-record)
           (lookup given-key (left-tree set-of-records))))))


(list->tree (list (list 4 'abracadabra)))
;(lookup 4 (list (list 4 'abracadabra)))