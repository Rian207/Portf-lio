Select CURRENT_DATE();

SELECT
  date,
  EXTRACT(ISOYEAR FROM date) AS isoyear,
  EXTRACT(ISOWEEK FROM date) AS isoweek,
  EXTRACT(YEAR FROM date) AS year,
  EXTRACT(WEEK FROM date) AS week
FROM UNNEST(GENERATE_DATE_ARRAY('2015-12-23', '2016-01-09')) AS date
ORDER BY date;


SELECT data_filiacao,
Format_Date ( '%d/%m/%y', data_filiacao ) as data_filiacao_formatada,
Extract (DAYOFYEAR from data_filiacao) As dia,
from `basedosdados.br_tse_filiacao_partidaria.microdados`;

Select * from `basedosdados.br_tse_filiacao_partidaria.microdados`
limit 2;

Select data_filiacao, data_desfiliacao,
DATE_DIFF(date '2018-10-07', data_filiacao, Day) as periodo_filiacao
from `basedosdados.br_tse_filiacao_partidaria.microdados`
Where data_desfiliacao is not null and extract (year from data_filiacao) = 2018 and extract (month from data_filiacao) <=10 and extract (day from data_filiacao) <7
Order by periodo_filiacao
