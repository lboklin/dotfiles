;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(clojure
     html
     python
     elm
     fsharp
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     themes-megapack
     imenu-list
     version-control
     syntax-checking
     (git :variables
          git-enable-github-support t)
     (auto-completion :variables
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-private-snippets-directory nil
                      auto-complete-mode t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-time 0.4
                      auto-completion-shadowed-hybrid-binding t
                      auto-completion-enable-sort-by-usage t
                      )
     ;; Major modes
     nixos
     yaml
     helm
     markdown
     org
     emacs-lisp
     (csharp :variables
             yas--direct-csharp-mode t
             )
     ;; haskell
     (haskell :variables
              haskell-completion-backend 'intero
              haskell-check-command 'hlint)
     (shell :variables
            shell-default-height 30
            shell-default-term-shell "eshell"
            shell-default-position 'bottom)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(pretty-mode)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   ;; dotspacemacs-excluded-packages '(exec-path-from-shell)
   ;; dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   ;; powerline-default-separator 'utf-8
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         material-light
                         sanityinc-tomorrow-night
                         misterioso
                         niflheim
                         wombat
                         twilight-anti-bright
                         sanityinc-tomorrow-night
                         gruvbox
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("DejaVu Sans Mono for Powerline"
   ;; ;; dotspacemacs-default-font '("Hack"
   ;; dotspacemacs-default-font '("Source Code Pro"
   dotspacemacs-default-font '("Hack"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize t
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'source
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 95
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers 't
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all
   )
  ;; (when (and (display-graphic-p) (eq system-type 'gnu/linux))
  ;;  (with-eval-after-load 'exec-path-from-shell
  ;;   (exec-path-from-shell-setenv "SHELL" "/bin/bash")))
  )

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

;; -- Y
(defun find-file-in-split ()
  "Split the windows and start projectile find file"
  (interactive)
  (split-window-below-and-focus)
  (projectile-find-file))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (add-to-list 'exec-path "~/.local/bin")
  (setq-default
   powerline-default-separator (quote utf-8)
   indent-tabs-mode nil
   tab-width 4
   evil-shift-width 4
   evil-escape-key-sequence "gq"
   show-trailing-whitespace nil
   indent-guide-mode t
   highlight-indentation-mode t
   )

  (setq clojure-enable-fancify-symbols t)

  (menu-bar-mode t)

  ;; Highlight line and display numbers
  (global-hl-line-mode 1)
  (global-linum-mode)

  (ac-config-default)
  ;; (global-company-mode)
  ;; (global-auto-complete-mode)

  ;; Workarounds
  (setq ac-stop-flymake-on-completing t)
  (ac-flyspell-workaround)
  (ac-linum-workaround)
  (setq
   ac-auto-show-menu 0
   ac-show-menu-timer 0.4
   ac-auto-start 0
   )

  (spacemacs/enable-transparency)

  ;; (require 'pretty-mode)
  ;; (global-pretty-mode t)

  (require 'cc-mode)
  (require 'semantic)
  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)
  (global-semantic-idle-completions-mode 1)
  (global-semantic-idle-breadcrumbs-mode 1)
  (global-semantic-stickyfunc-mode 1)

  (semantic-mode 1)

  ;; (define-key evil-insert-state-map (kbd "C-g") evil-escape-key-sequence)
  ;; (define-key evil-hybrid-state-map (kbd "C-g") evil-escape-key-sequence)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-escape)
  (define-key evil-hybrid-state-map (kbd "C-g") 'evil-escape)

  ;; Some genius thought C-w was a good binding for kill-region
  (define-key evil-hybrid-state-map (kbd "C-w") 'backward-kill-word)
  (define-key evil-hybrid-state-map (kbd "C-h") 'backward-delete-char)

  ;; Some emacs-like bindings for evil insert mode
  (define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)
  (define-key evil-insert-state-map (kbd "C-d") 'delete-forward-char)

  ;; Navigating code regions ;;

  (define-key evil-normal-state-map (kbd "(") 'evil-previous-open-paren)
  (define-key evil-normal-state-map (kbd ")") 'evil-next-close-paren)

  (define-key evil-normal-state-map (kbd "[ {") 'evil-previous-open-brace)
  (define-key evil-normal-state-map (kbd "] }") 'evil-next-close-brace)

  ;; (define-key evil-normal-state-map (kbd "]") 'forward-sexp)
  ;; (define-key evil-normal-state-map (kbd "[") 'backward-sexp)

  ;; (define-key evil-normal-state-map (kbd "{") 'evil-backward-section-end)
  ;; (define-key evil-normal-state-map (kbd "}") 'evil-forward-section-end)

  ;; (define-key evil-normal-state-map (kbd "{") 'evil-previous-open-brace)
  ;; (define-key evil-normal-state-map (kbd "}") 'evil-next-close-brace)

  ;; (define-key evil-hybrid-state-map (kbd "TAB") 'tab-to-tab-stop)
  (define-key evil-hybrid-state-map (kbd "TAB") 'indent-relative)
  (define-key evil-hybrid-state-map (kbd "<backtab>") 'evil-shift-left-line)

  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)

  (spaceline-compile)

  ;; (setq haskell-process-suggest-remove-import-lines nil
  ;;       haskell-process-suggest-hoogle-imports      nil
  ;;       ;; haskell-interactive-popup-errors            nil
  ;;       ;; ghc-report-errors                           nil
  ;;       flycheck-indication-mode                    nil
  ;;       flycheck-ghc-args (quote ("-fno-warn-type-defaults")))

  ;; (defun haskell-indentation-advice ()
  ;;   (when (and (< 1 (line-number-at-pos))
  ;;              (save-excursion
  ;;                (forward-line -1)
  ;;                (string= "" (s-trim (buffer-substring (line-beginning-position) (line-end-position))))))
  ;;     (delete-region (line-beginning-position) (point))))

  ;; (advice-add 'haskell-indentation-newline-and-indent
  ;;             :after 'haskell-indentation-advice)

  ;; (defun haskell-evil-open-above ()
  ;;   (interactive)
  ;;   (evil-digit-argument-or-evil-beginning-of-line)
  ;;   (haskell-indentation-newline-and-indent)
  ;;   (evil-previous-line)
  ;;   (haskell-indentation-indent-line)
  ;;   (evil-append-line nil))

  ;; (defun haskell-evil-open-below ()
  ;;   (interactive)
  ;;   (evil-append-line nil)
  ;;   (haskell-indentation-newline-and-indent))

  ;; (evil-define-key 'normal haskell-mode-map "o" 'haskell-evil-open-below
  ;;   "O" 'haskell-evil-open-above)

  ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  ;; (add-hook 'haskell-mode-hook 'haskell-process-load-or-reload)

  (defun ac-csharp-mode-setup ()
    (setq ac-sources (append '(ac-source-yasnippet ac-source-gtags) ac-sources)))

  ;; (add-hook 'gdscript-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  (add-hook 'csharp-mode-hook 'aggressive-indent-mode t)
  ;; (add-hook 'csharp-mode-hook 'auto-complete-mode t)
  ;; (add-hook 'csharp-mode-hook 'dim-braces-setup)
  (add-hook 'csharp-mode-hook 'ac-csharp-mode-setup))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (fsharp-mode flycheck-elm elm-mode flyspell-correct-helm flyspell-correct auto-dictionary company-quickhelp origami nix-mode helm-nixos-options company-nixos-options nixos-options zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline powerline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox spinner orgit organic-green-theme org-projectile org-present org-pomodoro alert log4e gntp org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme omnisharp shut-up oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint light-soap-theme less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme ir-black-theme intero inkpot-theme info+ indent-guide imenu-list hydra hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-hoogle helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets haml-mode gruvbox-theme gruber-darker-theme graphviz-dot-mode grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md gandalf-theme fuzzy flycheck-pos-tip pos-tip flycheck-haskell flycheck pkg-info epl flx-ido flx flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme diminish diff-hl define-word darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode csharp-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-ghci company-ghc ghc haskell-mode company-cabal company-anaconda company column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme auto-yasnippet yasnippet niflheim-theme auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme anaconda-mode ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.4)
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(ansi-term-color-vector
   [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"] t)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#383838" t)
 '(global-paren-face-mode t)
 '(hl-paren-colors
   (quote
    ("orchid1" "DarkOrchid2" "MediumPurple3" "LightSteelBlue4")))
 '(hl-paren-delay 0.2)
 '(indicate-buffer-boundaries (quote left))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (fsharp-mode flycheck-elm elm-mode flyspell-correct-helm flyspell-correct auto-dictionary company-quickhelp origami nix-mode helm-nixos-options company-nixos-options nixos-options zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline powerline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox spinner orgit organic-green-theme org-projectile org-present org-pomodoro alert log4e gntp org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme omnisharp shut-up oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint light-soap-theme less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme ir-black-theme intero inkpot-theme info+ indent-guide imenu-list hydra hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-hoogle helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets haml-mode gruvbox-theme gruber-darker-theme graphviz-dot-mode grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md gandalf-theme fuzzy flycheck-pos-tip pos-tip flycheck-haskell flycheck pkg-info epl flx-ido flx flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme diminish diff-hl define-word darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode csharp-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-ghci company-ghc ghc haskell-mode company-cabal company-anaconda company column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme auto-yasnippet yasnippet niflheim-theme auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme anaconda-mode ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(show-smartparens-global-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode t)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil :family "Hack" :foundry "simp" :slant normal :weight normal :height 119 :width normal))))
 '(hl-paren-face ((t (:foreground "dim gray" :weight ultra-bold))) t)
 '(sp-show-pair-match-face ((t (:inherit bold :foreground "yellow2" :underline t)))))
)
