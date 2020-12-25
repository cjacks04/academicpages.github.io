Using R Markdown (for IST 687)
================

Last Updated: 2020-01-12 17:52:05

R Markdown a lightweight markup language designed so that it can be converted to other formats like HTML or pdf. Beginning in Week 2, homework and lab assignments need to be executed inside a markdown file. This document will help you get started with R Markdown. Most of what you need to know about R Markdown will be covered during class, however, [R Markdown: The Defenitive Guide](https://bookdown.org/yihui/rmarkdown/) and [Kbroman](https://kbroman.org/knitr_knutshell/pages/Rmarkdown.html) are great introductory resources on creating R Markdown documents. Visit [R Markdown](http://rmarkdown.rstudio.com) for more comprehensive guide.

### R Markdown basics

Code typed inside a markdown file is not dynamically typed. That is, unlike code typed in the console, the code inside a markdown file is not executed until you run the code or knit the file.

Code that you want executed needs to be interted inside code blocks inside the Rmarkdown file. In the image below, the code block begins on line line 10 and ends on line 14.

<img src='/images/687/code-block.png' width="450" height="150">

You can add new code manually using the same syntax as above or by using the *Insert code* button

<img src="/images/687/insert-code.png" width="300" height="200"/>

The command prompt and your markdown file are not linked (except for knowning which packages are installed). This means if you ran an some code in the console, the RMarkdown file has no idea that the code exists and will not exectute the code until you input it in the code block.

For instance, if I was asked to write code to compute the mean of vector `a` which contains the numbers `c(1,2,3,4,5)`, I would first work in the console to get the correct code. In the example below, I defined a vector a with the numbers 1 through 5 `a <- c(1:5)` or `a <- c(1,2,3,4,5)` and then computed the mean of the vector `mean(a)`.

<img src="/images/687/console-work.png" alt=""
    title="insert code" width="300" height="200" />

Now that I've worked through the correct answer, I can add the code to the RMarkdown file so it outputs a document in an HTML format. (Note. You should only add the code you wrote do not include the `>` or the output `[1] 3`). When trying to knit the code below an error is generated. I assumed that the RMarkdown file knows that the object `a` exists.

<img src="/images/687/not-defined-markdown.png" alt=""
    title="insert code" width="500" height="200" />

<img src="/images/687/not defined error.png" alt=""
    title="insert code" width="500" height="100" />

It errors beacuse RMarkdown and the console are not synchronized. That is, even though I've defined `a` in the console in the RStudio Environment, its invisible to RMarkdown. I need to add all relevent code to the RMarkdown file. To get object `a` which has numbers 1 through 5. I need to define a in the RMarkdown document as such:

<img src="/images/687/defined-markdown.png" alt=""
    title="insert code" width="500" height="400" />

After all relevant code has been entered in a code block, I can knit the document by navigating to the *Preview* or *Knit* button and render a HTML file. Clicking the *Knit to HTML* button will render a HTML file on your desktop.

<img src="/images/687/knit-example.png" alt=""
    title="insert code" width="500" height="400" />

<img src="/images/687/output-example.png" alt=""
    title="insert code" width="500" height="400" />

### R Markdown basics homework and lab assignments

I have created templates for all homework and lab assignments. These can be accessed in the syllabus. You can download the markdown file by clicking the *Download Rmd* text. This will download a markdown file onto your desktop. You should work with this file to submit the assignments.

<img src="/images/687/linkassignments.png" alt=""
    title="insert code" width="400" height="200" />

<img src="/images/687/download-button.png" alt=""
    title="insert code" width="500" height="250" />

At the top of each markdown file is the YAML header. The YAML header defines the output for the document and incldues other attributes such as a timestamp and author name. Be sure to include your name and your partner's name (for lab assignments) inside this YAML header. Points will be deducted from assignments that do not include the names of the authors.

<img src="/images/687/yaml.png" alt=""
    title="insert code" width="400" height="175" />

All assignments need to be rendered in one of the following formats: .docx, .html, or .pdf. The RStudio knit button renders a file to the first format listed in its output field. You can render to additional formats by clicking the dropdown menu beside the knit button.

<img src="/images/687/knit.png" alt=""
    title="insert code" width="200" height="200" />

### Debugging code with R Markdown

There are a few ways to debug code using R Markdown.

In the example below I mistakenly typed `meat(a)` when I should have typed `mean(a)`. When I try to knit the file, the following error appears *Error in meat(a) : could not find function "meat"* (see below). While interpreting the file, R is looking for the function `meat()` which doesn't exist.

<img src="/images/687/knit-error.png" alt=""
    title="insert code" width="500" height="400" />

You'll also notice the .Rmd file has debugging functionality that points to the line where the error originates (line 17). Simply changing `meat()` to `mean()` will correct this error.

You can also debug code inside the R Markdown file. If I had many lines of code or the error is unspecific I can run each code block independently to see where it errors.

In the example below, I've broken our two lines of code into two code blocks. I've executed the first line of code inside the R Markdown file by clicking the green *right arrow*. You can find this inside the code block to the right.

<img src="/images/687/twoblocks.png" alt=""
    title="insert code" width="700" height="200" />

<img src="/images/687/arrow.png" alt=""
    title="insert code" width="100" height="100" />

Notice that inside the R Markdown file you can see the line where the code errors and the error text.

<img src="/images/687/block-error.png" alt=""
    title="insert code" width="700" height="150" />

Again, changing `meat()` to `mean()` will correct this error.
