library(xml2)

# číselník stran

strany_xml <- read_xml("ciselniky/eprkl.xml")
strany_xml <- xml_ns_strip(strany_xml)
estrana <- as.numeric(xml_text(xml_find_all(strany_xml, ".//ESTRANA")))
zkratkae30 <- xml_text(xml_find_all(strany_xml, ".//ZKRATKAE30"))
strany <- data.frame(estrana, zkratkae30)

# číselník obcí

obce_xml <- read_xml("ciselniky/cisob.xml")
obce_xml <- xml_ns_strip(obce_xml)
obce_ciselnik <- xml_text(xml_find_all(obce_xml, ".//OBEC_PREZ"))


# výsledky v obcích

okresy <- list.files("ep2019/", "okres.")

for (i in okresy) {
  okres_xml <- read_xml(paste0("ep2019/", i))
  okres_xml <- xml_ns_strip(okres_xml)
  okres_souhrn_xml <- xml_find_all(okres_xml, ".//OKRES")
  nuts_okresu <- unlist(lapply(xml_attrs(okres_souhrn_xml), function(x) {return(x[1])}))
  nazev_okresu <- unlist(lapply(xml_attrs(okres_souhrn_xml), function(x) {return(x[2])}))

  
}



okres_xml <- read_xml(paste0("ep2019/", "okres_cz0425.xml"))
okres_xml <- xml_ns_strip(okres_xml)
obce_xml <- xml_find_all(okres_xml, ".//OBEC")
ucast_xml <- xml_find_all(okres_xml, ".//UCAST")


nazev_obce <- unlist(lapply(xml_attrs(obce_xml), function(x) {return(x[2])}))
cis_obce <- unlist(lapply(xml_attrs(obce_xml), function(x) {return(x[1])}))
zapsani_volici <- unlist(lapply(xml_attrs(ucast_xml), function(x) {return(x[4])}))
ucast_proc <- unlist(lapply(xml_attrs(ucast_xml), function(x) {return(x[6])}))
