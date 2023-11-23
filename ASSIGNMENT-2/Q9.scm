#lang racket

; Calls the eqgroup function with initially empty list.
( define eqGroupify
  ( lambda (f l)
     ( eqgroup f l '())))

; Calls the put function on first element of l to insert into the final list appropriately.
( define eqgroup
   ( lambda (f l l1)
      ( cond
         ((empty? l) l1)
         (else (eqgroup f (cdr l) (put f (car l) l1))))))

; Puts the element at the appropriate position in the list.
( define put
   ( lambda (f e l)
      ( cond
         ((empty? l) (list (list e)))
         ((f e (car (car l))) (cons (append (car l) (list e)) (cdr l)))
         (else (cons (car l) (put f e (cdr l)))))))