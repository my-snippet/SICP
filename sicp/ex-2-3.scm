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
