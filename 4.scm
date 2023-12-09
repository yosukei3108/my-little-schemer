(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

; 1
(print
  (atom? (quote 14)))
; #t

; 2
(print
  (atom? 14))
; #t

; 3
(print
  (atom? -3))
; #t

; 4
(print
  (atom? 3.1415))
; #t
