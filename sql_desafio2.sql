-- 5. Listar os projetos que ainda estão em andamento (data_fim > data_atual).
select projetos.nome, projetos.descricao
from projetos
where data_fim > '2024-06-25';
-- ou função current_date() para pegar a data de hoje

-- 6. Exibir o nome e a descrição dos projetos que possuem pelo menos 3 funcionários alocados.
SELECT projetos.nome, projetos.descricao
FROM projetos
JOIN atribuicoes ON projetos.id = atribuicoes.id_projeto
GROUP BY projetos.id;


-- 7. Apresentar os funcionários que estão trabalhando em mais de um projeto.
select atribuicoes.id_funcionario, count(atribuicoes.id_projeto) as numero_de_projetos
from atribuicoes
group by atribuicoes.id_funcionario
having count(atribuicoes.id_projeto) > 1;


-- 8. Listar os projetos que possuem funcionários de todos os cargos (Desenvolvedor, Analista de Dados, Gerente de Projetos, etc.).
select projetos.nome, projetos.descricao
from projetos
join atribuicoes on projetos.id = atribuicoes.id_projeto
join funcionarios on atribuicoes.id_funcionario = funcionarios.id
group by projetos.id, projetos.nome, projetos.descricao
having count(distinct funcionarios.cargo) = (select count(distinct cargo) from funcionarios);



-- Nível Intermediário (4-5 Joins)


-- 5. Listar os funcionários que nunca participaram de nenhum projeto.
select *
from funcionarios
left join atribuicoes on funcionarios.id = atribuicoes.id_funcionario
where atribuicoes.id is null;

-- 6. Exibir a quantidade de funcionários que foram contratados em cada ano.
SELECT YEAR(data_contratacao) AS ano_contratacao, COUNT(*) AS quantidade_funcionarios
FROM funcionarios
GROUP BY YEAR(data_contratacao);


-- 7. Apresentar os projetos que tiveram a maior duração (diferença entre data_fim e data_inicio).
SELECT nome, descricao, data_inicio, data_fim, 
       DATEDIFF(data_fim, data_inicio) AS duracao_dias
FROM projetos
ORDER BY duracao_dias DESC
limit 3;


-- 8. Listar os funcionários que trabalharam em projetos gerenciados por Carlos.
SELECT id FROM funcionarios WHERE nome = 'Carlos';

SELECT id_projeto FROM atribuicoes 
WHERE id_funcionario = (3) AND papel = 'Gerente de Projeto';

SELECT id_funcionario FROM atribuicoes 
WHERE id_projeto IN (2, 4, 6);

SELECT f.nome, f.idade, f.cargo, f.salario
FROM funcionarios f
WHERE f.id IN (2, 4, 6);


-- Nível Avançado (6 Joins ou mais)

-- 5. Apresentar os projetos que possuem a maior diversidade de cargos entre os funcionários alocados.
WITH cargos_por_projeto AS (
    SELECT a.id_projeto, COUNT(DISTINCT f.cargo) AS diversidade_cargos
    FROM atribuicoes a
    JOIN funcionarios f ON a.id_funcionario = f.id
    GROUP BY a.id_projeto
)
SELECT p.nome, p.descricao, cp.diversidade_cargos
FROM projetos p
JOIN cargos_por_projeto cp ON p.id = cp.id_projeto
ORDER BY cp.diversidade_cargos DESC;



-- 6. Listar os funcionários que nunca trabalharam com um determinado gerente de projeto (informar o ID do gerente).
-- 7. Exibir a média salarial dos funcionários por faixa etária (a definir as faixas etárias).
-- 8. Apresentar os projetos que possuem a maior concentração de funcionários de uma mesma faixa etária.
-- 9. Listar os gerentes de projeto que possuem a equipe com a maior rotatividade de funcionários (maior número de entradas e saídas de funcionários).