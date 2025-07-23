prima_media <- function(n, S, Sm){
    
    s <- S/Sm

    tr1 <- 65.5 - 0.5*s
    
    if (n <= 1300){
        return(tr1/100)
    }
    else{
        tr <- tr1 + 1.5*(n-1300)/50

        if(n > 1800){
            tr <- tr1 + 15
        }

        return(tr/100)
    }
}