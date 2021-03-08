(defconst nix-packages '(
                         nix-mode
                         ))

(defun nix/init-nix-mode ()
  (use-package nix-mode
    :mode "\\.nix\\'"
    ))
