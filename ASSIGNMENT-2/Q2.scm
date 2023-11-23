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

; Applying the function f on all the elements of the iteration-space list.
( define for-loop
   ( lambda (f l)
      ( map f (iteration-space l))))