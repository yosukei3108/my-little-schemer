(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

; 1
(print (atom? (quote atom))) ;#t

; 6
(print (atom? (quote (atom)))) ;#f

; 23
; (print (car ())) ; *** ERROR: pair required, but got ()

; 40
(print
  (cons
    (quote
      ((help) this))
    (quote
      (is very ((hard) to learn))))) ; ((((help) this)) (is very ((hard) to learn)))

; 43
(print (cons (quote a) ())) ; (a)

; 44
(print (cons (quote ((a b c))) (quote b))) ; (((a b c)) . b) ; 脚注 5

; 45
(print (cons (quote a) (quote b))) ; (a . b) ; 脚注 5

; 51
(print (null? (quote spaghetti))) ; #f ; 脚注 8
