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

; 105
(define seconds
  (lambda (l)
    (cond
      ((null? l) (quote ()))
      (else (cons (car (cdr (car l))) (seconds (cdr l)))))))

(print
  (seconds
    (quote ((a b)
            (c d)
            (e f)))))
; (b d f)

; 132, 136, 141
(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else
        (cond
          ((eq? (car lat) old)
             (cons old                ; 141
               (cons new (cdr lat)))) ; 136
          (else (cons (car lat)
                  (insertR new old
                    (cdr lat)))))))))

; 133
(print
  (insertR
    (quote topping)
    (quote fudge)
    (quote (ice cream with fudge for dessert))))
; (ice cream with for dessert)
; 136
; (ice cream with topping for dessert)
; 141
; (ice cream with fudge topping for dessert)

; 145
; (define subst2
;   (lambda (new o1 o2 lat)
;     (cond
;       ((null? lat) (quote ()))
;       (else
;         (cond
;           ((eq? (car lat) o1)
;             (cons new (cdr lat)))
;           ((eq? (car lat) o2)
;             (cons new (cdr lat)))
;           (else (cons (car lat)
;                   (subst2 new o1 o2
;                     (cdr lat)))))))))

; 146
(define subst2
  (lambda (new o1 o2 lat)
    (cond
      ((null? lat) (quote ()))
      (else
        (cond
          (or (eq? (car lat) o1) (eq? (car lat) o2)
            (cons new (cdr lat)))
          (else (cons (car lat)
                  (subst2 new o1 o2
                    (cdr lat)))))))))

(print
  (subst2
    (quote vanilla)
    (quote chocolate)
    (quote banana)
    (quote (banana ice cream with chocolate topping))))
; 145
; (vanilla ice cream with chocolate topping)
; 146
; (vanilla ice cream with chocolate topping)

; 148
(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      (else
        (cond
          ((eq? (car lat) a)
            (multirember a (cdr lat)))
          (else (cons (car lat)
                  (multirember a (cdr lat)))))))))

(print
  (multirember
    (quote cup)
    (quote (coffee cup tea cup and hick cup))))
; (coffee tea and hick)

; 179
(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else
        (cond
          ((eq? (car lat) old)
            (cons old
              (cons new
                (multiinsertR new old (cdr lat)))))
          (else (cons (car lat)
                  (multiinsertR new old (cdr lat)))))))))

(print (multiinsertR
  (quote cream)
  (quote ice)
  (quote (chocolate ice and vanilla ice))))
; (chocolate ice cream and vanilla ice cream)

; 180
#;(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else
        (cond
          ((eq? (car lat) old)
            (cons new
              (cons old
                (multiinsertL new old lat))))
          (else (cons (car lat)
                  (multiinsertL new old (cdr lat)))))))))

#;(print (multiinsertL
  (quote fried)
  (quote fish)
  (quote (chips and fish or fish and fried))))
; TIMEOUT

; 182
(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else
        (cond
          ((eq? (car lat) old)
            (cons new
              (cons old
                (multiinsertL new old (cdr lat)))))
          (else (cons (car lat)
                  (multiinsertL new old (cdr lat)))))))))

(print (multiinsertL
  (quote fried)
  (quote fish)
  (quote (chips and fish or fish and fried))))
; (chips and fried fish or fried fish and fried)
