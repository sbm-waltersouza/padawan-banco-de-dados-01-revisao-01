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
/* Liste os projetos com a média de idade dos funcionários atribuídos. */
/* Selecione os funcionários que são gerentes de projeto. */
/* Liste os projetos com a maior e a menor data de término. */
/* Selecione os funcionários que têm o mesmo salário. */
/* Liste os projetos que têm funcionários com idade média superior a 30 anos. */
/* Selecione os funcionários que têm o maior salário em cada cargo. */
/* Liste os projetos com a maior diferença de dias entre data_inicio e data_fim. */
/* Selecione os funcionários que têm sido atribuídos a projetos por mais de um ano. */
/* Liste os projetos e os funcionários que têm o papel de 'Analista' em cada projeto. */


