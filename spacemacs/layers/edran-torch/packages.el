(setq edran-torch-packages
      '(
        company
        flycheck
        lua-mode
        ))

(defun edran-torch/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'lua-mode-hook))

(defun edran-torch/init-lua-mode ()
  (use-package lua-mode
    :defer t
    :mode ("\\.lua\\'" . lua-mode)
    :interpreter ("lua" . lua-mode)
    :config
    (progn
      (setq lua-indent-level 2
            lua-indent-string-contents t)
      )))

(defun edran-torch/post-init-company ()
  (add-hook 'lua-mode-hook 'company-mode))
