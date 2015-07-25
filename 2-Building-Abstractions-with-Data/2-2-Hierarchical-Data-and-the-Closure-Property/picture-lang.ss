#lang racket
(require 2htdp/image)

(define my-first-star (star 30 "outline" "red"))

(define my-second-star (beside my-first-star (flip-vertical my-first-star)))
my-second-star

;; I coudn't find necessary libraries in Dr racket 
;; Picture language later