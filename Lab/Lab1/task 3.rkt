#lang racket
(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))


(define (power x y)
  (if (= y 0)
      1
      (* x (power x (- y 1)))))


; Challenge
(define (factSum x y)
  ((lambda (a b) (+ (fact a) (fact b))) x y))