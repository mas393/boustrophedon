;; center justify all lines of text
;; fix the recursion depth issue (max-lisp-eval-depth)
;; make a live version such that text appears backwards
;; create a font that has flipped letters

(defun boustrophedon (&optional n)
  "reading as the ox ploughs"
  (interactive)
  (progn
    (if n
	()
      (setq n 0))
    (if (eq (next-line) "End of buffer")
	()
      (if (eq (mod n 2) 1)
	  (progn
	    (previous-line)
	    (let ((beg (point)))
	      (next-line)
	      (kill-region beg (point)))
	    (let ((l (reverse(current-kill 0))))
	      (insert (concat (substring l 1) (substring l 0 1))))
	    (boustrophedon 0))
	(progn
	  (boustrophedon 1)
	  )))))
