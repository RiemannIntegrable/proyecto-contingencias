acumulacion <- function(r, e, Sf, tc, n){

    # Validacion de datos
    if(!is.numeric(r) || !is.numeric(e) || !is.numeric(Sf) || !is.numeric(tc) || !is.numeric(n)){
        stop("Los datos deben ser numericos")
    }
    if(r < 0 || e < 0 || Sf < 0 || tc < 0 || n < 0){
        stop("Los datos deben ser positivos")
    }
    if(tc > 1) {
        stop("La tasa de cotizacion debe ser menor a 1")
    }
    if(e <= 0) {
        stop("El interes real debe ser positivo")
    }

    # Constantes necesarias
    i <- (1+e) * (1+r) - 1
    i12 <- 12*((1+i)^(1/12) - 1)
    ve <- 1/(1+e)

    # Acumulado del salario de 1
    VP12 <- (i/i12) * (1 - ve^n)/(e * (1+r))
    VP <- (1 - ve^n)/(e * (1+r))

    # Formulita de acumulación
    acum <- Sf * tc * ((12 * VP12) + VP) * (1+e)^n

    return(acum)
}