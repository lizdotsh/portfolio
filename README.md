# [Portfolio site (click for live site)](https://portfolio.lizgood.win)

A simple portfolio. Very WIP at the moment, missing some stuff. Whole portfolio site is rendered with github actions. 

The action: 

1. Downloads files from other project-specific repos (static files, jupyter notebooks, PDFs, etc) to /assets
2. Renders index.qmd, along with all renderable notebooks in /assets. This allows any linked notebooks to be rendered as sub pages by quarto itself, instead of just linking directly to the .ipynb file. 
3. Push to cloudflare pages.

Automatically does this on every commit to main.
