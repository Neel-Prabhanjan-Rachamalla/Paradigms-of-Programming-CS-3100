#lang racket

; Combines the respective indices of the given lists and forms a list.
( define mix
   ( lambda (l1 l2)
      ( map list l1 l2)))

; Applying the map function with list as function on l.
( define unmix
   ( lambda (l)
      ( apply map list l)))