# Função de treinamento
trainadaline <- function (xin, yd, eta, tol, maxepocas, par)
  # xin =>  matriz com as amostras ja separadas, para treinamento do perceptron
  # yd => vetor y contendo a saida esperada para treinamento do perpectron
  # eta => peso para ajuste de cada iteração.
  # tol => erro permitido
  # maxepocas => maximo numero de iterações.
  # Par => determina se há necessidade de se incluir uma coluna de -1 no    vetor   de entrada. 
  
{
  
  dimxin<-dim(xin) # a função dim retorna o um par ordenado contendo o número o    número de linhas e colunas, respectivamente, da matriz que você passar para ela
  N<-dimxin [1] # número de linhas de Xin
  n<-dimxin [2] # número de coluas de Xin
  
  
  
  if (par==1){
    wt<-as.matrix(runif(n+1)-10^(-n-2)) #inicializa um vetor de n+1 elementos
    xin<-cbind(1,xin)
  }
  if (par==0){
    wt<-as.matrix(runif(n)-0.5) #inicializa um vetor de n+1 elementos
  }
  
  
  nepocas<-0 # nepocas receberá durante a exceução o número de iterações    realizadas
  eepoca<-tol+1 # eepoca receberá o erro médio do treinamento
  evec<-matrix(nrow=1,ncol=maxepocas ) #matriz de registro do erro de cada        iteração
  
  while  ((nepocas<maxepocas)&&(eepoca>tol)) #enquanto o erro for maior que o tolerado e o número máximo de iterações não for atingido, será feito:
    
  {
    ei2<-0 #variável auxiliar
    xseq<-sample(N) #sequencia aleatória de números para a realização do    treinamento
    
    for ( i in 1:N) # para cada linha de Xin, faça:
      
    {
      
      irand<- xseq [i] # linha a ser avaliada
      yhati<-xin[irand,] %*% wt # seleciona uma linha aleatoria, multiplica cada valor desta linha pelos pesos aleatorios gerados nas linhas 85 e 87 detse algoritmo, soma o resultado desses produtos e verifica se essa soma é maior do que zero.
      ei<-yd [irand]- yhati # erro obtido a partir da comparação do valor esperado para Y
      dw<-eta*ei*xin [irand,] #determinação do ajuste
      wt<-wt+dw #ajuste do pesso wt
      ei2<-ei2+ei*ei #atualização do erro desta iteração
    }
    
    
    nepocas<-nepocas+1 #incrementa o número de iterações
    evec [nepocas]<-ei2/N #cálculo do erro médio do treinamento
    eepoca<-evec [nepocas] #registro da evolução do erro
    
  }
  retlist <- list(wt ,evec[1:nepocas]) #retorno do melhor vetor de pesos obitidos   no treinamento
  return (retlist)
}
