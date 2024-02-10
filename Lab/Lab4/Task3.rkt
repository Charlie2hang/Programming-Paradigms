#lang racket
(define (distance-loop vec x)
  (let loop ((current-index 0) (first-index -1) (last-index -1))
    (if (= current-index (vector-length vec))
        (if (> first-index -1) 
            (- last-index first-index) 
            -1) ; if the number was never found, return a negative number
        (if (= (vector-ref vec current-index) x)
            (if (= first-index -1) 
                (loop (+ current-index 1) current-index current-index) ; set first and last index to current-index
                (loop (+ current-index 1) first-index current-index)) ; update last index
            (loop (+ current-index 1) first-index last-index))))) ; continue looping

(distance-loop '#(100 22 34 56 22 18 8 22 99 11) 22) ; Should return 6
(distance-loop '#(5 12 21 34 21 5 89) 34) ; Should return 0

