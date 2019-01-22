(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar ligx/packages '(
			;;自动补全
			company
			monokai-theme
			ensime
			neotree
			auto-yasnippet
			magit
			tabbar
			elpy
			flycheck
			py-autopep8
			smooth-scroll
            rainbow-delimiters
			) "Default packages")

(setq package-selected-packages ligx/packages)

(defun ligx/packages-installed-p ()
  (loop for pkg in ligx/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (ligx/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg ligx/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;激活company, 开启全局company补全
(global-company-mode t)

;;加载monkai主题
(load-theme 'monokai t)

;;配置ensime
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;配置neotree
(require 'neotree)

;;激活yasnippet
(require 'yasnippet)
(add-hook 'prog-mode-hook #'yas-minor-mode)
;; 指定ynsnippet模版的位置
(setq yas/root-directory "~/.emacs.d/snippets")
(yas/load-directory yas/root-directory)

;;激活magit
(require 'magit)

;;配置elpy插件，搭建python环境
(require 'elpy)  
(elpy-enable)
;; 让elpy使用jedi。这样，输入dot操作符就可以自动提示了
(setq elpy-rpc-backend "jedi") 

;;配置flycheck语法检查, 为python mode添加更好的语法检查
;;(add-hook 'after-init-hook 'global-flycheck-mode) ;;全局开启
;;关闭flymake，使用flycheck
;;(when (require 'flycheck)
;;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;为python mode添加PEP8格式化
;;(require 'py-autopep8)
;;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;;配置smooth-scrolling插件 滚动条平缓滚动
(require 'smooth-scroll)
(smooth-scroll-mode 1)

;; 使用rainbow-delimiters插件
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


(provide 'init-package)
