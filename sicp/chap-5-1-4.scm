;;;; Using a Stack to Implement Recursion

;;; Iterative process example : gcd
;; For iterative process, The machine repeatedly executes a controller loop, changing
;; the contents of the registers, until some termination condition is satisfied.

;; To compute GCD process repeatedly, simply place the new arguments in the input
;; registers of the GCD machine and reuse the machine’s data paths by executing the
;; same controller sequence. 


;;; Recursive process example : factorial
;; Although the factorial process dictates that an unbounded number of copies of the
;; same machine are needed to perform a computation, only one of these copies needs
;; to be active at any given time. When the machine encounters a recursive subproblem,
;; it can suspend work on the main problem, reuse the same physical parts to work on
;; the subproblem, then continue the suspended computation.

;; In order to be able to continue the suspended computation, the machine must save
;; the contents of any registers that will be needed after the subproblem is solved
;; so that these can be restored to continue the suspended computation.

;; Why stack?
;; Register values must be restored in the reverse of the order in which they were
;; saved, since in a nest of recursions the last subproblem to be entered is the
;; first to be finished.
;; Stack uses two instructions
;; 1. save : Values are placed on the stack using this.
;; 2. restore : and restored from the stack using this.
;; * note : the orders of save and restore are reverse each other.

;; It uses stack. Therefore, after solving the (n−1)! subproblem the machine must
;; still multiply the result by n. For this, It uses a continue register to
;; transfer to the part of the sequence that solves a subproblem and then continue
;; where it left off on the main problem.
;; cf. assembly code : https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-31.html#%_fig_5.11
(controller
 (assign continue (label fact-done))     ; set up final return address
 fact-loop
 (test (op =) (reg n) (const 1))
 (branch (label base-case))
 ;; Set up for the recursive call by saving n and continue.
 ;; Set up continue so that the computation will continue
 ;; at after-fact when the subroutine returns.
 (save continue)
 (save n)
 (assign n (op -) (reg n) (const 1))
 (assign continue (label after-fact))
 (goto (label fact-loop))
 after-fact
 (restore n)
 (restore continue)
 (assign val (op *) (reg n) (reg val))   ; val now contains n(n - 1)!
 (goto (reg continue))                   ; return to caller
 base-case
 (assign val (const 1))                  ; base case: 1! = 1
 (goto (reg continue))                   ; return to caller
 fact-done)

;; * Take note (save n) and (restore n)

