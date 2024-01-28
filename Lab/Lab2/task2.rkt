#lang racket
(define (missing L n)
  (define (missing-helper i)
    (if (> i n)
        '()
        (if (not (member i L))
            (cons i (missing-helper (+ i 1)))
            (missing-helper (+ i 1)))))
   (missing-helper 1))

(missing '(2 4 6 1) 5)
(missing '(1 2 3 4 5 6) 9)