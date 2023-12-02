(define rember_before70
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      (else (cond
              ((eq? (car lat) a) (cdr lat))
              (else (cons (car lat)
                (rember a (cdr lat)))))))))

; 70
(define rember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) a) (cdr lat))
      (else (cons (car lat)
              (rember a (cdr lat)))))))

; 17
(print (rember (quote bacon) (quote (bacon lettuce and tomato))))
; (lettuce and tomato)

; 27
(print (rember (quote and) (quote (bacon lettuce and tomato))))
; (tomato)
; with 44
; (bacon lettuce tomato)

; 55
(print (rember (quote and) (quote (and tomato))))
; (tomato)

; 63
(print (rember (quote and) (quote (lettuce and tomato))))
; (lettuce tomate)
(print (car (quote (lettuce and tomato))))
; lettuce
(print (cons (quote lettuce) (cdr (quote (and tomato)))))
; (lettuce tomato)

; 87
(print (rember (quote sauce) (quote (soy sauce and tomato sauce))))
; (soy and tomato sauce)

; 94
(define firsts
  (lambda (l)
    (cond
      ((null? l) (quote ()))
      (else (cons (car (car l)) (firsts (cdr l)))))))

; 88
(print
  (firsts
    (quote ((apple peach pumpkin)
            (plum pear cherry)
            (grape raisin pea)
            (bean carrot eggplant)))))
; (apple plum grape bean)

; 89
(print
  (firsts
    (quote ((a b) (c d) (e f)))))
; (a c e)

; 90
(print
  (firsts
    (quote ())))
; ()

; 92
(print
  (firsts
    (quote (((five plums) four)
            (eleven green oranges)
            ((no) more)))))
; ((five plums) eleven (no))
