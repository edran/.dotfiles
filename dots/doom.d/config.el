;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;;; deets
(setq user-full-name "Nantas Nardelli"
      user-mail-address "nantas.nardelli@gmail.com"

      org-directory "~/org"
      projectile-project-search-path '("~/lab")  ;; this is not recursive, sadly
      magit-repository-directories '(("~/lab" . 2)))

;;;; env
(doom-load-envvars-file
 (cond ((string= (system-name) "empiricist")
        (concat (file-name-as-directory doom-private-dir) "env_empiricist"))
       ;; NOTE: Uncommenting the following lines, since I should probably be
       ;; running `doom env' here instead.
       ;; (IS-MAC (concat (file-name-as-directory doom-private-dir) "env_macos"))
       ;; (IS-LINUX (concat (file-name-as-directory doom-private-dir) "env_linux"))
       (t doom-env-file))) ;; default


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

      ;; isearch
      isearch-lazy-count t
      isearch-allow-scroll 'unlimited

      ;; magit
      magit-save-repository-buffers 'dontask
      ;; Don't restore window config after quitting magit
      magit-inhibit-save-previous-winconf t)

(add-to-list 'ispell-skip-region-alist '(org-property-drawer-re))
(add-to-list 'ispell-skip-region-alist '("~" "~"))
(add-to-list 'ispell-skip-region-alist '("=" "="))

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
