-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Ago-2025 às 05:43
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos`
--

CREATE TABLE `acessos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `chave` varchar(50) NOT NULL,
  `grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `acessos`
--

INSERT INTO `acessos` (`id`, `nome`, `chave`, `grupo`) VALUES
(1, 'Usuários', 'usuarios', 1),
(2, 'Funcionários', 'funcionarios', 1),
(3, 'Clientes', 'clientes', 1),
(4, 'Clientes Retornos', 'clientes_retorno', 1),
(5, 'Fornecedores', 'fornecedores', 1),
(6, 'Serviços', 'servicos', 2),
(7, 'Cargos', 'cargos', 2),
(8, 'Categoria Serviços', 'cat_servicos', 2),
(9, 'Grupo Acessos', 'grupos', 2),
(10, 'Acessos', 'acessos', 2),
(11, 'Produtos', 'produtos', 3),
(12, 'Categorias', 'cat_produtos', 3),
(13, 'Estoque Baixo', 'estoque', 3),
(14, 'Saídas', 'saidas', 3),
(15, 'Entradas', 'entradas', 3),
(16, 'Vendas', 'vendas', 4),
(17, 'Compras', 'compras', 4),
(18, 'Contas à Pagar', 'pagar', 4),
(19, 'Contas à Receber', 'receber', 4),
(20, 'Agendamentos', 'agendamentos', 5),
(21, 'Serviços Agendamentos', 'servicos_agenda', 5),
(22, 'Home', 'home', 0),
(25, 'Relatório Produtos', 'rel_produtos', 7),
(26, 'Relatório de Entradas', 'rel_entradas', 7),
(27, 'Relatório de Saídas', 'rel_saidas', 7),
(28, 'Relatório de Comissões', 'rel_comissoes', 7),
(29, 'Relatório de Contas', 'rel_contas', 7),
(30, 'Aniversáriantes', 'rel_aniv', 7),
(31, 'Relatório de Lucro', 'rel_lucro', 7),
(32, 'Textos Banner Index', 'textos_index', 8),
(33, 'Comentários / Depoimentos', 'comentarios', 8),
(34, 'Configurações do Sistema', 'configuracoes', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `obs` varchar(100) DEFAULT NULL,
  `data_lanc` date NOT NULL,
  `usuario` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `servico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id`, `nome`) VALUES
(9, 'Administrador'),
(10, 'Gerente'),
(11, 'Recepcionista'),
(12, 'Barbeiro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cat_produtos`
--

CREATE TABLE `cat_produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cat_produtos`
--

INSERT INTO `cat_produtos` (`id`, `nome`) VALUES
(1, 'Pomadas'),
(2, 'Cremes'),
(3, 'Lâminas e Giletes'),
(4, 'Bebidas'),
(5, 'Gel');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cat_servicos`
--

CREATE TABLE `cat_servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cat_servicos`
--

INSERT INTO `cat_servicos` (`id`, `nome`) VALUES
(1, 'Corte');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `data_nasc` date NOT NULL,
  `data_cad` date NOT NULL,
  `cartoes` int(11) NOT NULL,
  `data_retorno` date DEFAULT NULL,
  `ultimo_servico` int(11) NOT NULL,
  `alertado` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `telefone`, `endereco`, `data_nasc`, `data_cad`, `cartoes`, `data_retorno`, `ultimo_servico`, `alertado`) VALUES
(15, 'Fernando Machado', '(55) 62991-2526', NULL, '0000-00-00', '2025-07-11', 0, NULL, 0, 'Não');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `texto` varchar(500) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `ativo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `comentarios`
--

