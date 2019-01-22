;;json格式化
(defun json ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
    )
  )


;;对当前整个文件进行格式化缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))


;;M-x  gshell启动 gbk 编码的shell
(defun gshell()
  (interactive)
  (let ((coding-system-for-read 'chinese-gbk)
	(coding-system-for-write 'chinese-gbk))
    (call-interactively (shell))))
;; M-x  ushell启动 utf-8编码的shell
(defun ushell()
  (interactive)
  (let ((coding-system-for-read 'utf-8-unix)
	(coding-system-for-write 'utf-8-unix))
    (call-interactively (shell))))


;;在新窗口创建buffer
(defun new-buffer ()
  (interactive)
  (let ((new-buffer-name (read-from-minibuffer "Enter new buffer name:")))
    (switch-to-buffer-other-window new-buffer-name)
    (other-window 1)
    )
  )


;;高亮选中文字
(defun highlight-selected ()
  (interactive)
  (let ((word (if mark-active
		  (buffer-substring-no-properties (region-beginning) (region-end))
		(current-word nil t))))
    (highlight-phrase word "hi-green")))

(provide 'init-extension)
