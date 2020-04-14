;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;;; deets
(setq user-full-name "Nantas Nardelli"
      user-mail-address "nantas.nardelli@gmail.com"

      org-directory "~/org"
      projectile-project-search-path '("~/lab")  ;; this is not recursive, sadly
      magit-repository-directories '(("~/lab" . 2))
      )

;;;; UI
(setq doom-theme 'doom-dracula
      doom-font (font-spec :family "monospace" :size 12)
      ;; doom-variable-pitch-font
      ;; doom-big-font

      ;; To be re-enabled when I get a better machine.
      display-line-numbers-type nil)

;;;; UX
(setq doom-scratch-initial-major-mode 'lisp-interaction-mode

      ;; Switch to new window when splitting
      evil-split-window-below t
      evil-vsplit-window-right t

      ;; magit
      magit-save-repository-buffers 'dontask
      ;; Don't restore window config after quitting magit
      magit-inhibit-save-previous-winconf t
      )

;;;; langs
;;;; org
(setq org-archive-location (concat
                            (file-name-as-directory org-directory)
                            ".archive/%s::")
      org-roam-directory (concat
                          (file-name-as-directory org-directory)
                          "notes/")
      org-ellipsis " ▼ "
      org-bullets-bullet-list '("☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷" "☷" "☷" "☷"))

;;;; python
(setq conda-anaconda-home "~/.conda")
