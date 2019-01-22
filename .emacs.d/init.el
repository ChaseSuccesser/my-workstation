(add-to-list 'load-path "E:/emacs/.emacs.d/ligx-lisp")
(require 'init-package)
(require 'init-ui)
(require 'init-better-default)
(require 'init-extension)
(require 'init-keybinding)

;;快速打开init.el配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "E:/emacs/.emacs.d/init.el"))


(setq custom-file (expand-file-name "ligx-lisp/custom.el" user-emacs-directory))

(load-file custom-file)
