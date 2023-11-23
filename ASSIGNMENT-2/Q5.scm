#lang racket

; Calls the maxi function.
( define maximum-argument
   ( lambda (f l)
      ( maxi f (car l) l)))

; Finds the argument which has the maximum function value.
( define maxi
   ( lambda (f e l)
      ( cond
         ((empty? l) e)
         ((> (f e) (f (car l))) (maxi f e (cdr l)))
         (else (maxi f (car l) (cdr l))))))
         