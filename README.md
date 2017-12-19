# R Day

[![Build Status](https://travis-ci.org/leg-ufpr/rday.svg?branch=master)](https://travis-ci.org/leg-ufpr/rday)

Repositório com o código fonte para gerar o site do [R
Day](http://rday.leg.ufpr.br).

## Para gerar o site

O site é todo construído usando apenas o [R Markdown][], por isso, o
código fonte está nos arquivos `Rmd`. Para gerar o site você precisará
das versões mais recentes dos pacotes `rmarkdown` e `knitr`.

1. Copie (ou fork) esse repositório
2. Abra o R nesse diretório, carregue os pacotes e renderize o site com
   `render_site()`

```r
library(rmarkdown)
render_site()
```

## Licença

O conteúdo deste repositório, está está disponível por meio da [Licença
Creative Commons 4.0][] (Atribuição/NãoComercial/PartilhaIgual).

![Licença Creative Commons 4.0](img/CC_by-nc-sa_88x31.png)


[Licença Creative Commons 4.0]: https://creativecommons.org/licenses/by-nc-sa/4.0/deed.pt_BR
[R Markdown]: http://rmarkdown.rstudio.com
