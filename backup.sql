# Criar o banco de dados
CREATE DATABASE bd_saep3;

# Escolher o banco de dados
USE bd_saep3;

# Criar a tabela de usuarios
CREATE TABLE tb_usuarios(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(255) NOT NULL
);
# Criar a tabela de projetos
CREATE TABLE tb_projetos(
	id_projeto INT PRIMARY KEY AUTO_INCREMENT,
    nome_projeto VARCHAR(255) NOT NULL,
    fk_id_usuario INT NOT NULL,
    situcao ENUM('Pendente', 'Em andamento', 'Finalizado'),
    descricao VARCHAR(255) NOT NULL
);

# Relacionar a tabela de projetos com a tabela de usuarios
ALTER TABLE tb_projetos ADD CONSTRAINT rel_proj_usuario
FOREIGN KEY (fk_id_usuario) REFERENCES tb_usuarios(id_usuario);

# Criar um view com um left join
CREATE VIEW vw_tudo AS
SELECT * FROM tb_projetos LEFT JOIN tb_usuarios
ON tb_projetos.fk_id_usuario = tb_usuarios.id_usuario;

SELECT * FROM vw_tudo;





