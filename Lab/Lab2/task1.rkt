#lang racket
(define (numNotDiv a b d)
  (if (> a b)
      0
      (+ (if (not (= (modulo a d) 0)) 1 0)
         (numNotDiv (+ a 1) b d))))


(numNotDiv 6 12 4); ==> 5