# [Portfolio site (click for live site)](https://portfolio.lizgood.win)


Whole portfolio site is rendered with github actions. 

The action: 

1. Downloads files from other project-specific repos (I have it link directly for pdfs and images through cloudflare, some links are still to the specific github page though, mostly for notebooks). 
2. Render quarto document
3. Publish to cloudflare pages


Automatically does this on every commit to main.
