#lang racket
(define (coin-change L amount)
  (if (null? L)
      '()
      (let ((coin (car L)))
        (cons (quotient amount coin)
              (coin-change (cdr L) (modulo amount coin))))))

(coin-change '(100 50 20 10 5) 345)
(coin-change '(16 3 1) 26)