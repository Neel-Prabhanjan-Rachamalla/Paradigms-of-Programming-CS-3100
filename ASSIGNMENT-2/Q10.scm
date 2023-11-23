#lang racket

; Calls the combine function.
( define push-element
   ( lambda (l)
      ( cond
         ((empty? l) '())
         (else (com (push l) l)))))

( define com
   ( lambda (l1 l2)
      ( if (empty? l1)
           '()
           (lis (max-ele l1) (push2 l2)))))

; Finds the maximum associativity of the parenthesis.
( define max-ele
   ( lambda (l)
      ( cond
         ((empty? (cdr l)) (car l))
         (else
          (cond
            ((>= (car l) (max-ele (cdr l))) (car l))
            (else (max-ele (cdr l))))))))

; Listing the max-associativity.
( define lis
   ( lambda (n l)
      ( if (zero? n)
           l
           (lis (- n 1) (list l)))))

; Finds the list of only elements without parenthesis.
( define push2
   ( lambda (l)
      ( if (empty? l)
           '()
           (if (list? (num2 (car l)))
               (append (num2 (car l)) (push2 (cdr l)))
               (cons (num2 (car l)) (push2 (cdr l)))))))


( define num2
   ( lambda (l)
      ( cond
         ((number? l) l)
         ((empty? l) '())
         ((number? (car l)) l)
         (else (num2 (car l))))))
           
( define push
   ( lambda (l)
      ( if (empty? l)
           '()
           (cons (num (car l) 0) (push (cdr l))))))

( define num
   ( lambda (l n)
      ( cond
         ((list? l) (if (empty? l)
                    (+ n 1)
                    (num (car l) (+ n 1))))
         (else n))))
      
           