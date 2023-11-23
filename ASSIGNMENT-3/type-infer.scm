#lang racket/load

(require rnrs/mutable-pairs-6)
(require "recscm.scm")
(require "records.scm")
(require "tree.scm")
;A partial implementation of the interpreter discussed in the class
;Covers identifier, true/false, plusExpr and IfExpr

(define-record normal-env (ids vals env))
(define-record rec-env (recdecl-list env))

(define make-cell
  (lambda (value)
    (cons '*cell value)))

(define deref-cell cdr)

(define set-cell! set-cdr!)

(define empty-env
  (lambda () '()))

(define extend-env
  (lambda (id val env)
    (cons (mcons id val) env)))

(define apply-env
  (lambda (env id)
    (if (or (null? env) (null? id))
        null
        (let ((key (mcar (car env)))
              (val (mcdr (car env)))
              (env-prime (cdr env)))
          (if (eq? id key) val (apply-env env-prime id))))))

(define extend-env-list
  (lambda (ids vals env)
    (if (null? ids)
        env
        (extend-env-list
         (cdr ids)
         (cdr vals)
         (extend-env (car ids) (car vals) env)))))

(define get-ids
   (lambda (l)
     (map cadr (map car l))))

(define get-exprs
   (lambda (l)
     (map cadr l)))

(define get-declarations
  (lambda (l env)
    (if (empty? l)
        '()
        (cons (eval-Expression (car l) env) (get-declarations (cdr l) env)))))

(define add-to-env (lambda (id val env) (if(equal? id (mcar (car env))) (let ((x (set-mcdr! (car env) val))) env)
                                           (cons (car env) (add-to-env id val (cdr env))))))

(define get-recdeclarations
  (lambda (l env)
    (if (empty? l)
        '()
        (let ((dec (eval-Expression (car l) env)))
          (cons dec (get-recdeclarations (cdr l) (extend-env (car dec) (cadr dec) env)))))))

(define get-formals
  (lambda (l)
      (map cadr (car l))))

(define eval-Expression
	(lambda (Expression env) 
		(record-case Expression
                             (IntegerLiteral (Token) (string->number Token))
                             (TrueLiteral (Token) #t)
                             (FalseLiteral (Token) #f)
                             (PlusExpression (Token1 Token2 Expression1 Expression2 Token3)
                                             (+ (eval-Expression Expression1 env) (eval-Expression Expression2 env)))
                             (IfExpression (Token1 Token2 Expression1 Expression2 Expression3 Token3)
                                           (if (eval-Expression Expression1 env) (eval-Expression Expression2 env) (eval-Expression Expression3 env)))
                             (LetExpression (Token1 Token2 Token3 Lis Token4 Expression Token5)
                                            (let* ((List (get-declarations Lis env))
                                                   (ids (get-ids List))
                                                   (exps (get-exprs List))
                                                   (vals (map (lambda (Expression)
                                                                (eval-Expression Expression env)) exps))
                                                   (new-env (extend-env-list ids vals env)))
                                              (eval-Expression Expression new-env)))
                             (Identifier (Token) (apply-env env Token))
                             (ProcedureExp (Token1 Token2 Token3
                                                   List Token4 Expression Token5)
                                           (list List Expression env))
                             (Application (Token1 Expression List Token2)
                                          (let*
                                              ((clos (eval-Expression Expression env))
                                               (ids (get-formals clos))
                                               (vals (map (lambda (Exp)
                                                            (eval-Expression Exp env)) List))
                                               (static-env (caddr clos))
                                               (new-env
                                                (extend-env-list ids vals static-env))
                                            (body (cadr clos)))
                                            (eval-Expression body new-env)))
                             (Assignment (Token1 Token2 Identifier  Expression Token3)
                                         (let* ((id (cadr Identifier)) (val (eval-Expression Expression env)) (new-env (add-to-env id val env)))
                                           (set! env new-env)))
                             (RecExpression (Token1 Token2 Token3 Lis Token4 Expression Token5)
                                            (let* ((List (get-recdeclarations Lis env))
                                                   (ids (get-ids List))
                                                   (exps (get-exprs List))
                                                   (vals (map (lambda (Expression)
                                                                (eval-Expression Expression env)) exps))
                                                   (new-env (extend-env-list ids vals env)))
                                              (eval-Expression Expression new-env)))
                             (Declaration (Token1 Identifier Expression Token2)
                                          (list Identifier Expression))
                             (RecDeclaration (Token1 Identifier Expression Token2)
                                          (list Identifier Expression))
                             (else (error 'eval-Expression "Expression not found")))))

(define run
  (lambda ()
    (record-case root
                 (Goal (Expression Token)
                       (display "Type Error"))
                 (else (error 'run "Goal not found")))))