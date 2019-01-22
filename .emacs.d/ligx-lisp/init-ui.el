;;关闭tool-bar
(tool-bar-mode -1)  
;;关闭滚动条
;;(scroll-bar-mode -1)
;;关闭启动帮助画面
(setq inhibit-splash-screen t)
;;修改光标样式
(setq-default cursor-type 'bar)
;;显示行号 
(global-linum-mode t)
;;当前行高亮显示
(global-hl-line-mode t)
;;打开emacs时全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;匹配括号
;;(add-hook 'emacs-lisp-mode-hook 'show-parent-mode)

;;为Emacs添加tabbar功能
(require 'tabbar)
(tabbar-mode 1)

;; org-mode模式下自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(provide 'init-ui)
