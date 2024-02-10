#lang racket
(define (all-substrings str n)
  (let loop ((i 0) (result '()))
    (if (> i (- (string-length str) n))
        (reverse result)
        (loop (+ i 1) 
              (cons (substring str i (+ i n)) result)))))

(all-substrings "Rahim" 2) ; ==> '(“Ra” “ah” “hi” “im”)
(all-substrings "Green" 6) ; ==> '()
