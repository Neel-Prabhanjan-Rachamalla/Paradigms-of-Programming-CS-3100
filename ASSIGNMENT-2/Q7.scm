#lang racket

; Calling the fib function with base values.
( define iter-fib
   ( lambda (n)
      (fib '(0 1) n)))

; Function summing the recently calculated values.
( define fib
   ( lambda (l n)
      ( let ((a (car l))
             (b (car (cdr l))))
         ( cond
            ((eq? n 0) a)
            ((eq? n 1) b)
            (else (fib (list b (+ a b)) (- n 1)))))))