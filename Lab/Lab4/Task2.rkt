#lang racket
(define (distance-recursive vec x)
  (define (helper vec x current-index first-index last-index)
    (cond ((= current-index (vector-length vec)) ; End of vector reached
           (if (>= first-index 0) ; If the number was found
               (- last-index first-index) ; Return the difference
               -1)) ; If the number was not found, return -1
          ((= (vector-ref vec current-index) x) ; When the current number matches x
           (if (= first-index -1) ; If it's the first occurrence
               (helper vec x (+ current-index 1) current-index current-index) ; Update first and last indices
               (helper vec x (+ current-index 1) first-index current-index))) ; Update last index
          (else 
           (helper vec x (+ current-index 1) first-index last-index)))) 
  (helper vec x 0 -1 -1)) 


(distance-recursive '#(100 22 34 56 22 18 8 22 99 11) 22) ; ==> 6
(distance-recursive '#(5 12 21 34 21 5 89) 34) ; ==> 0
