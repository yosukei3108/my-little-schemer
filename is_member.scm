(define member?
  (lambda (a lat)
    (cond
      ((null? lat) nil)
      (else (or (eq? (car lat) a)
              (member? a (cdr lat)))))))
