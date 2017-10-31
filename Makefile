.DEFAULT_GOAL := deploy

dotdir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

excludes := Makefile .gitignore LICENSE .DS_Store
deploy:
	@for d in $(shell find $(dotdir) -type d -not -name .git -not -path '*/.git/*' -mindepth 1); do \
		mkdir -p $(HOME)$${d#$(dotdir)}; \
	done
	@for f in $(shell find $(dotdir) -type f $(addprefix -not -name , $(excludes)) -not -path '*/.git/*'); do \
		ln -sf $$f $(HOME)$${f#$(dotdir)}; \
	done
	@ln -sf $(HOME)/.zsh/.zshenv $(HOME)/.zshenv
.PHONY: deploy

define AUTO_COMMIT_PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>$(label)</string>
    <key>ProgramArguments</key>
    <array>
      <string>$(HOME)/.dotfiles/bin/auto-commit.sh</string>
    </array>
    <key>WatchPaths</key>
    <array>
      <string>$(HOME)/.dotfiles</string>
    </array>
    <key>StandardErrorPath</key>
    <string>/dev/null</string>
    <key>StandardOutPath</key>
    <string>/dev/null</string>
  </dict>
</plist>
endef
export AUTO_COMMIT_PLIST
watch: label := dotfiles.auto-commit
watch:
	@echo "$$AUTO_COMMIT_PLIST" > $(HOME)/Library/LaunchAgents/$(label).plist
	@$(MAKE) _launchctl label=$(label)
.PHONY: watch

define BREW_MAINT_PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>$(label)</string>
    <key>ProgramArguments</key>
    <array>
      <string>$(HOME)/.dotfiles/bin/brew-maint.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>StartCalendarInterval</key>
    <dict>
      <key>Hour</key>
      <integer>5</integer>
      <key>Minute</key>
      <integer>0</integer>
    </dict>
    <key>StandardErrorPath</key>
    <string>/dev/null</string>
    <key>StandardOutPath</key>
    <string>/dev/null</string>
  </dict>
</plist>
endef
export BREW_MAINT_PLIST
brew-maint: label := dotfiles.brew-maint
brew-maint:
	@echo "$$BREW_MAINT_PLIST" > $(HOME)/Library/LaunchAgents/$(label).plist
	@$(MAKE) _launchctl label=$(label)
.PHONY: brew-maint

init:
	@mkdir -p $(HOME)/Library/LaunchAgents
.PHONY: init

op ?= status
_launchctl:
ifeq ($(op), $(filter $(op), unload reload))
	launchctl unload $(HOME)/Library/LaunchAgents/$(label).plist
endif
ifeq ($(op), $(filter $(op), load reload))
	launchctl load $(HOME)/Library/LaunchAgents/$(label).plist
endif
	launchctl list $(label)
