(defconst assembly-packages '(
                              asm-mode
                              ))

(defun assembly/init-asm-mode ()
  (use-package asm-mode
    :config
    (progn
      (add-hook 'asm-mode-hook
                (lambda ()
                  (setq-local tab-width 8)
                  ))
      )))
