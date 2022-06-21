WITH nome_anterior AS (SELECT nome FROM classificacao WHERE codigo = codigo_pai), 
tabela_final AS (SELECT nome FROM classificacao WHERE codigo_pai IS NULL 
UNION ALL SELECT CONCAT (nome_anterior, ' --> ', nome) FROM classificacao) 
SELECT * FROM tabela_final;
