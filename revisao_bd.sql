-- Criar tabela funcionarios
CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    cargo VARCHAR(50),
    salario DECIMAL(10, 2)
);

-- Criar tabela projetos
CREATE TABLE projetos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE
);

-- Criar tabela atribuicoes
CREATE TABLE atribuicoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT,
    id_projeto INT,
    papel VARCHAR(50),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id),
    FOREIGN KEY (id_projeto) REFERENCES projetos(id)
);


-- Inserir dados na tabela funcionarios
INSERT INTO funcionarios (nome, idade, cargo, salario)
VALUES 
    ('João', 30, 'Desenvolvedor', 5000.00),
    ('Maria', 25, 'Analista de Dados', 4500.00),
    ('Carlos', 35, 'Gerente de Projetos', 7000.00);

-- Inserir dados na tabela projetos
INSERT INTO projetos (nome, descricao, data_inicio, data_fim)
VALUES 
    ('Projeto A', 'Desenvolvimento de um novo sistema', '2023-01-01', '2023-06-30'),
    ('Projeto B', 'Implementação de um banco de dados distribuído', '2023-03-15', '2023-09-30');

-- Inserir dados na tabela atribuicoes
INSERT INTO atribuicoes (id_funcionario, id_projeto, papel)
VALUES
    (1, 1, 'Programador'),
    (2, 1, 'Analista de Dados'),
    (3, 2, 'Gerente de Projeto');
    
    -- Inserir mais dados na tabela funcionarios
INSERT INTO funcionarios (nome, idade, cargo, salario)
VALUES 
    ('Ana', 28, 'Desenvolvedora', 4800.00),
    ('Luiz', 40, 'Arquiteto de Sistemas', 8000.00),
    ('Beatriz', 32, 'Designer UX/UI', 4700.00),
    ('Paulo', 29, 'DevOps', 5500.00),
    ('Fernanda', 45, 'Diretora de TI', 10000.00);
 
-- Inserir mais dados na tabela projetos
INSERT INTO projetos (nome, descricao, data_inicio, data_fim)
VALUES 
    ('Projeto C', 'Melhoria na infraestrutura de rede', '2023-05-01', '2023-12-31'),
    ('Projeto D', 'Desenvolvimento de um aplicativo mobile', '2023-07-01', '2023-12-31'),
    ('Projeto E', 'Reestruturação do website corporativo', '2023-02-01', '2023-08-31'),
    ('Projeto F', 'Migração para a nuvem', '2023-04-01', '2023-10-31');
 
-- Inserir mais dados na tabela atribuicoes
INSERT INTO atribuicoes (id_funcionario, id_projeto, papel)
VALUES
    (4, 3, 'Desenvolvedora'),
    (5, 3, 'Arquiteto de Sistemas'),
    (1, 4, 'Programador'),
    (3, 4, 'Gerente de Projeto'),
    (2, 5, 'Analista de Dados'),
    (6, 5, 'Designer UX/UI'),
    (3, 6, 'Gerente de Projeto'),
    (4, 6, 'DevOps');
