# LaTeX on Ubuntu — Setup & Compilation Guide
 
This guide walks you through installing LaTeX on Ubuntu and compiling `.tex`
files straight from the terminal. No GUI required.
 
## 1. Installing LaTeX
 
The easiest way to get a complete LaTeX environment on Ubuntu is through **TeX
Live**. It comes in a few flavors, here's how to choose:
 
### Option A: Full installation (recommended)
 
Installs everything. Takes more disk space (~5 GB), but you'll never miss a
package.
 
```bash
sudo apt update
sudo apt install texlive-full
```
 
### Option B: Minimal + extras (lighter approach)
 
Start lean and add what you need:
 
```bash
sudo apt update
sudo apt install texlive-latex-extra texlive-fonts-recommended texlive-lang-english
```
 
> **Tip:** If you ever run into a "package not found" error during compilation,
just install `texlive-full` and move on — life's too short to hunt packages
manually.

## 2. Verifying the Installation
 
After installing, check that the main compilers are available:
 
```bash
pdflatex --version
xelatex --version
lualatex --version
```
 
All three should print version info. If any of them is missing, your installation is likely incomplete.
 
 ## 3. Compiling a `.tex` File
 
### Using `pdflatex` (most common)
 
Navigate to the folder containing your `.tex` file and run:
 
```bash
pdflatex example.tex
```
 
This generates `example.pdf` in the same directory. Run it **twice** if you have a table of contents, cross-references, or citations — LaTeX needs two passes to resolve them correctly.
 
```bash
pdflatex example.tex
pdflatex example.tex
```
 
### Using `xelatex` (better for custom fonts / Unicode)
 
```bash
xelatex example.tex
```
 
### Using `lualatex` (modern engine, great for advanced typography)
 
```bash
lualatex example.tex
```
 
> For most documents, `pdflatex` is perfectly fine. Switch to `xelatex` or `lualatex` only if you need system fonts or advanced features.

## 4. Compiling with Bibliography (BibTeX / Biber)
 
If your document has a bibliography, the workflow is a bit longer:
 
```bash
pdflatex example.tex
bibtex example        # or: biber example
pdflatex example.tex
pdflatex example.tex
```
 
The extra passes let LaTeX resolve all citations and references properly.
 
## 5. Cleaning Up Auxiliary Files
 
After compilation, LaTeX leaves a bunch of helper files around (`.aux`, `.log`,
`.toc`, etc.). They're harmless, but if you want a clean folder:
 
```bash
rm -f *.aux *.log *.toc *.out *.synctex.gz *.fls *.fdb_latexmk
```
 
Or use a single wildcard pass for everything that's not the source or output:
 
```bash
rm -f example.aux example.log example.toc example.out
```
 
## 6. Using `latexmk` (the smart way)
 
`latexmk` is a build tool that automatically handles how many times to run the compiler, bibliography steps, and cleanup. It's the no-brainer option once you're past the basics.
 
Install it:
 
```bash
sudo apt install latexmk
```
 
Compile your document:
 
```bash
latexmk -pdf example.tex
```
 
Clean up generated files:
 
```bash
latexmk -c        # removes aux files, keeps the PDF
latexmk -C        # removes everything including the PDF
```
 
> `latexmk` is especially handy for documents with complex cross-references or bibliographies — it just figures out the right number of passes for you.
 
## 7. Viewing the Output
 
Open the generated PDF from the terminal:
 
```bash
evince example.pdf        # GNOME default viewer
okular example.pdf        # KDE viewer
xdg-open example.pdf      # Uses your system's default app
```