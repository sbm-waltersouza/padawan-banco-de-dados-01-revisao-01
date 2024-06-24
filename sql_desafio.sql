use db_revisao;

select * from atribuicoes;
select * from funcionarios;
select * from projetos;

-- inicio dos desafios
/* Desafios de Consultas SQL */
/* Básico */

/* Selecione todos os funcionários. */
SELECT * FROM funcionarios;

/* Selecione os projetos com suas descrições. */
SELECT nome, descricao FROM projetos;

/* Selecione os funcionários com salário maior que 5000. */
SELECT * FROM funcionarios WHERE salario > 5000;

/* Conte o número total de funcionários. */
SELECT COUNT(nome) FROM funcionarios;

/* Selecione os projetos que começam depois de '2023-01-01'. */
SELECT * FROM projetos WHERE data_inicio > '2023-01-01';

/* Ordene os funcionários por idade em ordem crescente. */
SELECT * FROM funcionarios ORDER BY idade ASC;

/* Selecione os funcionários cujo nome começa com 'A'. */
SELECT * FROM funcionarios WHERE nome LIKE 'a%';

/* Conte quantos projetos estão na tabela. */
SELECT COUNT(nome) FROM projetos;

/* Selecione os projetos que ainda não começaram. */
SELECT * FROM projetos WHERE data_inicio < '2023-01-01';

/* Conte quantos funcionários têm mais de 35 anos. */
SELECT COUNT(nome) FROM funcionarios WHERE idade > 35;

/* Intermediário */

/* Liste os funcionários com seus respectivos projetos atribuídos. */
SELECT funcionarios.nome AS NomeFuncionario, projetos.nome AS NomeProjeto, atribuicoes.papel
FROM atribuicoes
JOIN funcionarios ON atribuicoes.id_funcionario = funcionarios.id
JOIN projetos ON atribuicoes.id_projeto = projetos.id;


/* Liste os projetos com a contagem de funcionários atribuídos a cada um. */
SELECT projetos.nome AS NomeProjeto, COUNT(atribuicoes.id_funcionario) AS ContagemFuncionarios
FROM projetos
LEFT JOIN atribuicoes ON projetos.id = atribuicoes.id_projeto
GROUP BY projetos.nome;



/* Selecione os funcionários que estão atribuídos ao projeto 'Projeto A'. */
SELECT funcionarios.nome AS NomeFuncionarios
FROM atribuicoes
JOIN funcionarios ON atribuicoes.id_funcionario = funcionarios.id
JOIN projetos ON atribuicoes.id_projeto = projetos.id
WHERE projetos.nome = 'Projeto A';



/* Liste os funcionários ordenados pelo salário em ordem decrescente. */
SELECT *
FROM funcionarios
ORDER BY salario DESC;



/* Selecione os projetos com descrição que contenha a palavra 'banco'. */
SELECT *
FROM projetos
WHERE descricao LIKE '%banco%';



/* Liste os funcionários e seus salários, arredondados para duas casas decimais. */
SELECT nome, ROUND(salario, 2) AS SalarioArredondado
FROM funcionarios;


/* Selecione os projetos que terminam antes de '2023-07-01'. */
SELECT *
FROM projetos
WHERE data_fim < '2023-07-01';



/* Liste os funcionários com idade entre 25 e 30 anos. */
SELECT * 
FROM funcionarios
WHERE idade BETWEEN 25 AND 30;



/* Selecione os projetos onde nenhum funcionário foi atribuído. */
SELECT projetos.*
FROM projetos
LEFT JOIN atribuicoes ON projetos.id = atribuicoes.id_projeto
WHERE atribuicoes.id_projeto IS NULL;



/* Liste os funcionários que não estão atribuídos a nenhum projeto. */
SELECT funcionarios.*
FROM funcionarios
LEFT JOIN atribuicoes ON funcionarios.id = atribuicoes.id_funcionario
WHERE atribuicoes.id_funcionario IS NULL;


/* Avançado */
/* Selecione os funcionários que estão atribuídos a mais de um projeto. */
SELECT funcionarios.nome, COUNT(atribuicoes.id_projeto) AS NumProjetos
FROM funcionarios
JOIN atribuicoes ON funcionarios.id = atribuicoes.id_funcionarios
GROUP BY funcionarios.id
HAVING COUNT(atribuicoes.id_projeto) > 1;




/* Liste os projetos com a média de idade dos funcionários atribuídos. */
SELECT projetos.nome AS NomeProjeto, AVG(funcionarios.idade) AS MediaIdade
FROM projetos
JOIN atribuicoes ON projetos.id = atribuicoes.id_projeto
JOIN funcionarios ON atribuicoes.id_funcionario = funcionarios.id
GROUP BY projetos.id;


/* Selecione os funcionários que são gerentes de projeto. */
SELECT funcionarios.nome
FROM funcionarios
JOIN atribuicoes ON funcionarios.id = atribuicoes.id_funcionario
WHERE atribuicoes.papel = 'Gerente de Projeto';

/* Liste os projetos com a maior e a menor data de término. */
SELECT MAX(data_fim) AS MaiorDataFim, MIN(data_fim) AS MenorDataFim
FROM projetos;


/* Selecione os funcionários que têm o mesmo salário. */
SELECT f1.nome, f1.salario
FROM funcionarios f1
JOIN funcionarios f2 on f1.salario = f2.salario and f1.id <> f2.id;


/* Liste os projetos que têm funcionários com idade média superior a 30 anos. */
SELECT projetos.nome
FROM projetos
JOIN atribuicoes ON projetos.id = atribuicoes.id_projeto
JOIN funcionarios ON atribuicoes.id_funcionario = funcionarios.id
GROUP BY projetos.id
HAVING AVG(funcionarios.idade) > 30;


/* Selecione os funcionários que têm o maior salário em cada cargo. */
SELECT nome, cargo, salario
FROM funcionarios f1
WHERE salario = (select max(salario) from funcionarios f2 WHERE f1.cargo = f2.cargo);

/* Liste os projetos com a maior diferença de dias entre data_inicio e data_fim. */
SELECT nome, datediff(data_fim, data_inicio) as DiferencaDias
FROM projetos
ORDER BY DiferencaDias desc
limit 1;


/* Selecione os funcionários que têm sido atribuídos a projetos por mais de um ano. */
SELECT DISTINCT funcionarios.nome
FROM funcionarios
JOIN atribuicoes ON funcionarios.id = atribuicoes.id_funcionario
JOIN projetos ON atribuicoes.id_projeto = projetos.id
WHERE DATEDIFF(projetos.data_fim, projetos.data_inicio) > 365;


/* Liste os projetos e os funcionários que têm o papel de 'Analista' em cada projeto. */
SELECT projetos.nome AS NomeProjeto, funcionarios.nome AS NomeFuncionario
FROM projetos
JOIN atribuicoes ON projetos.id = atribuicoes.id_projeto
JOIN funcionarios ON atribuicoes.id_funcionario = funcionarios.id
WHERE atribuicoes.papel = 'Analista';


