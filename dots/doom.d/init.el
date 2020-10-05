;;; init.el -*- lexical-binding: t; -*-


(doom!
       :completion
       company
       (ivy
        +fuzzy
        +prescient)

       :ui
       deft
       doom
       doom-dashboard
       hl-todo
       indent-guides     ; this is quite costly...
       modeline
       ;; nav-flash
       ophints
       (popup
        +defaults)
       vc-gutter
       vi-tilde-fringe
       ;; window-select
       workspaces
       ;; zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       ;;format              ; disabled until rewrite
       multiple-cursors
       ;;parinfer
       rotate-text       ; this is cooler than it sounds
       snippets

       :emacs
       dired
       electric
       undo
       vc

       :term
       eshell

       :checkers
       syntax
       spell

       :tools
       ansible
       biblio
       debugger
       direnv
       docker
       ;;ein
       (eval +overlay)
       (lookup
        +dictionary
        +docsets)
       lsp
       magit
       pdf
       tmux

       :os
       (:if IS-MAC macos)
       ;;tty

       :lang
       (cc +lsp)
       common-lisp
       data
       emacs-lisp
       (javascript +lsp)
       json
       julia
       latex
       markdown
       nix
       (org
        +dragndrop
        +journal
        +jupyter
        +present
        +roam)
       (python
        +lsp
        +conda)
       rest
       rst
       (rust +lsp)
       sh
       web
       yaml

       :config
       literate
       (default +bindings +smartparens))
