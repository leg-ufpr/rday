#-----------------------------------------------------------------------
# Imagens.

# Vetor com nomes dos arquivos.
pic <- dir(pattern = "*.(JPG|jpg)",
           recursive = TRUE,
           full.names = TRUE)

# Cria diretório.
unlink("resized", recursive = TRUE)
dir.create(path = "resized", recursive = TRUE)

#-----------------------------------------------------------------------
# Extrai a estampa de tempo.

# Estampa de tempo.
get_timestamp <- function(x) {
    s <- system(sprintf("stat %s --printf=%%y", x),
                intern = TRUE)
    strftime(as.POSIXlt(s, tz = "BRT"), format = "%H:%M")
}

sapply(pic, get_timestamp)

#-----------------------------------------------------------------------
# Reduz as dimensões da imagem.

# Reduz e transfere para o diretório `./resized/`.
for (p in pic) {
    fmt <- "convert %s -resize 1200 resized/%s"
    cmd <- sprintf(fmt = fmt, p, sub("\\.JPG$", ".jpg", basename(p)))
    cat(cmd, "\n")
    system(cmd)
}

#-----------------------------------------------------------------------
# Escreve no rodapé das imagens.

# composite -dissolve 100 -gravity southeast $copy $source $output
# convert $source -pointsize 80 -gravity east label:'2º R Day' -append $output

pic <- dir(path = "resized",
           pattern = "*.jpg",
           recursive = TRUE,
           full.names = TRUE)
head(pic)

# Lista de fontes disponíveis para escrever nas imagens.
system("convert -list font")

for (p in pic[-(1:2)]) {
    fmt <- paste(
        "convert",
        "%s",
        "-pointsize 20",
        "-font 'Roboto-Condensed-Regular'",
        "-gravity South",
        "-splice 0x28",
        "-annotate +0+2",
        "'%s'",
        "-append aux.JPG")
    txt <- paste("2º R Day · Encontro de usuários do R ·",
                 "13/Dez/2019 · UFPR/Curitiba/PR")
    cmd <- sprintf(fmt = fmt,
                   p,
                   txt,
                   p)
    cat(cmd, "\n")
    system(cmd)
    system(sprintf("mv aux.JPG %s", p))
}

#-----------------------------------------------------------------------
