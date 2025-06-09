Select nome_candidato, cpf_candidato, sigla_partido,
SUM (valor_receita) AS Receita_Total
From `basedosdados.br_tse_eleicoes.receitas_candidato`
Where ano = 2018 and sigla_uf = 'RJ'
Group By 1, 2, 3
Order By 4 Desc
Limit 10;

Select * from `basedosdados.br_tse_eleicoes.receitas_candidato`
Limit 5;

-- Subconsultas -- 

Select sigla_partido, sum(Receita_Total) AS Receita_Partido, avg(receita_total) AS Receita_media,
MAX(receita_total) AS receita_max
from

(Select nome_candidato, cpf_candidato, sigla_partido,
SUM (valor_receita) AS Receita_Total
From `basedosdados.br_tse_eleicoes.receitas_candidato`
Where ano = 2018 and sigla_uf = 'RJ'
Group By 1, 2, 3
Order By 4 Desc
)

Group by 1
Order by 2 DESC;

Select cargo, sum(Receita_Total) AS Receita_Partido, 
avg(receita_total) AS Receita_media,
MAX(receita_total) AS receita_max
from

(Select nome_candidato, cpf_candidato,cargo, sigla_partido,
    SUM (valor_receita) AS Receita_Total
   From `basedosdados.br_tse_eleicoes.receitas_candidato`
   Where ano = 2018 and sigla_uf = 'RJ'
Group By 1, 2, 3, 4
Order By 4 Desc
)

Group by 1
Order by 2 DESC

