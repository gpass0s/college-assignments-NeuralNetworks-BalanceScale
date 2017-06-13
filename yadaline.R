# -----------------------------------------------
# Funcao que implementa um pecpetron simples

cat("\014")


yadaline <- function(xvec,w,par){
  # xvec => vetor de a entrada.
  # w => pesos de cada entrada.
  # par => determina se há necessidade de se incluir uma coluna de -1 no  vetor de entrada. 
  if(par==1){
    xvec<-cbind(1,xvec)}
  
  u<-xvec %*% w
  y<-u
  return ((as.matrix(y))) 
}


# -----------------------------------------------