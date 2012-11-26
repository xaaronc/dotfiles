let $LOCAL = findfile(".vimlocal", ".;")
if filereadable($LOCAL)
		source $LOCAL
endif

