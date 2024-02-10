#lang racket
(define (first-unique L)
  (letrec ((is-unique (lambda (item lst)    ;helper
                        (cond ((null? lst) #t)
                              ((equal? item (car lst)) #f)
                              (else (is-unique item (cdr lst))))))
           (find-unique (lambda (lst)
                          (cond ((null? lst) 0)
                                ((is-unique (car lst) (cdr lst)) (car lst))
                                (else (find-unique (cdr lst)))))))
    (find-unique L)))



(first-unique '(18 22 17 19 21 18 17))