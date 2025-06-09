Select * from `basedosdados.br_tse_eleicoes.receitas_candidato`
Limit 5;


SELECT
nome_candidato,
SUM (valor_receita) as Total_receita,
AVG(valor_receita) as Media_Receita,
Min (valor_receita) as Menor_receita,
Max (valor_receita) as Maior_receita
FROM `basedosdados.br_tse_eleicoes.receitas_candidato` 
Where cargo='governador' and sigla_partido='PT'
Group by nome_candidato
ORDER BY total_receita
LIMIT 50;

SELECT 
COUNT (DISTINCT cpf_cnpj_doador) AS QTD_doadores
from `basedosdados.br_tse_eleicoes.receitas_candidato`
where ano = 2018 and sigla_uf ='MT';

Select * from `basedosdados.br_tse_eleicoes.receitas_candidato`
Limit 5;

SELECT
Max(valor_receita) AS Maior_doacao,
Min(valor_receita) AS Menor_doacao
from `basedosdados.br_tse_eleicoes.receitas_candidato`
Where ano = 2018 and sigla_uf = 'SP';

Select
sigla_uf,
Count (Distinct cpf_cnpj_doador) AS Quantidade_doadores,
SUM(valor_receita) AS valor_doado,

Case When Count (Distinct cpf_cnpj_doador) > 100000 then 'Muitos doadores'
else 'Poucos doadores' end as Popularidade

from `basedosdados.br_tse_eleicoes.receitas_candidato`

Group BY sigla_uf

Having Quantidade_doadores < 200000
Order by valor_doado



