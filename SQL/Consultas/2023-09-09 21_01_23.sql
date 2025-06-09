SELECT  * FROM `basedosdados.br_tse_eleicoes.bens_candidato` LIMIT 
5;

Select id_candidato_bd,
SUM (valor_item ) AS bens_totais
from `basedosdados.br_tse_eleicoes.bens_candidato` 
Where ano = 2018 and sigla_uf = 'BA'
Group by id_candidato_bd 
Order by bens_totais Desc;

Select * from  `basedosdados.br_tse_eleicoes.candidatos`
Where id_candidato_bd   >   '0'
Limit 5;

-- Join Explícito
Select bens.id_candidato_bd , cands.nome_urna,
SUM (valor_item ) AS bens_totais
from `basedosdados.br_tse_eleicoes.bens_candidato`      AS bens Join 
`basedosdados.br_tse_eleicoes.candidatos` AS cands
On bens.id_candidato_bd = cands.id_candidato_bd
Where  bens.ano = 2018 and bens.sigla_uf = 'BA' and cands.cargo= 'governador' and cands.ano = 2018
Group by id_candidato_bd , cands.nome_urna
Order by bens_totais Desc;

-- Join Implícito
Select bens.id_candidato_bd , cands.nome_urna,
SUM (valor_item ) AS bens_totais
from `basedosdados.br_tse_eleicoes.bens_candidato`      AS bens, 
`basedosdados.br_tse_eleicoes.candidatos` AS cands
Where  bens.ano = 2018 and bens.sigla_uf = 'BA' and cands.cargo= 'governador' and cands.ano = 2018
Group by id_candidato_bd , cands.nome_urna
Order by bens_totais Desc;

