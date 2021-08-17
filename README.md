[Make an academic CV using LaTeX and Biber with LaTeX +
Biber](https://github.com/btskinner/tex_cv). Rather than adding new
publications, working papers, or presentations by hand over time,
store your work products in a `.bib` file---just as you would a
bibliography of references for a paper---and compile your CV to
update.

Through selective use of the `Keywords` field in your `.bib` file
(*e.g.*, `article`, `presentation`, `working`, `submitted`) and
corresponding reference sections in your `.tex` file, automagically
compile and update your CV in a consistent manner.

## Example setup

Using an entry in the `.bib` file that looks like this:

```
# cv.bib 

@article{me2016paper_one,
	Author = {Last, First M.},
	Journal = {Journal of Academic Studies and Work},
	Keywords = {article}, <!-- KEYWORD TO FILTER BY -->
	Number = {2},
	Pages = {30--45},
	Title = {Paper one},
	Url = {https://github.com/btskinner/tex_cv/blob/master/papers/last_paper_one.pdf},
	Volume = {45},
	Year = {2016}}
```

And a section in the `.tex` file that looks like this:

```
# cv.tex

\begin{refsection}
\section*{Publications}
\nocite{*}                          % cite everything
\printbibliography[heading = none,  % no heading (e.g., "References")
keyword = article,                  % FILTER BY < article > KEYWORD
env = mybib]                        % Use mybib style
\end{refsection}
```

You can get an entry in the complied `.pdf` file that looks like this
(note the link color: the title in the compiled CV links to the paper):


![example](https://raw.githubusercontent.com/btskinner/tex_cv/master/images/example.png)

Feel free to use and modify this template to suit your needs and/or
the norms of your field. Move sections around, add or delete
them. Regardless of the specific style, hopefully the core setup will
be useful and save you time as you update your CV in the future.

For reference, I don't edit my `.bib` by hand, but instead use
[BibDesk](https://bibdesk.sourceforge.io), which comes with the MacTeX
distribution. [JabRef](http://www.jabref.org) is another one that
works across platforms.

## Features

* Name is added to header of pages after the first along with the page
  number.  
* A footer with the date of the last compilation will let you and
  others know when it was last updated.  
* Citations are in reverse chronological order, including by month if
  included (*e.g.*, October will be higher than May, even though it
  comes first alphabetically).  
* Citations convert links in `Url` field (and `Doi` and `ISBN`) to
  linked titles in citation. Put links to your publications or working
  papers here and anyone with a digital copy of your CV will be able
  to click on the title to access them.  
* Works can be limited to only recent publications, presentations,
  etc., using the `\recentyear{}` macro in the top of the file.  
* Non-automated sections use lists or tables to make clean layout.  
* Comments throughout `cv.tex` to help you know what to change in order to
  personalize.  

## Numbered entries

If you want numbered entries, you can switch to the `numbered`
branch. The changes noted in [issue
1](https://github.com/btskinner/tex_cv/issues/1) have been made to
`cv.tex` in this branch. Just switch to the other branch first using:

``` shell
git checkout numbered
```

## Compile

### Manually

Compile the example using the following commands in the terminal:

```shell
pdflatex cv.tex
biber cv
pdflatex cv.tex
pdflatex cv.tex
```

### Makefile

You can also build this example CV using
[make](https://www.gnu.org/software/make/).

```shell
make all
```
or simply

```shell
make
```

You can clean up the auxilary files made by pdflatex and biber using

```shell
make clean
```

To clean these files and delete the compiled pdf file, use

```shell
make cleanall
```

## Integrate with GitHub pages

An added benefit of building your CV this way is that you can reuse
your `.bib` file to build your academic website and keep everything in
sync. For example, if you use GitHub Pages +
[Jekyll](https://jekyllrb.com) to build your site, you can use the
[jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) extension
to build a similar CV on your site ([it's how I do
it](https://www.btskinner.me/publications/)).
