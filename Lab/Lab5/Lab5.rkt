#lang racket
(define (vector-add vec x)
  (list->vector (append (vector->list vec) (list x))))


(define (vector-remove vec)
  (list->vector (take (vector->list vec) (- (vector-length vec) 1))))


(define (parent index)
  (if (equal? (modulo index 2) 0)
      (quotient (- index 2) 2)
      (quotient (- index 1) 2)))


(define (adjust! vec index)
  (if (equal? index 0)
      vec
      (let* ((pind (parent index))
             (x (vector-ref vec index))
             (p (vector-ref vec pind)))
        (if (> x p)
            (begin
              (vector-set! vec pind x)
              (vector-set! vec index p)
              (adjust! vec pind))
            vec))))


(define (sift-down! vec index)
  (let ((n (vector-length vec)))
    (let loop ((index index))
      (let* ((lch-index (+ 1 (* 2 index))) 
             (rch-index (+ 2 (* 2 index)))   
             (largest index))
       
        (when (and (< lch-index n) (> (vector-ref vec lch-index) (vector-ref vec largest)))
          (set! largest lch-index))
      
        (when (and (< rch-index n) (> (vector-ref vec rch-index) (vector-ref vec largest)))
          (set! largest rch-index))
     
        (when (not (= largest index))
          (let ((temp (vector-ref vec index)))
            (vector-set! vec index (vector-ref vec largest))
            (vector-set! vec largest temp)
            (loop largest)))))))


(define (insert heap value)
  (let* ((new-heap (vector-add heap value))
         (n (vector-length new-heap)))
    (adjust! new-heap (- n 1))
    new-heap))


(define (remove heap)
  (if (<= (vector-length heap) 1)
      (make-vector 0)  
      (let* ((last (vector-ref heap (- (vector-length heap) 1))) 
             (new-heap (vector-copy heap 0 (- (vector-length heap) 1))))  
        (vector-set! new-heap 0 last)  
        (sift-down! new-heap 0) 
        new-heap))) 


(define test-heap (make-vector 0))


(set! test-heap (insert test-heap 10))
(set! test-heap (insert test-heap 20))
(set! test-heap (insert test-heap 5))
(set! test-heap (insert test-heap 2))

(displayln "After inserts: ")
(displayln test-heap)  


(set! test-heap (remove test-heap))
(displayln "After 1st remove: ")
(displayln test-heap)  

(set! test-heap (remove test-heap))
(displayln "After 2nd remove: ")
(displayln test-heap)  

(set! test-heap (remove test-heap))
(displayln "After 3rd remove: ")
(displayln test-heap)  
