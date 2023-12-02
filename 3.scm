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
