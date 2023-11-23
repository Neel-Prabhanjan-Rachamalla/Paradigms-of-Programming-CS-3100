#lang racket

; Function to find the element at the ith index of the list.
( define lind
   ( lambda (l i)
      ( if (eq? i 1)
           (car l)
           (lind (cdr l) (- i 1)))))

; Function to find the iteration-space from the compact-iteration-space (triplet) given.
( define iteration-space
   ( lambda (l)
      ( let ((i (lind l 1))
             (n (lind l 2))
             (inc (lind l 3)))
         ( if (> i n)
              '()
              (cons i (iteration-space (list (+ i inc) n inc)))))))

; Makes the iteration-space list and boxes it.
( define make-iterator
   ( lambda (l)
      ( box (iteration-space l))))

; Gives out the first element in the list and update the list to the its tail.
( define next
   ( lambda (l)
      ( if (empty? (unbox l))
           '()
           (let ((e (car (unbox l))))
             (set-box! l (cdr (unbox l)))
             e))))

; Checks if there is an element in the list or not.
( define hasNext
   ( lambda (l)
      ( if (empty? (unbox l))
           #f
           #t)))