;; Personal (edran) configuration for Spacemacs

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path
   (list (expand-file-name "layers/" dotspacemacs-directory))
   dotspacemacs-configuration-layers
   '(
     graphviz
     ansible
     ;; ---------- editing
     (auto-completion)
     (ibuffer)

     (colors)
     (better-defaults)
     (syntax-checking)
     (spell-checking)
     (evil-snipe) ;; better jumping (f / t)

     ;; ---------- tools
     (semantic)
     (themes-megapack)
     (org)
     (version-control)
     (git)
     (github)
     (shell)
     (restclient)
     (command-log) ;; useful for teaching
     (eyebrowse)
     (ranger)
     ;; TODO checkout elfeed
     ;; TODO install erc
     ;; dash ;; requires zeal installed on OS

     ;; ---------- languages
     (emacs-lisp)
     (ipython-notebook)
     (html)
     (latex)
     (markdown)
     (python)
     (yaml)
     (lua)
     (c-c++)
     (shell-scripts)

     ;; ---------- other
     (games)
     (theming)
     ;; ---------- personal
     (edran)
     ;; (edran-torch)
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '(recents bookmarks projects)
   dotspacemacs-themes '(material)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 11
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t ;; non-default
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize t
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols nil ;; non-default
   dotspacemacs-smooth-scrolling t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server t ;; non-default
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep") ;; TODO remove pt and ack
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  (setq-default
   ;; Magit
   magit-repository-directories '("~/Git/")
   git-magit-status-fullscreen t
   magit-save-repository-buffers 'dontask
   magit-revert-buffers 'silent
   ;; Commit counts for all branches/tags
   magit-refs-show-commit-count 'all

   ;; GitHub
   gh-profile-default-profile "edran"

   ;; Shell
   shell-default-shell 'eshell
   shell-default-height 30
   shell-default-position 'bottom
   shell-enable-smart-eshell t

   ;; Evil
   evil-shift-round nil ;; Don't shift to nearest multiplier

   ;; Whitespace mode
   whitespace-style '(face tabs tab-mark)
   ws-butler-global-mode 1
   ;; Spell checking
   spell-checking-enable-auto-dictionary t

   ;; ibuffer
   ibuffer-group-buffers-by 'projects

   ;; auto-completion
   auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/"
   auto-completion-return-key-behavior 'complete
   auto-completion-tab-key-behavior 'cycle
   auto-completion-enable-help-tooltip t
   auto-completion-enable-sort-by-usage t

   ;; html-mode
   css-indent-offset 2

   ;; latex
   latex-enable-auto-fill t

   ;; vim
   evil-snipe-enable-alternate-f-and-t-behaviors t
   )
  )

(defun dotspacemacs/user-config ()
  (setq powerline-default-separator 'alternate))

;; Use external custom file
(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)
