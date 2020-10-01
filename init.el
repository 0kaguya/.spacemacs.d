;; -*- mode: emacs-lisp; lexical-binding: t -*-

(defun dotspacemacs/layers ()
  (setq-default

   dotspacemacs-distribution 'spacemacs

   dotspacemacs-enable-lazy-installation 'all
   dotspacemacs-ask-for-lazy-installation t

   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   dotspacemacs-configuration-layers
   '(
     ;; languages, or major modes

     agda
     assembly
     c-c++
     (coq :variables
          coq-compile-before-require t
          )
     emacs-lisp
     erlang
     (haskell :variables
              haskell-completion-backend 'dante
              haskell-enable-hindent t
              )
     json
     lean
     markdown
     org
     racket
     ruby
     rust
     (scheme :variables
             geiser-chez-binary "scheme"
             geiser-active-implementations '(chez)
             geiser-mode-start-repl-p t
             geiser-repl-query-on-kill-p nil
             geiser-mode-eval-last-sexp-to-buffer t
             geiser-mode-eval-to-buffer-prefix "\n;;=> "
             )

     ;; checking and completions

     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      ;; auto-completion-enable-help-tooltip t
                      auto-completion-complete-with-key-sequence (kbd "jk")
                      )
     helm
     (spell-checking :variables
                     spell-checking-enable-by-default nil
                     enable-flyspell-auto-completion t
                     )
     syntax-checking

     ;; editor features

     ;; better-defaults
     git
     ;; multiple-cursors
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            )
     themes-megapack
     treemacs
     version-control
     )

   dotspacemacs-additional-packages '(
                                      )
   dotspacemacs-frozen-packages '(
                                  )
   dotspacemacs-excluded-packages '(
                                    )
   dotspacemacs-install-packages 'used-only
   ))

(defun dotspacemacs/init ()
  (setq-default

   dotspacemacs-enable-emacs-pdumper nil
   dotspacemacs-emacs-pdumper-executable-file "emacs-28.0.50"
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 3

   dotspacemacs-gc-cons '(100000000 0.1)

   dotspacemacs-use-spacelpa nil
   dotspacemacs-verify-spacelpa-archives nil

   dotspacemacs-check-for-update nil

   dotspacemacs-elpa-subdirectory 'emacs-version

   dotspacemacs-editing-style 'hybrid

   dotspacemacs-verbose-loading nil

   dotspacemacs-startup-banner nil

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-initial-scratch-message nil

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

   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
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

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   dotspacemacs-loading-progress-bar nil

   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil

   dotspacemacs-active-transparency 70
   dotspacemacs-inactive-transparency 60
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   dotspacemacs-line-numbers nil

   dotspacemacs-folding-method 'evil

   dotspacemacs-smartparens-strict-mode nil

   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
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
   (setq configuration-layer-elpa-archives
        '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ("melpa-stable" . "https://mirrors.tuna.tsinghua.edu.cn/melpa-stable/")
          ("org"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
          ("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))

   ;; don't warn some deprecated packages.
   ;; `cl' is deprecated after emacs 27 because`cl-lib' is a better alt.
   (setq byte-compile-warnings '(cl-functions))
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()

  ;; recommended shortkeys by org-mode.
  (with-eval-after-load 'org
    (local-set-key "\C-cb" 'org-switchb))

  ;; modifying some ex-commands.
  (evil-ex-define-cmd "q" 'spacemacs/kill-this-buffer)
  (evil-ex-define-cmd "wq" 'evil-save-and-close)
  (evil-ex-define-cmd "qa" 'spacemacs/kill-emacs)

  ;; remove prettify symbols mode from coq mode
  ;; (with-eval-after-load 'company-coq
  ;;   (add-to-list 'company-coq-disabled-features 'prettify-symbols))

  ;; disable line hightlighting
  (spacemacs/toggle-highlight-current-line-globally-off)

  ;; enable transparency
  (spacemacs/toggle-transparency)
  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (spacemacs/toggle-transparency frame)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(lean-mode ansi package-build shut-up epl git commander f dash s flycheck-elsa lsp-haskell lsp-mode markdown-mode dash-functional intero hlint-refactor hindent helm-hoogle haskell-snippets dante lcr company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl browse-at-remote smeargle helm-gitignore helm-git-grep gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode transient git-messenger git-link git-commit with-editor geiser yasnippet-snippets xterm-color shell-pop multi-term helm-company helm-c-yasnippet fuzzy eshell-z eshell-prompt-extras esh-help company-statistics company-coq company-math math-symbol-lists company auto-yasnippet yasnippet ac-ispell auto-complete proof-general treemacs-evil ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile toc-org symon string-inflection spaceline-all-the-icons restart-emacs request rainbow-delimiters popwin persp-mode pcre2el password-generator paradox overseer org-plus-contrib org-bullets open-junk-file nameless move-text macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio font-lock+ flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline diminish define-word counsel-projectile column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile aggressive-indent ace-link ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
