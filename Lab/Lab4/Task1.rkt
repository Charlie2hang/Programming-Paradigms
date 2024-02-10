#lang racket
(define (rotate vec m)
  (let* ((len (vector-length vec))
         (shift (modulo m len))
         (part1 (vector-copy vec (- len shift) len))
         (part2 (vector-copy vec 0 (- len shift))))
    (vector-append part1 part2)))


(rotate '#(10 20 30 40 50 60) 1)
(rotate '#(22 18 10 11 6) 3)