#TJSP - Tutela de Urgência TOTVS

library(tidyverse)
library(tjsp)


# Baixando e Lendo Processos ----------------------------------------------


camaras_dir_priv <- "0-437,0-507,0-441,0-679,0-1177,0-1211,0-1212,0-548,0-610,0-611,0-1214,0-598,0-612,0-1161,0-1162,0-1163,0-613,0-1167,0-1224,0-614,0-1168,0-1225,0-1170,0-1226,0-599,0-678,0-1029,0-39,0-145,0-1158,0-1160,0-196,0-1014,0-615,0-1234,0-40,0-146,0-172,0-686,0-616,0-1235,0-42,0-147,0-173,0-197,0-617,0-1236,0-43,0-148,0-174,0-198,0-206,0-618,0-45,0-149,0-175,0-207,0-619,0-600,0-1197,0-46,0-150,0-176,0-199,0-620,0-48,0-151,0-177,0-1015,0-621,0-49,0-152,0-178,0-622,0-51,0-153,0-179,0-623,0-52,0-154,0-180,0-200,0-624,0-54,0-155,0-181,0-221,0-208,0-1016,0-625,0-55,0-156,0-182,0-626,0-1273,0-1275,0-601,0-602,0-1026,0-1027,0-603,0-1021,0-604,0-605,0-606,0-1176,0-1210,0-607,0-1140,0-657,0-658,0-661,0-662,0-659,0-660,0-903,0-1153,0-681,0-656,0-655,0-1198,0-1311,0-1305,0-1306,0-1307,0-911,0-914,0-648,0-494,0-651,0-497,0-652,0-498,0-495,0-654,0-653,0-499,0-650,0-496,0-1080,0-1281,0-912,0-2,0-219,0-1007,0-1195,0-1149,0-1,0-15,0-201,0-548,0-1220,0-1221,0-1033,0-3,0-1150,0-4,0-1231,0-1250,0-5,0-124,0-981,0-7,0-1276,0-1277,0-6,0-125,0-1034,0-1205,0-10,0-8,0-126,0-1184,0-1206,0-13,0-9,0-127,0-1035,0-11,0-128,0-998,0-12,0-129,0-1036,0-14,0-130,0-1002,0-1140,0-1157,0-1136,0-901,0-1153,0-1137,0-1179,0-1151,0-1198,0-1311,0-1305,0-1306,0-1307,0-911,0-914,0-649,0-946,0-1078,0-1291,0-912,0-400,0-536,0-554,0-555,0-1171,0-586,0-575,0-527,0-523,0-516,0-545,0-569,0-585,0-1173,0-29,0-517,0-1094,0-1095,0-18,0-131,0-157,0-183,0-1024,0-546,0-570,0-571,0-548,0-32,0-19,0-132,0-158,0-184,0-1169,0-547,0-572,0-35,0-519,0-21,0-133,0-159,0-185,0-980,0-992,0-1185,0-520,0-22,0-134,0-160,0-186,0-521,0-24,0-135,0-161,0-187,0-993,0-1222,0-522,0-25,0-136,0-162,0-188,0-202,0-1223,0-27,0-1187,0-137,0-163,0-189,0-28,0-138,0-164,0-190,0-1025,0-30,0-139,0-165,0-191,0-697,0-1023,0-508,0-631,0-630,0-537,0-556,0-1172,0-1175,0-1196,0-587,0-576,0-528,0-524,0-31,0-140,0-166,0-203,0-698,0-33,0-141,0-167,0-192,0-204,0-970,0-1233,0-34,0-142,0-168,0-193,0-1237,0-36,0-143,0-169,0-194,0-997,0-1238,0-37,0-144,0-170,0-195,0-205,0-1181,0-1232,0-1251,0-509,0-1087,0-629,0-538,0-557,0-574,0-588,0-1174,0-577,0-529,0-1074,0-525,0-1269,0-1270,0-1271,0-1272,0-1274,0-1183,0-1182,0-510,0-539,0-558,0-559,0-590,0-578,0-530,0-526,0-511,0-1088,0-1089,0-540,0-560,0-561,0-591,0-579,0-531,0-512,0-1090,0-1091,0-374,0-541,0-562,0-563,0-1207,0-592,0-580,0-532,0-17,0-1073,0-513,0-1092,0-1093,0-542,0-564,0-1208,0-581,0-533,0-20,0-514,0-543,0-565,0-566,0-1209,0-582,0-534,0-23,0-515,0-386,0-544,0-567,0-568,0-583,0-535,0-26,0-1140,0-552,0-593,0-902,0-551,0-1153,0-549,0-550,0-594,0-1198,0-1311,0-1305,0-1306,0-1307,0-911,0-914,0-1018,0-553,0-1079,0-1281,0-912"

