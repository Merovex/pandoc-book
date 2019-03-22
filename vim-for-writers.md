[[File:Vim_workflow.png]]

## Introduction

[vim](http://www.vim.org/) is a very powerful [modal text editor](http://www.viemu.com/a-why-vi-vim.html) with a large system of plugins. You may have heard of the infamous [vim vs. emacs](https://www.udemy.com/blog/vim-vs-emacs/ ) wars that have existed from the time of usenet and persist till today. [vim does have a learning curve](http://net.tutsplus.com/articles/web-roundups/25-vim-tutorials-screencasts-and-resources/) but it is very worthwhile to learn because your fingers never leave the keyboard as you are writing and editing. ViM = Vi Improved; it is a superset of the original vi editor.

[This series of articles introduces vim](https://webdevchallenges.com/table-of-contents/a-brief-introduction-to-vim/ ).

## Quick Vim Cheatsheet(s)

* See [this excellent vim cheatsheet of commands you should know](https://github.com/LeCoupa/awesome-cheatsheets/blob/master/tools/vim.txt) (_github_)

## A great example vimrc (WurdBender)

[WurdBender](http://nanowrimo.org/participants/wurdbender ) writes:
I noticed most of the Vim community seems to prefer the Solarized theme, but I really can't stand it myself. I've been using Tomorrow Night from the repository you linked, except I run in 256 color mode (set t_Co=256) to subdue the colors a bit. I'm still trying out fonts. At the moment I'm liking Input Mono.

Below is what my setup looks like with some code to show off the colors. I wasn't sure I'd get much use out of the Airline bar, but it comes in handy. I've also created a [repository for my .vimrc on GitHub](https://github.com/WurdBendur/vimrc/blob/master/.vimrc), which I'm told is a good idea in case you need to quickly set up Vim on a new system. It's there if anybody wants to see it, though it's maybe a bit cluttered and noobish.

### A derivative vimrc (NewMexicoKid)

[NewMexicoKid](http://nanowrimo.org/participants/newmexicokid ) writes:
I made a (slightly modified) [vimrc](https://github.com/NewMexicoKid/vimrc ) based on WurdBender's. I turned off numbers (too technical for NaNo), added autoindent and shift width/expand tab (which I find more useful for doing sub-bullets in markdown).

#### A more-efficient wordcount algorithm for writers (vithic)
* From	vithic
* To	NewMexicoKid
* Sent at	October 21, 2018 16:28
* Subject	Vim.

I just noticed that my Vim configuration is based yours that is referenced at [Nanowrimo Vim for Writers](http://www.naperwrimo.org/wiki/index.php?title=Vim_for_Writers). :)

I managed to decrease the word count overhead quite a bit somehow by copy/pasting a function from somewhere that made it only update it on every line break (at 20k words it's still painful when inserting a line break though).

Just replace your ``~/.vim/plugged/vim-markdown-folding/after/ftplugin/markdown/`` folding.vim with this:

https://pastebin.com/A291j9Fc

Just to add some clarification - the original setup provides a line count that is mostly useless to authors. The suggested folding.vim file changes that into a word count and nothing else (at a slight resource expense, most likely - especially if folds grow into 1k+ words).

### Tips from reddit

[This reddit post and answer has some interesting starting points to explore](https://www.reddit.com/r/vim/comments/8m88kg/do_you_use_vim_for_writing_if_so_whats_your/ ):

```
   Plug 'reedes/vim-pencil' " Super-powered writing things
   Plug 'tpope/vim-abolish' " Fancy abbreviation replacements
   Plug 'junegunn/limelight.vim' " Highlights only active paragraph
   Plug 'junegunn/goyo.vim' " Full screen writing mode
   Plug 'reedes/vim-lexical' " Better spellcheck mappings
   Plug 'reedes/vim-litecorrect' " Better autocorrections
   Plug 'reedes/vim-textobj-sentence' " Treat sentences as text objects
   Plug 'reedes/vim-wordy' " Weasel words and passive voice


   augroup pencil
    autocmd!
    autocmd filetype markdown,mkd call pencil#init()
        \ | call lexical#init()
        \ | call litecorrect#init()
        \ | setl spell spl=en_us fdl=4 noru nonu nornu
        \ | setl fdo+=search
   augroup END

  " Pencil / Writing Controls {{{
    let g:pencil#wrapModeDefault = 'soft'
    let g:pencil#textwidth = 74
    let g:pencil#joinspaces = 0
    let g:pencil#cursorwrap = 1
    let g:pencil#conceallevel = 3
    let g:pencil#concealcursor = 'c'
    let g:pencil#softDetectSample = 20
    let g:pencil#softDetectThreshold = 130
  " }}}
```

And finally: https://labs.tomasino.org/vim-in-context/

### Tips from [Pingouin](https://nanowrimo.org/participants/pingouin )

I have a dozen plugins in my .vimrc, but the only ones I couldn't live without for prose are Goyo (distraction-free), vim-peekaboo (show registers while yanking/pasting) and vim-Grammalecte (a french grammar/spelling checker). I've added a live word count to my status bar and a feature I haven't seen elsewhere but which I now find mandatory: something to hide what I'm writing but still provide me with some context.

It serves two purposes: to protect my kids or other prying eyes from reading my "rated" stuff, and to help me resist my inner editor (can't correct what I don't see!). I can still read some of it with a little effort if I typed it not too long ago, and see the overall structure so I don't get lost. It's a single key toggle, so I can quickly hide or reveal the whole window.

Another "can't live without it" setting is the one to return to last edit position when opening files.

I also have a shortcut to navigate to the previous or next scene/chapter/book:

``map <leader>n /^[#*]<cr>:nohl<cr>``

``map <leader>p k?^[#*]<cr>:nohl<cr>``


Edit: I can't embed an image… so go see my ["incognito/censored/kill-the-inner-editor"](https://imgur.com/a/H4oNuZD) mode

Update: Well, it was coded within my .vimrc, but it's now a plugin: https://github.com/swordguin/vim-veil

Thanks for your interest! I hope it will be useful to you or to other people.

Here's the relevant section of my .vimrc for the word count: https://pastebin.com/t07PRJYC

Both work flawlessly even with a 200'000 words markdown novel (no lag at all)

### vimrc generator

See [this great vimrc generator to get a decent starter vimrc](https://arp242.net/my-first-vimrc/#options=1111111111011100111110001111010 ).

## How to manage long .vimrcs

* See [from .vimrc to .vim](https://vimways.org/2018/from-vimrc-to-vim/ )

## How to learn how to use vim

* [quora answers on the best ways to learn vim](https://www.quora.com/What-is-the-best-way-to-learn-Vim)

## vimrc tips

HBBisenieks writes:
Most of my vimrc is set for the benefit of my dayjob as a sysadmin, but one line I always make sure is in my vimrc is

```set title```

That way I rarely forget what file I'm editing.

## ViM Folding

Here is a must-see [video that makes vim folding look utterly simple](http://vimcasts.org/episodes/how-to-fold/ ).

Also see this plugin: [vim-outliner](https://github.com/vimoutliner/vimoutliner)

## ViM plugins

There are several ViM plugin managers. One of them is: [vundle](https://github.com/gmarik/vundle), a vim bundle manager that lets you EASILY install other vim plugins/bundles.

## Markdown

[http://daringfireball.net/projects/markdown/](Markdown) is a very simple mark-up language that encourages writers to focus on their content rather than on presentation. It can handle **bolding**, _italics_, bullet lists, section headings, hypertext links, etc. and you can use utilities like [http://johnmacfarlane.net/pandoc/ pandoc] to transform your markdown text to many, many different formats, including:

* .PDF
* .docx, .doc and .rtf
* [http://www.latex-project.org/ LaTeX]
* [http://johnmacfarlane.net/pandoc/epub.html epub]
* [http://mediawiki.org Mediawiki]

ViM has plugins for better markdown syntax highlighting ([https://github.com/tpope/vim-markdown vim-markdown]) and [https://github.com/nelstrom/vim-markdown-folding vim-markdown-folding]. With the latter, you can:

* add the spacebar mapping to your .vimrc:<br/> nnoremap <Space> za

Some [use gnu make to automatically generate everything from the markdown source](http://lincolnmullen.com/blog/make-and-pandoc/ ).

## Beautiful colors

Check out the beauty of [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized ) that "is a sixteen color palette (eight monotones, eight accent colors) designed for use with terminal and gui applications. It has several [unique properties](https://github.com/altercation/solarized#features ). I designed this colorscheme with both precise [CIELAB](http://en.wikipedia.org/wiki/Lab_color_space ) lightness relationships and a refined set of hues based on fixed color wheel relationships. It has been tested extensively in real world use on color calibrated displays (as well as uncalibrated/intentionally miscalibrated displays) and in a variety of lighting conditions." ([ethanschoonover.com](http://ethanschoonover.com/solarized ))

Also see [this quora question with plenty of answers that recommend different color schemes](https://www.quora.com/What-are-some-of-the-best-Vim-color-schemes).

Another couple of references that show you color samples:
* http://vimcolors.com/

## Notes for Planning

See the vim script called [nvim](https://github.com/cwoac/nvim ) to build piles of random little notes during novel planning.

## Movement

Vim can be more or less as powerful as you want it. It's really worth the time spent learning how to jump around ( using '(' and ')' to jump to the start of the previous / next sentence in particular).

## Help

* You can get help on just about any vim feature by entering the command ':help SOMETHING', e.g. ':help spell'
* This might be useful: [Vim Commands Cheat Sheet](http://bullium.com/support/vim.html )

## Autosave

* 'set autowriteall' - autosave your current document whenever you change away from the current buffer. You can just do 'set autowrite', which will save in *most* situations (the main exemption being quitting).
* There is also a [vim plugin](https://github.com/907th/vim-auto-save https://github.com/907th/vim-auto-save). It apparently turns on auto save and saves every time a buffer is modified.

## Spell Checking

* 'set spell spelllang=en_gb' - enable (in this case British) spell checking - see the help page for details of the commands to jump to mistakes and pick / learn corrections.
* See [some more documentation on the built-in support for spell checking](http://www.cs.swarthmore.edu/help/vim/vim7.html ) (as of vim 7).

* it supports a personal word list (very useful for fantasy authors ;-) )

Some useful keys for spellchecking:
  * ``]s`` - forward to misspelled/rare/wrong cap word
  * ``[s`` - backwards ]
  * ``S`` - only stop at misspellings
  * ``[S`` - in other direction
  * ``zG`` - accept spelling for this session
  * ``zg`` - accept spelling and add to personal dictionary
  * ``zW`` - treat as misspelling for this session
  * ``zw`` - treat as misspelling and add to personal dictionary
  * ``z=`` - show spelling suggestions
  * ``:spellr`` - repeat last spell replacement for all words in window

## Thesaurus

* [ a thesaurus plugin for vim](https://github.com/beloglazov/vim-online-thesaurus)

## WriteRoom / DarkRoom simulator

There apparently are many writeroom/darkroom vim plugins and configurations for "distraction free writing". Of the three I tried, I think I like this plugin ([vimroom](http://projects.mikewest.org/vimroom/ )) the best. For installation using vundle, see (Bundle 'mikewest/vimroom'). [A rival noted](https://github.com/vim-scripts/DistractFree/blob/master/doc/DistractFree.txt ) that on Windows, VimTweak yields transparent gvim windows.

## Sessions

_Sessions can be used to save window configurations_
* https://github.com/xolox/vim-session
* https://github.com/xolox/vim-misc

You can use vundle to load both of these and then :SaveSession to save the session. Put

```   let g:session_autosave = 'no'```

at the end of your vimrc so you don't get prompted to save sessions when you close files. A session will preserve your layout and place in the file--very cool!

## Wordcount

* [http://vim.wikia.com/wiki/Word_count the vim wikia gives some very good options for managing wordcount] (simplest is **g** then **Ctrl-g**).
* Found [http://cromwell-intl.com/linux/vim-word-count.html this .vimrc script for putting the current wordcount in the status line]:

```
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Here begins my automated wordcount addition.
   " This combines several ideas from:
   " http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   let g:word_count="<unknown>"
   function WordCount()
       return g:word_count
   endfunction
   function UpdateWordCount()
       let lnum = 1
       let n = 0
       while lnum <= line('$')
           let n = n + len(split(getline(lnum)))
           let lnum = lnum + 1
       endwhile
       let g:word_count = n
   endfunction
   " Update the count when cursor is idle in command or insert mode.
   " Update when idle for 1000 msec (default is 4000 msec).
   set updatetime=1000
   augroup WordCounter
       au! CursorHold,CursorHoldI * call UpdateWordCount()
   augroup END
   " Set statusline, shown here a piece at a time
   highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
   set statusline=%1*            " Switch to User1 color highlight
   set statusline+=%<%F            " file name, cut if needed at start
   set statusline+=%M            " modified flag
   set statusline+=%y            " file type
   set statusline+=%=            " separator from left to right justified
   set statusline+=\ %{WordCount()}\ words,
   set statusline+=\ %l/%L\ lines,\ %P    " percentage through the file
```

## Vim Wiki

The [vim wiki plugin](https://github.com/vimwiki/vimwiki ) is surprisingly powerful. I've noticed quite a few people advocating the use of the [zim desktop wiki tool](http://zim-wiki.org/) (but, of course, it isn't edited in vim, even though there is a vim [zim syntax support](http://www.vim.org/scripts/script.php?script_id=3703 )); I regularly use Mediawiki instances (and once played with [iddlywiki](http://tiddlywiki.com/ t)). The vim wiki plugin looks interesting; and, since I now use the [vundle](https://github.com/gmarik/vundle) plugin manager, I may give it a try.

Some reviews I've seen for vim wiki:

* one guy [uses it along with encryption and distribution through Mercurial](http://www.stochasticgeometry.ie/2012/11/23/vimwiki/ )
* another [uses it for time tracking](http://code.google.com/p/vimwiki/wiki/TimeTrackingWithVimwiki )
* **holy cow!** [vim wiki apparently has a really nifty ASCII table editing mode](https://www.youtube.com/watch?v=N2G8Quh9GdA&noredirect=1 )---might be useful for tracking characters...

## Related Articles of Interest

* [Learn vim script the hard way](http://learnvimscriptthehardway.stevelosh.com/ ) - added 2019-01-22
* [Exploring vim - 6 great books to improve your vim-fu](https://www.barbarianmeetscoding.com/blog/2019/01/06/exploring-vim-6-great-books-to-improve-your-vim-fu/ ) - added 2019-01-22
* [Awesome vim plugins for writers](https://opensource.com/article/17/2/vim-plugins-writers ) - Posted 08 Feb 2017 by Zsolt Szakács
* [ViM Plugins For Writers](http://wynnnetherland.com/journal/reed-esau-s-growing-list-of-vim-plugins-for-writers) - [Reed Esau](https://github.com/reedes)'s growing list of ViM plugins for writers:
  - [vim colors pencil](https://github.com/reedes/vim-colors-pencil ) (pretty theme for writers)
  - [vim thematic](http://github.com/reedes/vim-thematic) (theme manager)-
  - [vim-pencil](http://github.com/reedes/vim-pencil) (handles wrap modes for writers)
* [an article of a guy who wants to devise a ruby gem for handling novel writing/formatting tasks](http://chrismdp.com/2010/11/how-im-writing-my-book-using-git-and-ruby/ ) (okay, not really a vim resource; but something that looked interesting to those of us writing text files)
* [blog article about writing novels in a text editor vs. a WYSIWYG word processor](http://www.antipope.org/charlie/blog-static/2010/01/writing-tools.html); some interesting comments, including a reference to [flashbake](http://bitbucketlabs.net/flashbake/), a set of scripts designed to make it easier for writers to use version control software
* [writing in vim](http://www.drbunsen.org/writing-in-vim/ )---this author shares his vimrc and some of his plugins; the thing of interest here is his use of a set thesaurus command. I found this intriguing and found [this nifty thesaurus plugin for vim](https://github.com/beloglazov/vim-online-thesaurus) that looks very useful and usable.
* Nine great plugins mentioned [in this blog article](http://www.openlogic.com/wazi/bid/276417/Nine-all-purpose-plugins-for-Vim), including:

**Showmarks** --- Marks are **bookmarks within a Vim document.** You can set a mark by pressing m followed by another letter that designates the mark. To jump to a mark, enter ' followed by the mark's letter. --- The great weakness of marks is that they are invisible. This limits the number you can use to however many you can remember, and you can easily accidentally overwrite an existing mark by creating another with the same name. --- [Showmarks](https://github.com/vimez/vim-showmarks ) allows you to toggle the visibility of marks off and on – and that tiny functionality is enough to increase the usefulness of marks several times over.

**Vim Signature** [vim-signature](https://github.com/kshenoy/vim-signature ) is a plugin to place, toggle and display marks. Apart from the above, you can also:
  * Navigate forward/backward by position/alphabetical order
  * Displaying multiple marks (upto 2, limited by the signs feature)
  * Placing custom signs !@#$%^&*() as visual markers

**Vim-abolish**
[Vim-abolish](https://github.com/tpope/vim-abolish ) is so elegant that you wonder why no one thought of it before, but it's hard to describe. It has aspects of a word processor's spell checker or autocorrect, but might best be described as a configurable search and replace tool. **What makes Vim-abolish so powerful is that it allows you not only to search and replace one word or spelling for another, but also to include all instances of a word. Upper case, lower case, noun and adverb, past and present tense, participles** – all can be added to the search and replaced with a few dozen characters. Admittedly, you might take a while to learn how to think in the terms necessary to set up a Vim-abolish command, and learning how to construct a command may take some time too. However, once you understand how Vim-abolish works, you will probably find it an invaluable proofreading tool.


* [Rachel Aaron advises tracking ones reading progress in this excellent blog article](http://thisblogisaploy.blogspot.com.es/2011/06/how-i-went-from-writing-2000-words-day.html) (on how to increase ones writing productivity).
* One user uses ViM together with git (flashbake), vimroom, onlinethesaurus, vim-abolish, vim-repeat and vim-outline. Vimroom does not always work as well, and there's little support for it, but it's still usable with a bit of tinkering.  Of all the plugins vim-outline is the most useful. She recommends it to everyone planning to use vim. It allows you to easily structure your text, and makes for easy folding/expanding.
* [vim-repeat](https://github.com/tpope/vim-repeat) looks interesting for better repetition with: .
  * Seth Brown wrote: [The Text Triumvirate](http://www.drbunsen.org/the-text-triumvirate/) (zsh, vim and tmux) -- in this article, Seth mentions [vim-powerline](https://github.com/Lokaltog/powerline), a python-powered status line plugin. The author of that plugin then points to [vim-airline](https://github.com/bling/vim-airline) as a lighter-weight but still featureful status line plugin.
  * [one redditor has plans to write a book on Vim for Writers](http://www.reddit.com/r/vim/comments/142zn7/are_you_interested_in_a_vim_for_writers_book/); there are some interesting chapter titles in this reddit.
* Here is a [nifty Google tech talk by vim creator Bram Moolenaar](https://www.youtube.com/watch?v=p6K4iIMlouI&noredirect=1 ) with useful tips for productive vim; and [a blog post](http://connermcd.com/blog/2011/10/21/notetaking-with-vim/) about how to use vim and ack for notetaking.
* [How vim is saving me hours of work when writing books and courses](https://nickjanetakis.com/blog/vim-is-saving-me-hours-of-work-when-writing-books-and-courses) - [Nick Janetakis](https://nickjanetakis.com/about)

## Annotations

Question: What's a good way to 'highlight' bits of text that you know you need to fact-check/add to/etc. so that it's easily seen upon a reread?  I've just changed the text color in programs I've used previously...but how to best do that in vim?

One answer: I first thought about using [vim tags](http://usevim.com/2013/01/18/tags/ ) -- I have never used them before, but I've heard of them and it sounds like they do some things that might be useful.
* Then I ran across the qfn ([quickfixnotes](http://www.vim.org/scripts/script.php?script_id=2216)) plugin. The [qfn helpfile](http://vimdoc.sourceforge.net/htmldoc/quickfix.html) makes it sound like it is a step in the right direction:

> In Vim the [quickfix](http://vimdoc.sourceforge.net/htmldoc/quickfix.html#quickfix ) commands are used more generally to find a list of positions in files. For example, |[:vimgrep](http://vimdoc.sourceforge.net/htmldoc/quickfix.html#:vimgrep )| finds [ pattern](http://vimdoc.sourceforge.net/htmldoc/pattern.html#pattern) matches. You can use the positions in a [script](http://vimdoc.sourceforge.net/htmldoc/usr_41.html#script ) with the |[getqflist()](http://vimdoc.sourceforge.net/htmldoc/eval.html#getqflist%28%29)| function. Thus you can [do](http://vimdoc.sourceforge.net/htmldoc/diff.html#do ) a lot more than the edit/compile/fix cycle!

* But this [vim-notebook plugin](https://github.com/wdicarlo/vim-notebook) sounds much more straightforward and easy-to-use right off the bat:

> This plugin has been created to annotate and aggregate key aspects, such as source code, documentation, notes etc, relative to tasks to be done. Annotations with referenced resources are stored into text files called notebooks under the folder $HOME/.notebook.
>
> A typical usage scenario is:
> 1.  create a new notebook called issue_missing_refresh_of referenced_line
> 1.  open the text file containing key information
> 1.  select text of interest
> 1.  annotate selecting proper category and description
> 1.  repeat annotation for other interesting text
> 1.  open the notebook to have an overview of interesting information
> 1.  go to an entry of interest
> 1.  jump to the referenced text file
> 1.  repeat the exploration with other entries

Traditionally, I've just made my notes directly in the text, marking it with NOTES ;-)

This year, though, writing in Markdown, I might take the HTML commenting approach ([ as suggested in this pandoc google group](https://groups.google.com/forum/#%21topic/pandoc-discuss/FnTRTIhCEi4)). On the other hand, the [vim-notebook plugin](https://github.com/wdicarlo/vim-notebook) sounds pretty cool--being able to annotate things in a separate file and yet jump to them at will... neat!

## Why use ViM?

**Question**: Is there a portable OFFLINE text editor that could be run from a USB drive? If so, would such a thing be safe for use on public computers or able to be secured? It doesn't need to be anything fancy.

**One Answer**:
A very good text editor [with a PortableApps version](http://portableapps.com/apps/development/gvim_portable), [lots of available, easily-manageable plugins](http://net.tutsplus.com/sessions/vim-essential-plugins/) and extremely good ergonomics is [ViM](http://www.vim.org/) (vi improved).

I would encourage you to see [this summary](http://naperwrimo.org/wiki/index.php?title=Vim_for_Writers) of [this year's nano-technology thread on ViM](http://nanowrimo.org/forums/nano-technology/threads/122633) (that focuses on how ViM can be used for writing).

Why should you give this modal ASCII editor a try?

* think of it as [an extension to touch typing](http://www.viemu.com/a-why-vi-vim.html) (your fingers never need to reach for a mouse)
* the [vi input model is extremely efficient](http://blog.ngedit.com/2005/06/03/the-vi-input-model/)
* because of [these seven reasons](http://www.makeuseof.com/tag/top-7-reasons-to-give-the-vim-text-editor-a-chance/) (well, the last is a bit facetious, but the other six are spot on: it's mature and people who learn it generally swear by it, it's free and has a vibrant community, it's customizable and extensible, it works over ssh connections, its configuration is extremely portable, and it is very thoroughly documented)
* "[If you are someone who writes text or code for a number of hours every day, learning Vim would be a gamechanger for you.](http://protoiyer.github.io/blog/2011/11/04/vim-at-20-simply-the-best-text-editor/)"

## Other references

* See [Damian Conway's terrific talk with vim tips: More Instantly Better Vim](https://www.youtube.com/watch?v=aHm36-na4-4) that has, among [other things](http://is.gd/IBV2013 ), a nifty plugin that handles orphaned swap files.
* [Learning ViM as a language](http://benmccormick.org/2014/07/02/learning-vim-in-2014-vim-as-language/ )
* [Using ViM as a writing environment](http://timotheepoisot.fr/2014/01/01/vim-writing-environment/ )

## What about Emacs?

[brookter](https://nanowrimo.org/participants/brookter ) wrote:

If you like the general approach of Scrivener but want to stay in plain text with keybindings like they are meant to be used (ie Vim...), you may want to check this out: it's basically an attempt to reproduce some of Scrivener's features using Vim.  Actually, it uses Evil mode within Emacs — this is a VERY GOOD THING. Evil mode (Vim emulation) gives Emacs the one thing it lacks, a decent text editor. (Ahem.)

https://vimvalley.com/replacing-scrivener-with-emacs-and-vim/
