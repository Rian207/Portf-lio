SELECT*, left (id_municipio, 2) AS ID_UF
FROM `basedosdados.br_tse_eleicoes.candidatos` 
Where ano >= 2014 and id_municipio is not null
LIMIT 10

Select *, 
CONCAT(numero, '-', nome_urna)
from `basedosdados.br_tse_eleicoes.candidatos` 
Where ano >=2014
Limit 10;

Select * from `basedosdados.br_tse_eleicoes.candidatos` 
Where CONTAINS_SUBSTR(nome_urna, "Lula") = True and CONTAINS_SUBSTR(nome, "Lula") = false and ano = 2006
