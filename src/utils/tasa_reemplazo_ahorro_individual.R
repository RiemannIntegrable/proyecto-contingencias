ahorro_individual <- function(tabla_mortalidad, x, r, e, tc, Sm, Sf, n){

    # Validacion de datos
    if(!is.numeric(x) || x %% 1 != 0 || x < 0){
        stop("x debe ser un entero no negativo")
    }
    if(!is.data.frame(tabla_mortalidad) || !all(c("x", "qx") %in% names(tabla_mortalidad))){
        stop("tabla_mortalidad debe ser un data frame con columnas 'x' y 'qx'")
    }
    if(!is.numeric(r) || r < 0){
        stop("r debe ser un numero no negativo")
    }
    if(!is.numeric(e) || e <= 0){
        stop("e debe ser un numero positivo")
    }
    if(!is.numeric(tc) || tc < 0){
        stop("tc debe ser un numero no negativo")
    }
    if(tc > 1) {
        stop("La tasa de cotizacion debe ser menor a 1")
    }
    
    x_min <- min(tabla_mortalidad$x)
    omega <- max(tabla_mortalidad$x)
    
    if(x < x_min || x > omega){
        stop(paste("Edad", x, "esta fuera del rango de la tabla"))
    }

    # Constantes requeridas
    i <- (1+e) * (1+r) - 1
    i12 <- 12*((1+i)^(1/12) - 1)
    ve <- 1/(1+e)
    v <- 1/(1+i)

    # Acumulado del salario de 1
    VP12 <- (i/i12) * (1 - ve^n)/(e * (1+r))
    VP <- (1 - ve^n)/(e * (1+r))
    VF <- ((12 * VP12) + VP) * (1+i)^n

    # Formulita de acumulación
    acum <- Sf * tc * ((12 * VP12) + VP) * (1+e)^n
    
    # Vectorizacion de probabilidades de mortalidad
    inicio <- which(tabla_mortalidad$x == x)
    fin <- nrow(tabla_mortalidad)
    
    qx_vec <- tabla_mortalidad$qx[inicio:fin]
    px_vec <- 1 - qx_vec
    
    # Probabilidades de supervivencia acumuladas
    rango_años <- length(qx_vec)
    tpx <- numeric(rango_años)
    tpx[1] <- 1
    
    # Calcular todas las probabilidades de supervivencia primero
    if(x < omega){
        for(k in 2:rango_años){
            tpx[k] <- tpx[k-1] * px_vec[k-1]
        }
    }

    # Seguro de vida entero: Ax
    Ax <- sum(sapply(0:(omega-x), function(k) {
        if(k+1 <= length(tpx) && k+1 <= length(qx_vec)){
            v^(k+1) * tpx[k+1] * qx_vec[k+1]
        } else {
            0
        }
    }))

    # Calculo de ax_e (anualidad contingente)
    if(x == omega){
        ax_e <- 0
    } else {
        ax_e <- sum(sapply(1:(omega-x), function(k) {
            if(k+1 <= length(tpx)){
                ve^k * tpx[k+1]
            } else {
                0
            }
        }))
    }
    
    # Calculo VPx12 (valor presente renta contingente mensual)
    VPx12 <- 12*(ax_e/24 * ((24+11*r)/(1+r)) + 11/24)
    
    # Calculo VPx1 (valor presente renta contingente anual)
    VPx1 <- ax_e / (1 + r) 
    VPx <- VPx12 + VPx1

    # Calcular auxilio funerario
    AF <- pmin(pmax(Sf, 5 * Sm), 10 * Sm)
    A12 <- (i/i12) * Ax

    # Tasa de remplazo
    tr <- (acum - AF*A12)/ (Sf*VPx)

    m <- Sf * tr

    return(c(tr, m))
}