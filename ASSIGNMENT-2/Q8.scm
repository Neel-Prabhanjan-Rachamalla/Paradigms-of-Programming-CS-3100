#lang racket

; Makes a setty-list i.e. removes equal adjacent elements.
( define make-setty-list
   ( lambda (l)
      ( cond
         ((empty? l) '())
         ((empty? (cdr l)) l)
         (else (let ((l1 (make-setty-list (cdr l)))
                    (e (car l)))
               (if (equal? e (car l1))
                   l1
                   (cons e l1)))))))

; Concatenates the two setty-lists and make the resulting list into a setty-list.
( define setty-list-union
   ( lambda (l1 l2)
      ( let ((l (append l1 l2)))
         (make-setty-list l))))

; Finding the list-minus of the two lists.
( define setty-list-minus
   ( lambda (l1 l2)
      ( if (empty? l2)
           l1
           (setty-list-minus (rem (car l2) l1) (cdr l2)))))

; Helper function for list-minus.
( define rem
   ( lambda (e l)
      ( cond
         ((empty? l) '())
         ((eq? e (car l)) (cdr l))
         (else (cons (car l) (rem e (cdr l)))))))