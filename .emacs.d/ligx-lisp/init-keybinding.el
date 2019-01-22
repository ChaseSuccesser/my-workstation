(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;为neotree插件绑定快捷键
(global-set-key [f3] 'neotree-toggle)

;;为tabbat插件绑定快捷键
(global-set-key "\M-j" 'tabbar-backward)
(global-set-key "\M-k" 'tabbar-forward)

(provide 'init-keybinding)
