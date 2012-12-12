THEME = theme.sed

~/.nanorc: *.nanorc mixins/*.nanorc $(THEME)
	cat *.nanorc | sed -f mixins.sed | sed -f $(THEME) $(FILTER) > ~/.nanorc

ifeq ($(shell test -f ~/.nanotheme && echo 1),1)
  THEME = ~/.nanotheme
endif

ifeq ($(shell uname),Darwin)
  OLDNANO = 1
endif

ifdef OLDNANO
  FILTER += | sed -e '/^header/d;/^unbind/d;/^bind/d;/^set undo/d'
endif

ifdef NOBINDINGS
  FILTER += | sed -e '/^unbind/d;/^bind/d;'
endif

ifdef TEXT
  FILTER += | sed -e 's|^color \(bright\)\{0,1\}black|color \1$(TEXT)|'
endif

ifdef BSDREGEX
  FILTER += | sed -e 's|\\<|[[:<:]]|g;s|\\>|[[:>:]]|g'
endif

ifdef POSIX
  FILTER += | sed -e 's|\\<||g;s|\\>||g'
endif

.PHONY: ~/.nanorc
