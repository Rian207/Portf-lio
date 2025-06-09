Select * from `basedosdados.br_tse_eleicoes.receitas_candidato`
;

Select
SUM(valor_receita) AS Soma_das_receitas,
AVG(valor_receita) AS Media_de_receita,
Min(valor_receita) AS Menor_receita,
Max(valor_receita) AS Maior_receita
from `basedosdados.br_tse_eleicoes.receitas_candidato`;

Select
ano,
sigla_uf,
cpf_candidato,
nome_candidato,
nome_partido,
cargo,
valor_receita
from `basedosdados.br_tse_eleicoes.receitas_candidato`
Where 
Ano between 2018 and 2022 and sigla_uf != 'SP' and sigla_uf like 'S_' 
Order by sigla_uf Desc
;

Select
ano,
sigla_uf,
cpf_candidato,
nome_candidato,
nome_partido,
cargo,
valor_receita
from `basedosdados.br_tse_eleicoes.receitas_candidato`

WHERE
(ano = 2018 OR ano = 2022) AND sigla_uf = 'SP'
Order by ano Desc;