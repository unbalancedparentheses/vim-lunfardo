# Vim Lunfardo

![](https://raw.githubusercontent.com/unbalancedparentheses/lunfardo/master/images/buenosaires.jpg)

In the mid XIX century, Buenos Aires was pullulating with immigrants, mainly Spanish and Italian. Many of them were impoverished and blended in with 
the already-poor locals: the descendents of aborigins and african slaves.

From the amalgam of the newcomers' languages with Argentina's 'castilian', emerged ther slang known as Lunfardo.

It was created by criminals, mainly to avoid being understood by prison guards.

It was disseminated thanks to 'tango' lyrics, a music which was born as suburban, marginal and was swiftly forbidden by the Church and higher classes. Tango was played and danced in ports, brothels, bars and prisons.

Nowadays, Lunfardo has blended into the castilian language and is part of its idiosincrasy.

---

# Installing Vim Lunfardo

Assuming you're using an Unix-like OS (*BSD, GNU/Linux, OS X, Solaris, etc), you already have vim installed, as well as git & curl you can skip the whole manual and just type in your favorite shell the following command:

```bash
curl -L https://raw.githubusercontent.com/unbalancedparentheses/vim-lunfardo/master/bootstrap.sh | bash
```

# Introduction to Vim

Here're some tips in case you've never used VIM before:

* Read [Why Atom Can’t Replace Vim](https://medium.com/@mkozlows/why-atom-cant-replace-vim-433852f4b4d1)
* Play [vim adventures](http://vim-adventures.com/)
* Type `vimtutor` into a shell to go through a brief interactive
  tutorial inside VIM.
* Watch the screencasts at [vimcasts.org](http://vimcasts.org/)
* Watch Derek Wyatt's energetic tutorial videos at [his site](http://derekwyatt.org/vim/tutorials/)
* Read wycats' perspective on learning Vim at
  [Everyone who tried to convince me to use vim was wrong](http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/)
* Read this and other answers to a question about vim at StackOverflow:
  [Your problem with Vim is that you don't grok vi](http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)
* Practice with [vim golf](http://vimgolf.com/)'s challenges

##Vim cheatsheet
![](https://i.imgur.com/YLInLlY.png)

# Features

## Plugins

### [dwm](https://github.com/spolu/dwm.vim)

Tiled Window Management for Vim:

* `<C-d>` Creates a new window and place it in the master pane [M] & stacks all previous windows in the stacked pane [S]
* `<C-d>` Close the current window if no unsaved changes
* `<C-j>` Jumps to next window (clockwise)
* `<C-j>` Jumps to previous window (anti-clockwise)
* `<C-Space>` Focus the current window, that is, place it in the master pane [M] & stacks all other windows in the stacked pane [S]

### [CtrlP](https://github.com/kien/ctrlp.vim)

Fuzzy file, buffer, mru and tag finder:

* `<Space-p>` invokes CtrlP  
* `<F5>` to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options
* `<C-f>` and `<C-b>` to cycle between modes
* `<C-d>` to switch to filename only search instead of full path
* `<C-r>` to switch to regexp mode
* `<C-j>`, `<C-k>` or the arrow keys to navigate the result list
* `<C-t>` or `<C-v>`, `<C-x>` to open the selected entry in a new tab or in a new split
* `<C-n>`, `<C-p>` to select the next/previous string in the prompt's history
* `<C-y>` to create a new file and its parent directories
* `<c-z>` to mark/unmark multiple files and <c-o> to open them

# Inspiration

- [spf13-vim](https://github.com/spf13/spf13-vim)
- [janus](https://github.com/carlhuda/janus)
- [bling](https://github.com/bling/dotvim)
- [astrails](https://github.com/astrails/dotvim)
- [thoughtbot](https://robots.thoughtbot.com/tags/vim)'s posts
