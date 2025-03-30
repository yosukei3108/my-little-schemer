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

; 18
(define mysub
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (sub1 (mysub n (sub1 m)))))))

; 15
(print
  (mysub 14 3))
; 11

; 17
(print
  (mysub 18 25))
; -7

; 50
(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (myadd (car tup) (addtup (cdr tup)))))))

; 25
(print (addtup (quote(3 5 2 8))))
; 18

; 57
(define myprod
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else (myadd n (myprod n (sub1 m)))))))

; 51
(print (myprod 5 3))
; 15

; 52
(print (myprod 13 4))
; 52
