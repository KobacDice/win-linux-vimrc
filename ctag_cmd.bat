#!/bin/sh
REM ctags -f $HOME/.ctags --totals -R /code/*

ctags -f %userprofile%\.ctags  --totals -R %userprofile%/ioq3/code/*

pause