INSERT INTO `comentarios` (`id`, `nome`, `texto`, `foto`, `ativo`) VALUES
(2, 'Paulo Campos', 'Aqui será o texto do comentário referente a essa mensagem e poderá ser aprovado ou não pelo administrador do site. Aqui será o texto do comentário referente a essa mensagem e poderá ser aprovado ou não pelo administrador do site.', '14-06-2022-19-10-25-c1.jpg', 'Sim'),
(3, 'Marcos Silva', 'Aqui será o texto do comentário referente a essa mensagem e poderá ser aprovado ou não pelo administrador do site.', '14-06-2022-19-11-32-30-05-2022-13-19-34-08-03-2022-22-21-20-02-03-2022-09-59-04-Arthur.jpg', 'Sim'),
(4, 'Marcos Santos', 'Aqui será o texto do comentário referente a essa mensagem e poderá ser aprovado ou não pelo administrador do site.', '14-06-2022-19-11-50-c2.jpg', 'Sim'),
(15, 'Fabricio Campos', 'Excelente barbearia, sempre bom atendimento, preços assecíveis, Excelente barbearia, sempre bom atendimento, preços assecíveis, Excelente barbearia, sempre bom atendimento, preços assecíveis, ', '14-06-2022-20-10-40-c1.jpg', 'Sim'),
(16, 'Marcelo Silva', 'Excelente barbearia, sempre bom atendimento, preços assecíveis, Excelente barbearia, sempre bom atendimento, preços assecíveis, Excelente barbearia, sempre bom atendimento, preços assecíveis, ', '14-06-2022-20-13-02-c2.jpg', 'Sim'),
(18, 'Priscila Matos', 'Excelente Salão de cabereira, muito bom atendimento.', '14-06-2022-20-17-37-favicon.png', 'Não');

-- --------------------------------------------------------

--
-- Estrutura da tabela `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone_fixo` varchar(20) DEFAULT NULL,
  `telefone_whatsapp` varchar(20) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `icone` varchar(100) DEFAULT NULL,
  `logo_rel` varchar(100) DEFAULT NULL,
  `tipo_rel` varchar(10) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `tipo_comissao` varchar(25) NOT NULL,
  `texto_rodape` varchar(255) DEFAULT NULL,
  `img_banner_index` varchar(100) DEFAULT NULL,
  `texto_sobre` varchar(600) DEFAULT NULL,
  `imagem_sobre` varchar(100) DEFAULT NULL,
  `icone_site` varchar(100) NOT NULL,
  `mapa` varchar(1000) DEFAULT NULL,
  `texto_fidelidade` varchar(255) DEFAULT NULL,
  `quantidade_cartoes` int(11) NOT NULL,
  `texto_agendamento` varchar(30) DEFAULT NULL,
  `msg_agendamento` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `config`
--

INSERT INTO `config` (`id`, `nome`, `email`, `telefone_fixo`, `telefone_whatsapp`, `endereco`, `logo`, `icone`, `logo_rel`, `tipo_rel`, `instagram`, `tipo_comissao`, `texto_rodape`, `img_banner_index`, `texto_sobre`, `imagem_sobre`, `icone_site`, `mapa`, `texto_fidelidade`, `quantidade_cartoes`, `texto_agendamento`, `msg_agendamento`) VALUES
(2, 'Barbearia PRO', 'admin@admin', '(33) 3333-3333', '(31) 99999-9999', 'Rua X Número 150 - Bairro Centro', 'logo.png', 'favicon.png', 'logo_rel.jpg', 'PDF', 'https://www.instagram.com/', 'R$', 'Este texto pode ser modificado no painel do sistema, nas opções de configurações, é um texto com tamanho para até 255 caracteres e será apresentado no rodapé de todo o site!', 'hero-bg.jpg', 'Este texto pode ser alterado no painel administrativo nas configurações, aqui voce vai colocar um texto escrevendo sobre sua empresa. Este texto pode ser alterado no painel administrativo nas configurações, aqui voce vai colocar um texto escrevendo sobre.', 'getlstd-property-photo.jpg', 'favicon.png', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15111.737337923378!2d-44.43875433848488!3d-18.756469927096727!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xa862fa2d52b993%3A0xe3bd921aa58bc4a8!2sCentro%2C%20Curvelo%20-%20MG%2C%2035790-000!5e0!3m2!1spt-BR!2sbr!4v1655243351692!5m2!1spt-BR!2sbr\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'Parabéns, você completou seus cartões Fidelidade, seu próximo corte será gratuito!!', 10, 'Selecionar Barbeiro', 'Não');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dias`
--

CREATE TABLE `dias` (
  `id` int(11) NOT NULL,
  `dia` varchar(25) NOT NULL,
  `funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `dias`
--

