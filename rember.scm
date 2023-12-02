; (define rember
;   (lambda (a lat)
;     (cond
;       ((null? lat) (quote ()))
;       (else (cond
;               ((eq? (car lat) a) (cdr lat))
;               (else (rember a (cdr lat))))))))

; 3-44
; (define rember
;   (lambda (a lat)
;     (cond
;       ((null? lat) (quote ()))
;       (else (cond
;               ((eq? (car lat) a) (cdr lat))
;               (else (cons (car lat)
;                 (rember a (cdr lat)))))))))

; 3-70
(define rember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) a) (cdr lat))
      (else (cons (car lat)
              (rember a (cdr lat)))))))
