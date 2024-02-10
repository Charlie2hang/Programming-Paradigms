#lang racket
(define (reverse-string str)
  (letrec ((reverse-list (lambda (lst)
                           (if (null? lst)
                               lst
                               (append (reverse-list (cdr lst)) (list (car lst)))))))
    (list->string (reverse-list (string->list str)))))


(reverse-string "ABC")