;;禁止备份文件
(setq make-backup-files nil) 
;;选中文字后输入内容进行覆盖，否则只是追加内容
(delete-selection-mode t)
;;取消警告声音
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
;;外部对文件修改后，emacs自动加载
(global-auto-revert-mode t)

;;开启最近文件功能
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;;在org-mode中写的代码有高亮
(require 'org)
(setq org-src-fontify-natively t)

;;org-mode中 代码块中的语法高亮
(setq org-src-fontify-natively t)

;; 鼠标滚轮，把默认滚动改为3行
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)


;;在dired mode下切换文件夹，禁止产生多个buffer
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(show-paren-mode 1)

(provide 'init-better-default)
