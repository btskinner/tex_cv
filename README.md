# Academic CV template using LaTeX and Biber

Make an academic CV using LaTeX and Biber with this template. Rather
than adding new publications, working papers, or presentations by
hand, use this template to store your work products in a `.bib` file
just as you would a bibliography of references for a paper.

Through selective use of the `keyword` field in your `.bib` file
(*e.g.*, `article`, `presentation`, `working`, `submitted`) and
corresponding reference sections in your `.tex` file, automagically
compile and update your CV in a consistent manner.

## Features

* Citations are in reverse chronological order, including by month if
  included (*e.g.*, October will be higher than May, even though it
  comes first alphabetically).  
* Citations convert links in `Url` field (and `Doi` and `ISBN`) to
  linked titles in citation.  
* Works can be limited to only recent publications, presentations,
  etc., using the `\recentyear{}` macro in the top of the file.  
* Non-automated sections use lists or tables to make clean layout.

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

## NOTE

You may need to download non-free fonts if you haven't already. Use the instructions here,
[http://www.tug.org/fonts/getnonfreefonts/](http://www.tug.org/fonts/getnonfreefonts/)
to download and install the `getnonfreefonts` command. Then in the
terminal do:

```shell
sudo getnonfreefonts --user garamond garamondx
```
to get the Garamond font used in the template.

## Integrate with GitHub pages

An added benefit of building your CV this way is that you can reuse
your `.bib` file to build your academic website and keep everything
synced. For example, if you use GitHub Pages +
[Jekyll](https://jekyllrb.com) to build your site, you can use the
[jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) extension
to build a similar CV on your site (it's how I do it).
