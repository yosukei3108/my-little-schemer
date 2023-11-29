(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

; 1
(print (atom? (quote atom))) ;#t

; 6
(print (atom? (quote (atom)))) ;#f

;23
(print (car ())) ; *** ERROR: pair required, but got ()
