#!/bin/sh

case "$1" in
	*.tgz|*.tar.gz) tar tzf "$1";;
	*.tar.bz2|*.tbz2) tar tjf "$1";;
	*.tar.txz|*.txz) xz --list "$1";;
    *.tar) tar tf "$1";;
	*.zip|*.jar|*.war|*.ear|*.oxt) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
	*.md) glow "$1";;
    *.pdf) pdftotext "$1" -;;
    *.jpg) w3m "$1";;
	*.o) nm "$1" | less ;;
	*.torrent) transmission-show "$1";;
	*.iso) iso-info --no-header -l "$1";;
	*odt,*.ods,*.odp,*.sxw) odt2txt "$1";;
	*.doc) catdoc "$1" ;;
	*.docx) docx2txt "$1" - ;;
	*.csv) cat "$1" | sed s/,/\\n/g ;;
    *) highlight -O ansi "$1" || bat "$1";;
esac
