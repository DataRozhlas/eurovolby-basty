library(jsonlite)
library(dplyr)

vysledky <- fromJSON("vys2019.json")



ucast_proc <- lapply(vysledky, function(x) {
  unlist(x["UCAST_PROC"])
})
ucast_proc <- as.numeric(ucast_proc)

zapsani_volici <- lapply(vysledky, function(x) {
  unlist(x["ZAPSANI_VOLICI"])
})
zapsani_volici <- as.numeric(zapsani_volici)

obec <- lapply(vysledky, function(x) {
  unlist(x["naz"])
})
obec <- as.character(obec)

okres <- lapply(vysledky, function(x) {
  unlist(x["okres"])
})
okres <- as.character(okres)

ucast <- data.frame(obec, okres, zapsani_volici, ucast_proc)

ucast %>%
  arrange(desc(ucast_proc), desc(zapsani_volici))

# srovnání číselníků
obce_vysledky <- names(vysledky)

obce_ciselnik[!obce_ciselnik %in% obce_vysledky]

#bašty ANO
ano <- lapply(vysledky, function(x) {
  if (length(x[["30"]]["PROC_HLASU"]) > 0) {
    return(unlist(x[["30"]]["PROC_HLASU"]))
  } else {
    return(0)
  }
})
ano <- as.numeric(unlist(ano))

ano <- data.frame(obec, okres, zapsani_volici, ano)

ano %>%
  arrange(ano, desc(zapsani_volici))

#bašty ODS
ods <- lapply(vysledky, function(x) {
  if (length(x[["5"]]["PROC_HLASU"]) > 0) {
    return(unlist(x[["5"]]["PROC_HLASU"]))
  } else {
    return(0)
  }
})
ods <- as.numeric(unlist(ods))

ods <- data.frame(obec, okres, zapsani_volici, ods)

ods %>%
  arrange(ods, desc(zapsani_volici))

#bašty Piráti
pirati <- lapply(vysledky, function(x) {
  if (length(x[["27"]]["PROC_HLASU"]) > 0) {
    return(unlist(x[["27"]]["PROC_HLASU"]))
  } else {
    return(0)
  }
})
pirati <- as.numeric(unlist(pirati))

pirati <- data.frame(obec, okres, zapsani_volici, pirati)

pirati %>%
  arrange(pirati, desc(zapsani_volici))

#bašty STAN
stan <- lapply(vysledky, function(x) {
  if (length(x[["26"]]["PROC_HLASU"]) > 0) {
    return(unlist(x[["26"]]["PROC_HLASU"]))
  } else {
    return(0)
  }
})
stan <- as.numeric(unlist(stan))

stan <- data.frame(obec, okres, zapsani_volici, stan)

stan %>%
  arrange(desc(stan), desc(zapsani_volici))

#bašty SPD
spd <- lapply(vysledky, function(x) {
  if (length(x[["28"]]["PROC_HLASU"]) > 0) {
    return(unlist(x[["28"]]["PROC_HLASU"]))
  } else {
    return(0)
  }
})
spd <- as.numeric(unlist(spd))

spd <- data.frame(obec, okres, zapsani_volici, spd)

spd %>%
  arrange(spd, desc(zapsani_volici))

#bašty KDU-ČSL
kdu_csl <- lapply(vysledky, function(x) {
  if (length(x[["39"]]["PROC_HLASU"]) > 0) {
    return(unlist(x[["39"]]["PROC_HLASU"]))
  } else {
    return(0)
  }
})
kdu_csl <- as.numeric(unlist(kdu_csl))

kdu_csl <- data.frame(obec, okres, zapsani_volici, kdu_csl)

kdu_csl %>%
  arrange(desc(kdu_csl), desc(zapsani_volici))

#bašty KSČM
kscm <- lapply(vysledky, function(x) {
  if (length(x[["9"]]["PROC_HLASU"]) > 0) {
    return(unlist(x[["9"]]["PROC_HLASU"]))
  } else {
    return(0)
  }
})
kscm <- as.numeric(unlist(kscm))

kscm <- data.frame(obec, okres, zapsani_volici, kscm)

kscm %>%
  arrange(kscm, desc(zapsani_volici))

#bašty ČSSD
cssd <- lapply(vysledky, function(x) {
  if (length(x[["7"]]["PROC_HLASU"]) > 0) {
    return(unlist(x[["7"]]["PROC_HLASU"]))
  } else {
    return(0)
  }
})
cssd <- as.numeric(unlist(cssd))

cssd <- data.frame(obec, okres, zapsani_volici, cssd)

cssd %>%
  arrange(desc(cssd), desc(zapsani_volici))

#bašty ANO, vytrollíme
vytrollime <- lapply(vysledky, function(x) {
  if (length(x[["6"]]["PROC_HLASU"]) > 0) {
    return(unlist(x[["6"]]["PROC_HLASU"]))
  } else {
    return(0)
  }
})
vytrollime <- as.numeric(unlist(vytrollime))

vytrollime <- data.frame(obec, okres, zapsani_volici, vytrollime)

vytrollime %>%
  arrange(vytrollime, desc(zapsani_volici))
