(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

; 1
(print (atom? (quote atom))) ;#t

; 6
(print (atom? (quote (atom)))) ;#f
