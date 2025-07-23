nuevo_regimen <- function(tabla_mortalidad, x, r, e, tc, Sm, S, n, h) {
  
  #------------------------#
  # FUNCIONES INTERNAS     #
  #------------------------#
  
  ahorro_individual <- function(tabla_mortalidad, x, r, e, tc, Sm, Sf, n) {
    
    # Validaciones
    if (!is.numeric(x) || x %% 1 != 0 || x < 0)
      stop("x debe ser un entero no negativo")
    
    if (!is.data.frame(tabla_mortalidad) || !all(c("x", "qx") %in% names(tabla_mortalidad)))
      stop("tabla_mortalidad debe ser un data frame con columnas 'x' y 'qx'")
    
    if (any(!sapply(list(r, e, tc, Sm, Sf, n), is.numeric)))
      stop("r, e, tc, Sm, Sf y n deben ser numéricos")
    
    if (r < 0 || e <= 0 || tc < 0 || tc > 1)
      stop("Parámetros fuera de rango: r >= 0, e > 0, 0 <= tc <= 1")
    
    x_min <- min(tabla_mortalidad$x)
    omega <- max(tabla_mortalidad$x)
    if (x < x_min || x > omega)
      stop(paste("Edad", x, "fuera del rango de la tabla"))
    
    # Constantes
    i <- (1 + e) * (1 + r) - 1
    i12 <- 12 * ((1 + i)^(1/12) - 1)
    ve <- 1 / (1 + e)
    v <- 1 / (1 + i)
    
    # Valor futuro del fondo de ahorro
    VP12 <- (i / i12) * (1 - ve^n) / (e * (1 + r))
    VP <- (1 - ve^n) / (e * (1 + r))
    acum <- Sf * tc * ((12 * VP12) + VP) * (1 + e)^n
    
    # Probabilidades de supervivencia
    qx_vec <- tabla_mortalidad$qx[tabla_mortalidad$x >= x]
    px_vec <- 1 - qx_vec
    tpx <- cumprod(c(1, px_vec[-length(px_vec)]))  # Desde edad x
    
    # Seguro de vida Ax
    Ax <- sum(v^(1:(length(tpx))) * tpx * qx_vec, na.rm = TRUE)
    
    # Anualidad contingente ax_e
    ax_e <- if (x == omega) 0 else sum(ve^(1:(length(tpx) - 1)) * tpx[-1])
    
    # Valor presente de rentas mensuales y anuales
    VPx12 <- 12 * (ax_e / 24 * ((24 + 11 * r) / (1 + r)) + 11 / 24)
    VPx1 <- ax_e / (1 + r)
    VPx <- VPx12 + VPx1
    
    tr <- acum / (Sf * VPx)
    m <- Sf * tr
    
    return(c(tr = tr, monto = m))
  }
  
  prima_media <- function(n, S, Sm) {
    s <- S / Sm
    tr1 <- 65.5 - 0.5 * s
    
    if (n <= 1300) {
      return(tr1 / 100)
    } else {
      tr <- tr1 + 1.5 * (n - 1300) / 50
      if (n > 1800) tr <- tr1 + 15
      return(tr / 100)
    }
  }
  
  #------------------------#
  # CÁLCULO DEL MONTO FINAL #
  #------------------------#
  
  particion <- h * Sm
  S_pm <- min(S, particion)
  S_ai <- max(0, S - particion)

  m_ai <- if(S_ai == 0){
    0
  } else {
    ahorro_individual(tabla_mortalidad, x, r, e, tc, Sm, S_ai, n)["monto"]
  }

  if(S_pm == 0 ){
    tr_pm <- 0
  }
  else{
    tr_pm <- prima_media(n * 52, S_pm, Sm)
  }

  m_pm <- S_pm * tr_pm
  
  m_total <- m_ai + m_pm
  t_efectiva <- m_total/S

  return(m_total)
}