# workspace - 20181212

# Anlegen von Matrix y, in der alle CpGs mit positiver Anzahl an Reads mit logischem Wert hinterlegt werden
y <- apply(x, 1, function(x) x > 0)

# Summe aller positiven Reads für jede Probe
colSums(y)

# Teilen durch die Anzahl der CpGs
chromosomal_coverage <- colSums(y / 558056)
chromosomal_coverage
# scBS_A_001   scBS_A_002   scBS_A_003   scBS_A_004   scBS_A_005   scBS_A_006   scBS_A_007   scBS_A_008   scBS_A_009 
#0.0002024886 0.0112479751 0.0485847298 0.0214852990 0.0412987227 0.1461143685 0.2937088751 0.0315380535 0.0307227232 
#scBS_A_010   scBS_A_011   scBS_A_012   scBS_A_013   scBS_A_014   scBS_A_015   scBS_A_016   scBS_A_017   scBS_A_018 
#0.0724049199 0.0192364207 0.0415549694 0.0325092822 0.0317262067 0.0208921685 0.0134717663 0.0082661955 0.0289630431 
#scBS_A_019   scBS_A_020   scBS_A_021   scBS_A_022   scBS_A_023   scBS_A_024 
#0.0135147727 0.0317226228 0.1150278825 0.0310327279 0.0264991327 0.2008812736

# dataframe erstellen, der die Matrix chromosomal_coverage als Spalten enthält
df_b <- data.frame(samples, coverage)

# df_b nach der Spalte Coverage umsortieren 
df_b <- df_b[order(df_b$Coverage), ]
cha <- as.character(df_b$samples)
df_b$samples <- factor(cha, levels = cha)

#Barplot erstellen, der die prozentuale Coverage der einzelnen Proben zeigt

coverage_barplot <- ggplot(df_b) + aes_string(x = "Samples", y = "Coverage") + 
geom_bar(fill = "steelblue", stat = "identity", size = 6) + coord_flip() + 
scale_y_continuous(expand = c(0,0)) + theme_bw()

#dfa definieren

covered_CpGs <- colSums(y)
dfa <- data.frame(samples, covered_CpGs)
rownames(dfa) <- c(1:24)

# dfa sortieren nach der Spalte covered_CpGs

dfa <- dfa[order(dfa$covered_CpGs), ]
cha <- as.character(dfa$samples)
dfa$samples <- factor(cha, levels = cha)


#Barplot erstellen, der die Anzahl der gecoverten CpGs für jede Probe zeigt

coverage_barplot <- ggplot(dfa) + aes_string(x = "samples", y = "covered_CpGs") + 
  geom_bar(fill = "steelblue", stat = "identity", size = 6) + coord_flip() +
  scale_y_log10(expand = c(0,0)) + theme_bw() + labs(y = "Number of covered CpGs", x = NULL, title = "Coverage per Sample")




