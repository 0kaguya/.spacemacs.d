;; -*- mode: emacs-lisp; lexical-binding: t -*-

(defun dotspacemacs/layers ()
  (setq-default

   dotspacemacs-distribution 'spacemacs

   dotspacemacs-enable-lazy-installation 'all
   dotspacemacs-ask-for-lazy-installation nil

   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   dotspacemacs-configuration-layers
   '(html
     ;;; checking and completions

     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      ;; auto-completion-enable-help-tooltip t
                      auto-completion-complete-with-key-sequence (kbd "jk")
                      )
     gtags ;; dependency.
     ;; helm
     ivy
     (spell-checking :variables
                     spell-checking-enable-by-default nil
                     enable-flyspell-auto-completion t
                     )
     syntax-checking

     ;;; editor features

     ;; better-defaults
     git

     (lsp :variables
          lsp-rust-server 'rust-analyzer)

     ;; multiple-cursors
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            )
     smex ;; ivy need smex.
     themes-megapack
     treemacs
     version-control

     ;;; languages, or major modes

     agda
     (asm :location local
          :variables
          tab-width 8)
     ;; asm
     (c-c++ :variables
            c-c++-backend 'lsp-clangd
            c-c++-enable-clang-support t)
     (coq :variables
          coq-compile-before-require t
          )
     emacs-lisp
     (erlang :variables
             erlang-man-root-dir "/usr/lib/erlang/man"
             erlang-backend 'lsp)
     (haskell :variables
              haskell-completion-backend 'dante
              ;; haskell-enable-hindent t ;; `hindent' is broken now
              )
     json
     (julia :location local)
     lean
     markdown
     (nix :location local)
     ocaml
     (org :variables
          org-pretty-entities t
          )
     (python :variables
             python-format-on-save t
             python-sort-imports-on-save t
             )
     racket
     ruby
     (rust :variables:
           rust-backend 'lsp)
     ;; Unfortunately geiser does not work well with racket-mode
     ;; (scheme :variables
     ;;         geiser-chez-binary "scheme"
     ;;         geiser-active-implementations '(chez)
     ;;         geiser-mode-start-repl-p t
     ;;         geiser-repl-query-on-kill-p nil
     ;;         geiser-mode-eval-last-sexp-to-buffer t
     ;;         geiser-mode-eval-to-buffer-prefix "\n;;=> "
     ;;         )
     shell-scripts
     (verilog :location local)

     )

   dotspacemacs-additional-packages '(
                                      (bison-mode :location
                                                  (recipe :fetcher
                                                          github
                                                          :repo
                                                          "Wilfred/bison-mode"))
                                      )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(
                                    evil-magit
                                    )
   dotspacemacs-install-packages 'all
   ))

(defun dotspacemacs/init ()
  (setq-default

   dotspacemacs-enable-emacs-pdumper nil
   dotspacemacs-emacs-pdumper-executable-file "emacs-28.0.50"
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   dotspacemacs-use-spacelpa t
   dotspacemacs-verify-spacelpa-archives nil

   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 3
   dotspacemacs-elpa-subdirectory 'emacs-version

   dotspacemacs-gc-cons '(100000000 0.1)

   dotspacemacs-editing-style 'hybrid

   dotspacemacs-check-for-update nil
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists nil
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-loading-progress-bar nil

   dotspacemacs-themes '(
                         wheatgrass
                         ;; kaolin-valley-light ;; great but not for transparent
                         spacemacs-light
                         )
   dotspacemacs-mode-line-theme '(vanilla)
   dotspacemacs-colorize-cursor-according-to-state nil
   dotspacemacs-default-font '("Monaco"
                               :size 20
                               :weight normal
                               :width normal)

   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-initial-scratch-message nil

   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil

   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil

   dotspacemacs-large-file-size 1

   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   dotspacemacs-which-key-delay 0.3
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil


   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil

   dotspacemacs-active-transparency 70
   dotspacemacs-inactive-transparency 70
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   dotspacemacs-mode-line-unicode-symbols t

   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil

   dotspacemacs-folding-method 'evil

   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all

   dotspacemacs-enable-server t
   dotspacemacs-server-socket-dir nil
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil

   dotspacemacs-whitespace-cleanup nil

   dotspacemacs-zone-out-when-idle nil

   dotspacemacs-pretty-docs t
   ))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()

   ;; configure mirror server
   ;; (setq configuration-layer-elpa-archives
   ;;      '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
   ;;        ("melpa-stable" . "https://mirrors.tuna.tsinghua.edu.cn/melpa-stable/")
   ;;        ("org"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
   ;;        ("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))

   ;; don't warn some deprecated packages.
   ;; `cl' is deprecated after emacs 27 because`cl-lib' is a better alt.
   (setq byte-compile-warnings '(cl-functions))

   ;; avoid auto-generated settings to write into this file.
   (setq custom-file "~/.emacs.d/.cache/.custom-settings")
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()

  (add-hook 'org-mode-hook
            (lambda ()
              ;; recommended shortkeys by org-mode.
              (local-set-key "\C-cb" 'org-switchb)
              ;; always wrap lines in org-mode.
              (spacemacs/toggle-truncate-lines-off)))

  ;; modifying some ex-commands.
  (evil-ex-define-cmd "q" 'spacemacs/kill-this-buffer)
  (evil-ex-define-cmd "wq" 'evil-save-and-close)
  (evil-ex-define-cmd "qa" 'spacemacs/kill-emacs)

  ;; remove prettify symbols mode from coq mode
  ;; (with-eval-after-load 'company-coq
  ;;   (add-to-list 'company-coq-disabled-features 'prettify-symbols))

  ;; UI Setting

  ;; disable line hightlighting
  (spacemacs/toggle-highlight-current-line-globally-off)

  ;; enable transparency
  (spacemacs/toggle-transparency)
  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (spacemacs/toggle-transparency frame)))
  )
;; generated config located at ~/.emacs.d/.cache/.custom-settings
