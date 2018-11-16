#!/bin/sh
REM ctags -f $HOME/.ctags --totals -R $HOME/ioq3-mods/code/*

ctags -f %userprofile%\.ctags  --totals -R %userprofile%/ioq3/code/*

pause
