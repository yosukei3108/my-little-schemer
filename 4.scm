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

; 6
(define add1
  (lambda (n)
    (+ n 1)))

(print
  (add1 67))
; 68

; 8
(define sub1
  (lambda (n)
    (- n 1)))

(print
  (sub1 5))
; 4

; 9
(print
  (zero? 0))
; #t

;12
(define myadd
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (add1 (myadd n (sub1 m)))))))

; 11
(print
  (myadd 46 12))
; 58