INSERT INTO `dias` (`id`, `dia`, `funcionario`) VALUES
(1, 'Segunda-Feira', 11),
(2, 'Terça-Feira', 11),
(3, 'Quarta-Feira', 11),
(4, 'Quinta-Feira', 11),
(5, 'Sexta-Feira', 11),
(6, 'Sábado', 11),
(8, 'Terça-Feira', 10),
(9, 'Quarta-Feira', 10),
(10, 'Quinta-Feira', 10),
(11, 'Sexta-Feira', 10),
(12, 'Terça-Feira', 6),
(13, 'Quarta-Feira', 6),
(14, 'Quinta-Feira', 6),
(15, 'Sexta-Feira', 6),
(16, 'Sábado', 6),
(17, 'Segunda-Feira', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entradas`
--

CREATE TABLE `entradas` (
  `id` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `motivo` varchar(50) NOT NULL,
  `usuario` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `data_cad` date NOT NULL,
  `tipo_chave` varchar(25) DEFAULT NULL,
  `chave_pix` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome`, `telefone`, `endereco`, `data_cad`, `tipo_chave`, `chave_pix`) VALUES
(1, 'Fornecedor 2', '(55) 55555-5555', 'Rua Guajajaras 140 Centro', '2022-05-31', 'Email', 'fornecedor2@hotmail.com'),
(2, 'Fornecedor 1', '(88) 88888-8888', 'Teste', '2022-05-31', 'CPF', '123111111'),
(4, 'Fornecedor 3', '(31) 78999-9999', 'Rua C', '2022-06-13', 'CNPJ', '11.111.111/1111-11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_acessos`
--

CREATE TABLE `grupo_acessos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `grupo_acessos`
--

INSERT INTO `grupo_acessos` (`id`, `nome`) VALUES
(1, 'Pessoas'),
(2, 'Cadastros'),
(3, 'Produtos'),
(4, 'Financeiro'),
(5, 'Agendamento / Serviços'),
(7, 'Relatórios'),
(8, 'Dados Site');

-- --------------------------------------------------------

--
-- Estrutura da tabela `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `horario` time NOT NULL,
  `funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `horarios`
--

INSERT INTO `horarios` (`id`, `horario`, `funcionario`) VALUES
(1, '08:00:00', 10),
(2, '09:00:00', 10),
(4, '12:00:00', 10),
(5, '10:00:00', 10),
(6, '13:00:00', 10),
(7, '11:00:00', 10),
(8, '08:00:00', 9),
(9, '09:00:00', 9),
(10, '08:00:00', 6),
(11, '09:00:00', 6),
(12, '10:00:00', 6),
(14, '08:00:00', 11),
(15, '08:30:00', 11),
(16, '09:00:00', 11),
(17, '09:30:00', 11),
(18, '14:00:00', 10),
(19, '15:00:00', 10),
(20, '16:00:00', 10),
(21, '17:00:00', 10),
(22, '11:00:00', 6),
(23, '12:00:00', 6),
(24, '15:00:00', 6),
(25, '16:00:00', 6),
(26, '17:00:00', 6),
(27, '10:00:00', 11),
(28, '12:00:00', 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagar`
--

CREATE TABLE `pagar` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `tipo` varchar(35) DEFAULT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data_lanc` date NOT NULL,
  `data_venc` date NOT NULL,
  `data_pgto` date NOT NULL,
  `usuario_lanc` int(11) NOT NULL,
  `usuario_baixa` int(11) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `pessoa` int(11) NOT NULL,
  `pago` varchar(5) NOT NULL,
  `produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `servico` int(11) NOT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `categoria` int(11) NOT NULL,
  `valor_compra` decimal(8,2) NOT NULL,
  `valor_venda` decimal(8,2) NOT NULL,
  `estoque` int(11) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `nivel_estoque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `categoria`, `valor_compra`, `valor_venda`, `estoque`, `foto`, `nivel_estoque`) VALUES
(2, 'Creme Hidratação', 'Creme para hidratar...', 2, '2.00', '35.00', 41, '14-06-2022-16-43-42-creme-hidrataçao.png', 5),
(4, 'Loção Pós Barba', 'Loção para barba creme X', 5, '10.00', '15.00', 48, '14-06-2022-16-43-17-BARBA-03.png', 5),
(5, 'Pomada Modeladora', 'Pomada Modeladora para Cabelos', 1, '10.00', '10.00', 8, '14-06-2022-16-42-47-BARBA-06.png', 5),
(7, 'Pomada Gel Modeladora', 'Pomada que tem uma ação de gel que mantém seu cabelo modelado mais tempo', 1, '10.00', '30.00', 60, '14-06-2022-17-30-52-pomada.png', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `receber`
--

CREATE TABLE `receber` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `tipo` varchar(35) DEFAULT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data_lanc` date NOT NULL,
  `data_venc` date NOT NULL,
  `data_pgto` date NOT NULL,
  `usuario_lanc` int(11) NOT NULL,
  `usuario_baixa` int(11) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `pessoa` int(11) NOT NULL,
  `pago` varchar(5) NOT NULL,
  `produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `servico` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `saidas`
--

CREATE TABLE `saidas` (
  `id` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `motivo` varchar(50) NOT NULL,
  `usuario` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `categoria` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `dias_retorno` int(11) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `comissao` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`, `categoria`, `valor`, `foto`, `dias_retorno`, `ativo`, `comissao`) VALUES
