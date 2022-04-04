################################################################################
# Material auxiliar - Problema de satisfação de restrições
# Atividade 3 - Problema de coloração de mapas
################################################################################

################################################################################
# Autor    : Ricardo da Silva Braga
# Data     : 03/04/2022
# Objetivo : Durante a aula, minha equipe recebeu a atribuição de pintar o mapa
# da Austrália, com no máximo 4 cores diferentes, e com a restrição de que 
# países vizinhos não podem ter a mesma cor.
################################################################################

################################################################################
# Conforme visto em aula, para trabalhar com os grafos vamos usar a biblioteca
# igraph. O comando a seguir instala a biblioteca igraph. Mais informações sobre
# a instrução podem ser obtidas no link a seguir
# https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/install.packages
################################################################################

install.packages('igraph')

################################################################################
# Depois de instalada, preciso carregar a biblioteca para poder utilizar todas
# as suas funcionalidades. O comando a seguir carrega a biblioteca igraph.
# Mais informações sobre a instrução podem ser obtidas no link a seguir
# https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/library
################################################################################

library(igraph)

################################################################################
# Na aula de 30/03/2022, cada equipe ficou com um país/continente diferente. 
# Para construir o grafo vamos usar uma matriz de adjacência. Ela deve ser 
# criada utilizando um arquivo csv. A sugestão é utilizar uma planilha 
# eletrônica qualquer, com os rótulos adequados, e criar seu grafo. Depois que 
# o arquivo csv foi gerado, o comando a seguir permite que eu escolha
# o arquivo csv desejado (file.choose), lendo inicialmente como uma tabela 
# (read.table). Note que no meu arquivo, utilizei como separador o ponto e 
# vírgula. Além disso, considero que existe um cabeçalho (header = TRUE), onde 
# eu coloco os rótulos dos vértices de meu grafo. O parâmetro row.names, indica
# que na coluna 1 da minha matriz, estão os nomes das linhas, que são os rótulos 
# utilizados nos meus vértices. Mais informações sobre a instrução podem ser 
# obtidas no link a seguir.
# https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/read.table
################################################################################

matriz <- read.table(row.names=1,file=file.choose(),header = TRUE,sep = ';')

################################################################################
# Para verificar se a leitura da matriz foi feita corretamente pelo código, vou
# exibir a matriz utilizando a linha de comando a seguir
################################################################################

matriz

################################################################################
# Vamos ajustar o formato da matriz lida, para um formato adequado para o uso
# da biblioteca igraph. Converteremos a matriz que foi lida como uma tabela de 
# dados, para uma matriz. 
# Mais informações sobre a instrução podem ser obtidas no link a seguir
# https://www.rdocumentation.org/packages/data.table/versions/1.14.2/topics/as.matrix
################################################################################

matriz_de_adjacencia <- as.matrix(matriz)

################################################################################
# Agora vamos criar o nosso grafo usando a matriz de adjacencia escolhida. Para
# isso vamos usar a instrução graph_from_adjacency_matrix. No nosso caso, o 
# grafo não é direcionado (mode='undirected'), e tem pesos (weighted=TRUE). 
# Mais informações sobre a instrução podem ser obtidas no link a seguir
# https://igraph.org/r/html/latest/graph_from_adjacency_matrix.html
################################################################################

grafo <- graph_from_adjacency_matrix(matriz_de_adjacencia, mode='undirected', 
                                     weighted=TRUE)

################################################################################
# Existem várias formas de se exibir o grafo. Uma delas é utilizando o comando
# tkplot. Para facilitar a visualização dos rótulos, usei uma cor diferente 
# nos vértices e nos rótulos.
# Mais informações sobre a instrução podem ser obtidas no link a seguir
# https://igraph.org/r/doc/tkplot.html
################################################################################

tkplot(grafo, vertex.color="light green")

################################################################################
# Para calcular os graus do grafo, podemos usar a instrução degree.
# Mais informações sobre a instrução podem ser obtidas no link a seguir
# https://igraph.org/r/doc/degree.html
################################################################################

degree(grafo)

################################################################################
# Para calcular as proximidades do grafo, podemos usar a instrução closeness.
# Mais informações sobre a instrução podem ser obtidas no link a seguir
# https://igraph.org/r/doc/closeness.html
################################################################################

closeness(grafo)

################################################################################
# Na biblioteca igraph, temos algumas rotinas prontas para busca nos grafos.
# Uma delas é a busca em largura (breadth first search - bfs). Utilizando o 
# grafo definido anteriormente, defini como ponto de partida o nó SA do mapa
# da Austrália. Entre outras coisas, a função bfs retorna o caminho que foi 
# percorrido na busca.
# Mais informações sobre a instrução podem ser obtidas no link a seguir
# https://igraph.org/r/doc/bfs.html
################################################################################

bfs(grafo,"SA")

################################################################################
# Temos 4 cores possíveis. Vou definir como verde (green), vermelho (red),
# azul (blue) e amarelo (yellow), e armazenar essas possibilidades no vetor
# cores. Vou imprimir o vetor e plotar o grafo inteiro com as 4 cores para ter
# uma ideia de como fica. 
################################################################################

cores <- c('green', 'red', 'blue', 'yellow')
print(cores)

tkplot(grafo, vertex.color=cores[1])
tkplot(grafo, vertex.color=cores[2])
tkplot(grafo, vertex.color=cores[3])
tkplot(grafo, vertex.color=cores[4])
