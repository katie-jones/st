#!/bin/sh

# Scrollback with c-u/c-d
patch < st-scrollback-vim-20160808-308bfbf.diff

# Solarized
patch < st-no_bold_colors-20160727-308bfbf.diff
patch < st-solarized-both-20160727-308bfbf.diff

# Copy/paste
patch < st-clipboard-20160727-308bfbf.diff

# Font
patch < st-inconsolata-20160807-308bfbf.diff

# Visual bell
patch < st-visualbell-20160727-308bfbf.diff

