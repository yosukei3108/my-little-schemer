(define rember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      (else (cond
              ((eq? (car lat) a) (cdr lat))
              (else (cons (car lat)
                (rember a (cdr lat)))))))))

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

; 62
(print (rember (quote and) (quote (lettuce and tomato))))
; (lettuce tomate)
(print (car (quote (lettuce and tomato))))
; lettuce
(print (cons (quote lettuce) (cdr (quote (and tomato)))))
; (lettuce tomato)
