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
; () は (quote ()) と同じ？？
(print (cons (quote a) (quote()))) ; (a)

; 44
(print (cons (quote ((a b c))) (quote b))) ; (((a b c)) . b) ; 脚注 5

; 45
(print (cons (quote a) (quote b))) ; (a . b) ; 脚注 5

; 49
(print (null? (quote ()))) ; #t
(print (null? '())) ; #t
(print (null? ())) ; #t

; 51
(print (null? (quote spaghetti))) ; #f ; 脚注 8

; 62
(print (eq? (quote Harry) (quote Harry))) ; #t

; 65
(print (eq? (quote ()) (quote (strawberry)))) ; #f ; 脚注 11

; 66
(print (eq? 6 7)) ; #f ; 脚注 12

; 68
(print (eq? (cdr (quote (soured milk))) (quote milk))) ; #f ; 脚注 11