(1, 'Corte', 1, '35.00', '19-08-2025-00-09-02-corte.png', 15, 'Sim', '10.00'),
(2, 'Barba', 1, '30.00', '19-08-2025-00-12-01-barba.png', 7, 'Sim', '10.00'),
(10, 'Corte + Barba', 1, '60.00', '19-08-2025-00-34-12-corte_barba.png', 15, 'Sim', '15.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `textos_index`
--

CREATE TABLE `textos_index` (
  `id` int(11) NOT NULL,
  `titulo` varchar(25) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `textos_index`
--

INSERT INTO `textos_index` (`id`, `titulo`, `descricao`) VALUES
(1, 'Cortes Profissionais', 'Descrição relacionado ao texto, você poderá alterar essa descrição e o título do texto acima no painel administrativo, lá terá uma opção para gerenciar os recursos do site.'),
(2, 'Faça sua Barba', 'Descrição relacionado ao texto, você poderá alterar essa descrição e o título do texto acima no painel administrativo, lá terá uma opção para gerenciar os recursos do site.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `senha` varchar(25) NOT NULL,
  `senha_crip` varchar(100) NOT NULL,
  `nivel` varchar(35) NOT NULL,
  `data` date NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `atendimento` varchar(5) NOT NULL,
  `tipo_chave` varchar(25) DEFAULT NULL,
  `chave_pix` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `cpf`, `senha`, `senha_crip`, `nivel`, `data`, `ativo`, `telefone`, `endereco`, `foto`, `atendimento`, `tipo_chave`, `chave_pix`) VALUES
(6, 'Admin', 'admin@admin', '000.000.000-00', '123', '202cb962ac59075b964b07152d234b70', 'Administrador', '2022-05-25', 'Sim', '(31) 99999-9999', 'Rua xxx, 8 ', '19-08-2025-00-05-26-admin.png', 'Sim', NULL, NULL),
(10, 'João', 'joao@email.com', '999.999.999-99', '123', '202cb962ac59075b964b07152d234b70', 'Barbeiro', '2022-05-30', 'Sim', '(11) 99999-9999', 'Rua 10', 'sem-foto.jpg', 'Sim', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_permissoes`
--

CREATE TABLE `usuarios_permissoes` (
  `id` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `permissao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cat_produtos`
--
ALTER TABLE `cat_produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cat_servicos`
--
ALTER TABLE `cat_servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `dias`
--
ALTER TABLE `dias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `grupo_acessos`
--
ALTER TABLE `grupo_acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pagar`
--
ALTER TABLE `pagar`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `receber`
--
ALTER TABLE `receber`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `saidas`
--
ALTER TABLE `saidas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `textos_index`
--
ALTER TABLE `textos_index`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios_permissoes`
--
ALTER TABLE `usuarios_permissoes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `cat_produtos`
--
ALTER TABLE `cat_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cat_servicos`
--
ALTER TABLE `cat_servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `dias`
--
ALTER TABLE `dias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `grupo_acessos`
--
ALTER TABLE `grupo_acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `pagar`
--
ALTER TABLE `pagar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `receber`
--
ALTER TABLE `receber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de tabela `saidas`
--
ALTER TABLE `saidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `textos_index`
--
ALTER TABLE `textos_index`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `usuarios_permissoes`
--
ALTER TABLE `usuarios_permissoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
