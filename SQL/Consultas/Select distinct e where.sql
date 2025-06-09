SELECT * FROM `basedosdados.br_poder360_pesquisas.microdados` LIMIT 1000;

Select DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
Where ano >= 2014 and sigla_partido != 'N/A' and sigla_partido != 'sem partido'
Order by sigla_partido DESC;

Select DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
Where ano >= 2014 and not sigla_partido = 'N/A' and not sigla_partido = 'sem partido'
Order by sigla_partido DESC;

Select DISTINCT sigla_partido
FROM `basedosdados.br_poder360_pesquisas.microdados`
Where ano between 2014 and 2020
Order by sigla_partido DESC;

Select * from `basedosdados.br_poder360_pesquisas.microdados` 
Where sigla_uf IN('SP', 'MG', 'RJ')
Order by ano, sigla_uf, nome_municipio
Limit 100;

Select * from `basedosdados.br_poder360_pesquisas.microdados` 
Where sigla_partido like 'P_' and not sigla_partido = 'N/A' and not sigla_partido = 'sem partido'
Limit 100