agravo_de_instrumento <- "1208,203,206,202,204"

# Resolução do contrato

#tjsp::tjsp_baixar_cjsg(livre = "suspensão da cobrança resolução contrato NAO expurgos",
 #                      classe = agravo_de_instrumento,
  #                     orgao_julgador = camaras_dir_priv,
   #                    diretorio = "data_raw/jurisprudencia" )

resolucao_contrato_raw <- tjsp::tjsp_ler_cjsg(diretorio = "data_raw/jurisprudencia" )


resolucao_contrato <- resolucao_contrato_raw %>%
  mutate(termo_pesquisa_tjsp= "Resolução")




# Resilição do contrato

#tjsp::tjsp_baixar_cjsg(livre = "suspensão da cobrança resilição contrato NAO expurgos",
 #                      classe = agravo_de_instrumento,
  #                     orgao_julgador = camaras_dir_priv,
   #                    diretorio = "data_raw/resilição/jurisprudencia" )

resilicao_contrato_raw <- tjsp::tjsp_ler_cjsg(diretorio = "data_raw/resilição/jurisprudencia" )

resilicao_contrato <- resilicao_contrato_raw %>%
  mutate(termo_pesquisa_tjsp = "Resilição")

# Rescisão do contrato

#tjsp::tjsp_baixar_cjsg(livre = "suspensão da cobrança rescisão contrato NAO expurgos",
 #                      classe = agravo_de_instrumento,
  #                     orgao_julgador = camaras_dir_priv,
   #                    diretorio = "data_raw/rescisão/jurisprudencia" )


rescisao_contrato_raw <- tjsp::tjsp_ler_cjsg(diretorio = "data_raw/rescisão/jurisprudencia" )

rescisao_contrato <- resilicao_contrato_raw %>%
  mutate(termo_pesquisa_tjsp = "Rescisão")



# Joining -----------------------------------------------------------------

res_join<- full_join(resolucao_contrato, resilicao_contrato) %>%
  full_join(rescisao_contrato)




#Classificando

res_join_classificado <- res_join %>%
    mutate(ementa= str_to_lower(ementa),
           tema =case_when(
             str_detect(ementa, "im[óo]ve|imobili[aá]ri") ~ "Imóvel",
             str_detect(ementa, "cumprimento( definitivo)* de sentença") ~ "Cumprimento de Sentença",
             str_detect(ementa, "execu[çc][ãa]o de t[íi]tulo extrajudicial") ~ "Execução de Título Extrajudicial",
             str_detect(ementa, "penhora") ~ "Penhora",
             str_detect(ementa, "plano de sa[úu]de") ~ "Plano de Saúde",
             str_detect(ementa, "recuperação (extra)*judicial|fal(êe)ncia") ~ "Rec. Judicial e Falências",
             str_detect(ementa, "plano de sa[úu]de") ~ "Plano de Saúde",
             str_detect(ementa, "locação") ~ "Locação",
             str_detect(ementa, "banco|bancário") ~ "Bancários",
             str_detect(ementa, "Consignado") ~ "Consignado",
             TRUE ~ "Outros"),
            mencao_liminar = case_when(
              str_detect(ementa, "tutela( provis[óo]ria)* de urg[êe]ncia") ~ "Tutela de Urgência",
              str_detect(ementa, "urg[êe]ncia") ~ "Urgência",
              str_detect(ementa, "fumus|fumaça") ~ "Fumus Bonus Iuris",
              str_detect(ementa, "periculum in mora|perigo na demora|perigo de dano") ~ "Periculum in Mora",
              str_detect(ementa, "liminar") ~ "Liminar",
              str_detect(ementa, "provisória") ~ "Provisória",
              str_detect(ementa, "incidental") ~ "Incidental",
              TRUE ~ "Sem Menção"),
           mencao_contratos = case_when(
              str_detect(ementa, "revis[ãa]o|revisional") ~ "Revisional",
              str_detect(ementa, "consignação") ~ "Consignação em  Pagamento",
              str_detect(ementa, "resolu[çc][ãa]o") ~ "Resolução",
              str_detect(ementa, "resili[çc][ãa]o") ~ "Resilição",
              str_detect(ementa, "rescis[aã]o") ~ "Resilição",
              TRUE ~ "Sem Menção"),
           mencao_inadimplemento = case_when(
             str_detect(ementa, )
           )
           )

table(res_join_classificado $ tema)


res_join_filtrado<- res_join_classificado %>%
  filter(tema == "Outros")


table(res_join $ tema)



#vai tomar no cu para dentro
