# RESPOSTA 1
SELECT numero_departamento, avg(salario) 
FROM funcionario 
GROUP BY numero_departamento;

# RESPOSTA 2
SELECT sexo, avg(salario) 
FROM funcionario 
GROUP BY sexo;

# RESPOSTA 3
SELECT nome_departamento, CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome) AS nome_completo , data_nascimento, 
TIMESTAMPDIFF(YEAR, data_nascimento, curdate()) AS idade, salario 
FROM departamento, funcionario 
WHERE departamento.numero_departamento = funcionario.numero_departamento 
ORDER BY departamento.numero_departamento;

# RESPOSTA 4
SELECT CONCAT(primeiro_nome," ", nome_meio,". ", ultimo_nome) AS nome_completo, TIMESTAMPDIFF(YEAR, data_nascimento, curdate()) AS idade, salario, 
CASE WHEN salario<35000 THEN salario * 1.2 WHEN salario >= 35000 THEN salario * 1.15 END AS salario_com_reajuste 
FROM funcionario;

# RESPOSTA 5
WITH gerente AS (SELECT funcionario.primeiro_nome AS nome_gerente, funcionario.cpf AS gerente_cpf_1, departamento.cpf_gerente AS gerente_cpf_2,
funcionario.numero_departamento AS gerente_numero_departamento 
FROM funcionario, departamento WHERE funcionario.cpf = departamento.cpf_gerente) 
SELECT nome_departamento, nome_gerente, primeiro_nome AS funcionario 
FROM departamento, funcionario, gerente 
WHERE departamento.numero_departamento = funcionario.numero_departamento AND funcionario.numero_departamento = gerente_numero_departamento 
ORDER BY nome_departamento, salario DESC;

# RESPOSTA 6
SELECT CONCAT(primeiro_nome," ", nome_meio,". ", ultimo_nome) AS nome_completo, numero_departamento, 
CONCAT(nome_dependente," ", nome_meio, ". ", ultimo_nome) AS nome_completo_dependente, 
TIMESTAMPDIFF(YEAR, dependente.data_nascimento, curdate()) AS idade_dependente,
CASE dependente.sexo WHEN 'M' THEN 'Masculino' ELSE 'Feminino' END AS sexo_dependente  
FROM funcionario, dependente 
WHERE funcionario.cpf = dependente.cpf_funcionario;

# RESPOSTA 7
SELECT DISTINCT CONCAT(primeiro_nome, " ", nome_meio,". ", ultimo_nome) AS nome_completo, numero_departamento, salario 
FROM funcionario, dependente 
EXCEPT SELECT DISTINCT CONCAT(primeiro_nome, " ", nome_meio,". ", ultimo_nome) AS nome_completo, numero_departamento, salario 
FROM funcionario, dependente 
WHERE funcionario.cpf = dependente.cpf_funcionario;

# RESPOSTA 8
SELECT nome_departamento, nome_projeto, CONCAT(primeiro_nome, " ", nome_meio,". ", ultimo_nome) AS nome_completo, horas 
FROM departamento, projeto, funcionario, trabalha_em 
WHERE departamento.numero_departamento = projeto.numero_departamento
AND departamento.numero_departamento = funcionario.numero_departamento 
AND trabalha_em.cpf_funcionario = funcionario.cpf 
AND projeto.numero_projeto = trabalha_em.numero_projeto 
ORDER BY nome_completo;

# RESPOSTA 9
SELECT nome_departamento, nome_projeto, SUM(horas) AS soma_horas 
FROM departamento, projeto, trabalha_em 
WHERE departamento.numero_departamento = projeto.numero_departamento 
AND projeto.numero_projeto = trabalha_em.numero_projeto 
GROUP BY trabalha_em.numero_projeto;

# RESPOSTA 10
SELECT numero_departamento, avg(salario) 
FROM funcionario 
GROUP BY numero_departamento;

# RESPOSTA 11
SELECT CONCAT(primeiro_nome, " ", nome_meio,". ", ultimo_nome) AS nome_completo, nome_projeto, horas*50 AS valor_total 
FROM funcionario, projeto, trabalha_em
WHERE projeto.numero_projeto = trabalha_em.numero_projeto 
AND funcionario.cpf = trabalha_em.cpf_funcionario;

# REPOSTA 12
SELECT nome_departamento, nome_projeto, CONCAT(primeiro_nome, " ", nome_meio,". ", ultimo_nome) AS nome_completo
FROM departamento, projeto, funcionario, trabalha_em 
WHERE departamento.numero_departamento = projeto.numero_departamento
AND departamento.numero_departamento = funcionario.numero_departamento
AND projeto.numero_projeto = trabalha_em.numero_projeto
AND trabalha_em.horas = 0;

# RESPOSTA 13
SELECT CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome) AS presenteados, sexo, TIMESTAMPDIFF(YEAR, data_nascimento, curdate()) AS idade
FROM funcionario
UNION SELECT CONCAT (nome_dependente," ", nome_meio,". ", ultimo_nome) AS presenteado, dependente.sexo, 
TIMESTAMPDIFF (YEAR, dependente.data_nascimento, curdate()) AS idade
FROM dependente, funcionario 
WHERE dependente.cpf_funcionario = funcionario.cpf
ORDER BY idade DESC;

# RESPOSTA 14
SELECT nome_departamento, COUNT(funcionario.numero_departamento) AS numero_de_funcionarios 
FROM departamento, funcionario 
WHERE departamento.numero_departamento = funcionario.numero_departamento 
GROUP BY nome_departamento;

# RESPOSTA 15
SELECT CONCAT(primeiro_nome, " ", nome_meio, ". ", ultimo_nome) AS nome_completo_funcionario, funcionario.numero_departamento, nome_projeto 
FROM funcionario, projeto
WHERE funcionario.numero_departamento = projeto.numero_departamento;
