(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))

; 7
(print (lat? (quote (bacon and eggs)))) ; #t

; 29
(print (lat? (quote (bacon (and eggs))))) ; #f

; 40
(print (eq? #t else)) ; #f
(print (eq? else #t)) ; #f
(print (eq? #f else)) ; #f
(print (eq? else #f)) ; #f

; 41
(print else) ; #<syntax else>

; 47
(print (or (null? ()) (atom? (d e f g)))) ; #t

; 53
; (define member?
;   (lambda (a lat)
;     (cond
;       ((null? lat) nil)
;       (else (or (eq? (car lat) a)
;               (member? a (cdr lat)))))))

; (print (member? (quote meat) (quote (mashed potetos and meat gravy)))) ; #t
; (print (member? (quote meat) (quote ((mashed potetos) and meat gravy)))) ; #t
; (print (member? (quote meat) (quote (mashed potetos and (meat gravy)))))
; *** ERROR: unbound variable: nil

; replaced nil with #f in member?
(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
              (member? a (cdr lat)))))))

(print (member? (quote meat) (quote (mashed potetos and meat gravy)))) ; #t
(print (member? (quote meat) (quote ((mashed potetos) and meat gravy)))) ; #t
(print (member? (quote meat) (quote (mashed potetos and (meat gravy))))) ; #f
