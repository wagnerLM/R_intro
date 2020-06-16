### Introducao e ambientacao ao R/RStudio
# Disponivel em: https://github.com/wagnerLM/quanti2/blob/master/script%20R%20intro2.R
# Inspiradao em Torfs & Brauer (2012) e Epskamp (2013) "Introductions to R"
# Todas as linhas iniciadas em "#" sao comentarios, e nao sao processadas como comandos ao software

# Iniciando: reconhecendo os quadrantes do RStudio
# Esquerdo-baixo: console e comando, mostra os registros de atividades, saidas de analises e e onde o "R" funciona
# Esquerdo-alto: editor ou script, você pode armazenar seus comandos e salvar seus projetos
# Direito-alto: espaco de trabalho e repositorio de seus "objetos"
# Direito-baixo: arquivos de ajuda, imagens e graficos, informacoes dos pacotes

# O R e uma linguagem de programacao estatistica
# Permite realizar analises estatisticas, visualizacao de dados, extracao (mineracao) de dados, e outras muitas funcionalidades
# e livre (gratuito) e possui uma comunidade ativa de usuarios ao redor do mundo

### Usando o R como uma calculadora
# Faca as seguintes operacoes:
1+1
# O resultado sera [1] 2
(10*20)/100
# O resultado sera, novamente, [1] 2

### Objetos no R
# Numeros:
1.5
## [1] 1.5
10
## [1] 10
# Sequencias de palavras/caracteres (strings)
"esta e uma frase"
# use " " ou ' ' para delimitar a sequencia
"esta tambem e uma frase"
# Operadores logicos
TRUE
## [1] TRUE
FALSE
## [1] FALSE

### Como atribuir objetos (objeto pode ser qualquer coisa no R)
# Use o operador <- (equivale a =, mas e preferido neste tipo de programacao)
a<-1
a
## [1] 1
b<-2
a+b
## [1] 3
a<- a + b
a
## [1] 3
# Note que o valor de "a" foi reescrito
b
## [1] 2
# Ja o valor de "b", nao

### Vetores
# Basicamente tudo no R e um vetor
# Utilize a funcao "c" para criar vetores (concatenar)
c(1,2,3)
## [1] 1 2 3
v1<-c(5,2,10,1)
v1
## [1]  5  2 10  1
v2<- 1:4
v2
# operador ":" faz uma sequencia de elementos
# Some os vetores
v1+v2
## [1]  6  4 13  5
v1+1
## [1]  6  3 11  2
# Indexacao 
v1<-c(5,2,10,1)
v1
# selecionando o 3º elemento de v1
v1[3]
## [1] 10
# modificando o valor do 3º elemento de v1
v1[3]<-0
v1
## [1] 5 2 0 1

### Funcoes
# Uma funcao e um comando
# Ela transforma um input (objeto + argumentos) em um output (novo objeto)
# Funcoes possuem uma forma basica "nome(objeto,argumento1,argumento2,...)
# Exemplo, calculo da media
v1<-c(5,2,10,1)
meanv1_1<-(5+2+10+1)/4
meanv1_2<-mean(v1)
meanv1_2
# Soma dos elementos de v1
somav1_1<- (5+2+10+1)
somav1_1
somav1_2<-sum(v1)
somav1_2
## Para saber o que uma funcao faz e quais os argumentos que dispoe
?mean
?sum

### Matrizes
# Uma matriz e um vetor, porem com informacoes sobre linhas e colunas
m1<-matrix(c(5,2,10,1),2,2)
m1
# Indexacao de matrizes requerem 2 coordenadas
m1[1,2]
m1[1,2]<-0
m1

### Listas
# Lista e um objeto que contem outros objetos
# usa-se "$" ou "[[]]" para indexar listas
v1<-c(5,10,1,3)
v1
m1<-matrix(c(5,2,10,1),2,2)
m1
l1<-list(v1=v1,m1=m1)
l1
# ?str
str(l1)
# indexacao
l1$v1
l1[["v1"]]
# mudar elementos
l1$m1[2,2]<-0
l1$m1

### Data frames - bancos de dados
# e uma combinacao de matriz e lista
# possui uma estrutura similar aos bancos de dados em softwares como o SPSS
# Criando um data frame
# vetor de caracteres
sex<-c("male","female","male","female")
# vetor de operadores logicos
exp<-c(TRUE,TRUE,FALSE,FALSE)
# 2 vetores numericos
A<-c(5,10,1,3)
B<-1:4
df1<-data.frame(sex=sex,exp=exp,A=A,B=B)
df1
# indexando variaveis (vetores)
df1$sex
df1[["sex"]]
# separando conjuntos do banco de dados
df1[,c("A","B")]
# pode-se aplicar funcoes aos subconjuntos de dados
cor(df1[,c("A","B")])

### Pacotes 
# Instalando pacotes
# use o comando install.packages("nome")
# Carregando os pacotes
# use o comando library(nome)

### Exemplo
?read.csv
dasspoly<-read.csv("https://raw.githubusercontent.com/wagnerLM/netusf/master/dasspoly",sep = ";")
?View
View(dasspoly)
# Nome resumido dos itens
dasslabels<-scan("https://raw.githubusercontent.com/wagnerLM/netusf/master/dasslabels",what = "character", sep = "\n")
dasslabels
# Itens completos 
dassnames<-scan("https://raw.githubusercontent.com/wagnerLM/netusf/master/dassnames",what = "character", sep = "\n")
dassnames

# Ativando pacotes
library(psych)

# Medidas descritivas e inspeção de dados
?summary
summary(dasspoly[,c(3,5,10,13,16,17,21)])
?describe
describe(dasspoly[,c(3,5,10,13,16,17,21)])
?pairs.panels
pairs.panels(dasspoly[,c(3,5,10,13,16,17,21)],jiggle = T,factor = 5)

# Mapa de calor com psych
?cor.plot
cor.plot(dasspoly[,c(3,5,10,13,16,17,21)])
cor.plot(dasspoly[,c(3,5,10,13,16,17,21)],numbers = T,cex = 0.75)
cor.plot(dasspoly[,c(3,5,10,13,16,17,21)],numbers = T,cex = 0.75,labels = dasslabels[c(3,5,10,13,16,17,21)])

# Análise fatorial com psych
?fa
fa(dasspoly[,c(3,5,10,13,16,17,21)],1)
dass_d_fa<-fa(dasspoly[,c(3,5,10,13,16,17,21)],1)
rownames(dass_d_fa$loadings)<-paste(dasslabels[c(3,5,10,13,16,17,21)])
dass_d_fa

# Tarefa: 
# Instale o pacote swirl e faca um relatorio de sua progressao