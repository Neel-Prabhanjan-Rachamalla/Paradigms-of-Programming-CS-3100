#lang racket

; Creates a symbol table.
( define create-symbol-table
   ( lambda (l) l))

; Checks for the most recent declaration of the given element in the list.
( define lookup
   ( lambda (l e)
      ( cond
         ((empty? l) '())
         ((equal? (car (car l)) e) (car (cdr (car l)))) 
         (else (lookup (cdr l) e)))))

; Updates the symbol table by appending with the given list.
( define extend-symbol-table
   ( lambda (l1 l2)
      ( append l2 l1)))