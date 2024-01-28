#lang racket
(define PI 3.1415)

; case 1
(+ (expt (sin PI) 2) (expt (cos PI) 2))
(+ (expt (sin (/ PI 4)) 2) (expt (cos (/ PI 4)) 2))
(+ (expt (sin (/ PI 2)) 2) (expt (cos (/ PI 2)) 2))
(newline)

; case 2
(sin (* PI 2))
(* (sin PI) 2 (cos PI))
(newline)

(sin (* (/ PI 2) 2))
(* (sin (/ PI 2)) 2 (cos(/ PI 2)))
(newline)

(sin (* (/ PI 4) 2))
(* (sin (/ PI 4)) 2 (cos(/ PI 4)))
(newline)

; case 3
(cos (* PI 2))
(- (expt (cos PI) 2) (expt (sin PI) 2))
(newline)

(cos (* (/ PI 2) 2))
(- (expt (cos (/ PI 2)) 2) (expt (sin (/ PI 2)) 2))
(newline)

(cos (* (/ PI 4) 2))
(- (expt (cos (/ PI 4)) 2) (expt (sin (/ PI 4)) 2))
(newline)