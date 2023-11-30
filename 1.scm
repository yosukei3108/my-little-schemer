(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

; 1
(print (atom? (quote atom))) ;#t

; 6
(print (atom? (quote (atom)))) ;#f

; 23
; (print (car ())) ; *** ERROR: pair required, but got ()

; 39
(print
  (cons
    (quote
      ((help) this))
    (quote
      (is very ((hard) to learn))))) ; (((help) this) is very ((hard) to learn))

; 42
(print (cons (quote a) ())) ; (a)

; 44
(print (cons (quote a) (quote b))) ; (a . b) ; 脚注 5
