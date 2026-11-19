SET NAMES utf8mb4;
DROP DATABASE IF EXISTS apoiadoa_cg;
CREATE DATABASE apoiadoa_cg CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE apoiadoa_cg;

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  senha_hash VARCHAR(255) NOT NULL,
  perfil ENUM('coordenador', 'voluntario') NOT NULL,
  ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE doador (
  id_doador INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  bairro VARCHAR(100),
  tipo_doacao_recorrente VARCHAR(120),
  observacoes TEXT,
  ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(80) NOT NULL UNIQUE,
  descricao TEXT,
  ativa BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE item (
  id_item INT AUTO_INCREMENT PRIMARY KEY,
  id_categoria INT NOT NULL,
  nome VARCHAR(120) NOT NULL,
  unidade_medida VARCHAR(20) NOT NULL,
  quantidade_atual DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (quantidade_atual >= 0),
  ativo BOOLEAN NOT NULL DEFAULT TRUE,
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE doacao (
  id_doacao INT AUTO_INCREMENT PRIMARY KEY,
  id_doador INT NOT NULL,
  id_usuario INT NOT NULL,
  data_doacao DATE NOT NULL,
  status_recebimento ENUM('pendente', 'recebida', 'cancelada') NOT NULL DEFAULT 'pendente',
  observacoes TEXT,
  data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_doador) REFERENCES doador(id_doador),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE doacao_item (
  id_doacao_item INT AUTO_INCREMENT PRIMARY KEY,
  id_doacao INT NOT NULL,
  id_item INT NOT NULL,
  quantidade DECIMAL(10,2) NOT NULL CHECK (quantidade > 0),
  unidade_medida VARCHAR(20) NOT NULL,
  UNIQUE (id_doacao, id_item),
  FOREIGN KEY (id_doacao) REFERENCES doacao(id_doacao) ON DELETE CASCADE,
  FOREIGN KEY (id_item) REFERENCES item(id_item)
);

CREATE TABLE beneficiario (
  id_beneficiario INT AUTO_INCREMENT PRIMARY KEY,
  responsavel VARCHAR(150) NOT NULL,
  bairro VARCHAR(100) NOT NULL,
  quantidade_pessoas INT NOT NULL CHECK (quantidade_pessoas > 0),
  prioridade_atendimento ENUM('baixa', 'media', 'alta') NOT NULL DEFAULT 'media',
  observacoes TEXT,
  ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE distribuicao (
  id_distribuicao INT AUTO_INCREMENT PRIMARY KEY,
  id_beneficiario INT NOT NULL,
  id_usuario INT NOT NULL,
  data_distribuicao DATE NOT NULL,
  responsavel_entrega VARCHAR(150),
  observacoes TEXT,
  data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_beneficiario) REFERENCES beneficiario(id_beneficiario),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE distribuicao_item (
  id_distribuicao_item INT AUTO_INCREMENT PRIMARY KEY,
  id_distribuicao INT NOT NULL,
  id_item INT NOT NULL,
  quantidade DECIMAL(10,2) NOT NULL CHECK (quantidade > 0),
  unidade_medida VARCHAR(20) NOT NULL,
  UNIQUE (id_distribuicao, id_item),
  FOREIGN KEY (id_distribuicao) REFERENCES distribuicao(id_distribuicao) ON DELETE CASCADE,
  FOREIGN KEY (id_item) REFERENCES item(id_item)
);
