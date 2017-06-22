(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages (quote (auto-complete rust-mode fiplr helm use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq next-screen-context-lines 2)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package helm
  :ensure t)

(use-package fiplr
  :ensure t)

(use-package rust-mode
  :ensure t)

(use-package cider
  :ensure t)

(use-package neotree
  :ensure t)

(use-package monokai-theme
  :ensure t)

(load-theme 'monokai t)

(use-package auto-complete
  :ensure t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(add-hook 'emacs-lisp-mode-hook
  (lambda ()
    (setq tab-width 2)))

(global-set-key (kbd "C-x f") 'fiplr-find-file)

(setq fiplr-ignored-globs '((directories (".git" ".svn" "target" ".vagrant"))
                            (files ("*.log" "*.jpg" "*.png" "*.zip" "*~"))))

(global-linum-mode t)

(setq-default c-basic-offset 4)

(show-paren-mode 1)
