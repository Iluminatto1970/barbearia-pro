-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Ago-2025 às 04:05
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

--
-- Extraindo dados da tabela `agendamentos`
--

INSERT INTO `agendamentos` (`id`, `funcionario`, `cliente`, `data`, `hora`, `obs`, `data_lanc`, `usuario`, `status`, `servico`) VALUES
(1, 11, 1, '2025-08-20', '08:00:00', 'Cliente preferencial', '2025-08-19', 6, 'Agendado', 1),
(2, 12, 2, '2025-08-20', '09:00:00', NULL, '2025-08-19', 6, 'Agendado', 2),
(3, 13, 3, '2025-08-20', '10:00:00', 'Primeira vez', '2025-08-19', 11, 'Agendado', 10),
(4, 11, 4, '2025-08-21', '14:00:00', NULL, '2025-08-19', 6, 'Agendado', 1),
(5, 12, 5, '2025-08-21', '15:00:00', 'Cliente fidelidade', '2025-08-19', 11, 'Agendado', 2),
(6, 13, 6, '2025-08-22', '08:30:00', NULL, '2025-08-19', 6, 'Finalizado', 10),
(7, 11, 7, '2025-08-22', '09:30:00', 'Corte especial', '2025-08-19', 11, 'Finalizado', 1),
(8, 12, 8, '2025-08-22', '16:00:00', NULL, '2025-08-19', 6, 'Finalizado', 2);

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
(12, 'Barbeiro'),
(13, 'Assistente'),
(14, 'Caixa');

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
(5, 'Gel'),
(6, 'Shampoos'),
(7, 'Condicionadores'),
(8, 'Óleos para Barba');

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
(1, 'Corte'),
(2, 'Barba'),
(3, 'Tratamentos'),
(4, 'Coloração'),
(5, 'Massagem');

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
(1, 'Carlos Silva', '(11) 98765-4321', 'Rua das Flores, 123 - Centro', '1985-03-15', '2025-01-10', 8, '2025-09-05', 1, 'Não'),
(2, 'Roberto Santos', '(11) 99876-5432', 'Av. Paulista, 456 - Bela Vista', '1990-07-22', '2025-02-14', 3, '2025-08-29', 2, 'Não'),
(3, 'Fernando Lima', '(11) 97654-3210', 'Rua Augusta, 789 - Consolação', '1988-11-08', '2025-03-20', 5, '2025-09-02', 10, 'Sim'),
(4, 'Marcos Oliveira', '(11) 96543-2109', 'Rua Oscar Freire, 321 - Jardins', '1992-05-30', '2025-04-05', 2, '2025-09-06', 1, 'Não'),
(5, 'André Costa', '(11) 95432-1098', 'Rua Consolação, 654 - Centro', '1987-09-12', '2025-05-18', 7, '2025-08-28', 2, 'Não'),
(6, 'Paulo Ferreira', '(11) 94321-0987', 'Av. Faria Lima, 987 - Itaim', '1991-12-03', '2025-06-22', 4, '2025-09-07', 10, 'Sim'),
(7, 'Ricardo Almeida', '(11) 93210-9876', 'Rua Haddock Lobo, 147 - Cerqueira César', '1989-01-25', '2025-07-10', 6, '2025-09-08', 1, 'Não'),
(8, 'Gustavo Pereira', '(11) 92109-8765', 'Rua Bela Cintra, 258 - Consolação', '1993-04-17', '2025-08-01', 1, '2025-09-01', 2, 'Não');

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
(1, 'Carlos Silva', 'Excelente atendimento! Sempre saio satisfeito com o corte. Os profissionais são muito qualificados e o ambiente é muito agradável.', '27-08-2025-21-08-59-08.png', 'Sim'),
(2, 'Roberto Santos', 'Melhor barbearia da região! Preços justos e qualidade excepcional. Recomendo a todos os meus amigos.', '27-08-2025-21-07-36-07.png', 'Sim'),
(3, 'Fernando Lima', 'Atendimento personalizado e produtos de primeira qualidade. Já sou cliente há anos e nunca me decepcionei.', '27-08-2025-21-07-17-06.png', 'Sim'),
(4, 'Marcos Oliveira', 'Profissionais experientes e ambiente moderno. O corte ficou exatamente como eu queria!', '27-08-2025-21-07-09-05.png', 'Sim'),
(5, 'André Costa', 'Ótima localização e horários flexíveis. Sempre consigo encaixar um horário na minha agenda.', '27-08-2025-21-07-00-03.png', 'Sim'),
(6, 'Paulo Ferreira', 'Serviço impecável! A barba ficou perfeita e o atendimento foi nota 10.', '27-08-2025-21-05-12-01.png', 'Não');

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
(1, 'Barbearia Elite', 'contato@barbeariaelite.com', '(11) 3333-4444', '(11) 99999-8888', 'Rua Augusta, 1500 - Consolação - São Paulo/SP', 'logo.png', 'favicon.png', 'logo_rel.jpg', 'PDF', 'https://www.instagram.com/barbeariaelite/', 'R$', 'Barbearia Elite - Tradição e qualidade em cortes masculinos desde 2020. Agende seu horário e venha conhecer nossos serviços premium!', 'banner.jpg', 'A Barbearia Elite é referência em cortes masculinos na região central de São Paulo. Com profissionais experientes e produtos de alta qualidade, oferecemos uma experiência única para nossos clientes. Nosso compromisso é com a excelência no atendimento e a satisfação total de quem nos escolhe.', 'foto_barbearia.jpg', 'favicon.png', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3657.1975!2d-46.6520!3d-23.5505!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMjPCsDMzJzAxLjgiUyA0NsKwMzknMDcuMiJX!5e0!3m2!1spt-BR!2sbr!4v1692454800000!5m2!1spt-BR!2sbr\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'Parabéns! Você completou seu cartão fidelidade. Seu próximo corte será totalmente gratuito!', 10, 'Escolha seu Barbeiro', 'Sim');

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
(7, 'Segunda-Feira', 12),
(8, 'Terça-Feira', 12),
(9, 'Quarta-Feira', 12),
(10, 'Quinta-Feira', 12),
(11, 'Sexta-Feira', 12),
(12, 'Sábado', 12),
(13, 'Terça-Feira', 13),
(14, 'Quarta-Feira', 13),
(15, 'Quinta-Feira', 13),
(16, 'Sexta-Feira', 13),
(17, 'Sábado', 13),
(18, 'Segunda-Feira', 6),
(19, 'Terça-Feira', 6),
(20, 'Quarta-Feira', 6),
(21, 'Quinta-Feira', 6),
(22, 'Sexta-Feira', 6);

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

--
-- Extraindo dados da tabela `entradas`
--

INSERT INTO `entradas` (`id`, `produto`, `quantidade`, `motivo`, `usuario`, `data`) VALUES
(1, 1, 50, 'Compra para estoque', 6, '2025-08-01'),
(2, 2, 30, 'Reposição de estoque', 6, '2025-08-05'),
(3, 3, 100, 'Compra mensal', 11, '2025-08-10'),
(4, 4, 25, 'Estoque baixo', 6, '2025-08-12'),
(5, 5, 40, 'Nova linha de produtos', 11, '2025-08-15'),
(6, 6, 20, 'Reposição urgente', 6, '2025-08-18');

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
(1, 'Distribuidora Beauty Pro', '(11) 4444-5555', 'Rua dos Comerciantes, 200 - Brás', '2025-01-15', 'CNPJ', '12.345.678/0001-90'),
(2, 'Cosméticos Premium Ltda', '(11) 5555-6666', 'Av. do Estado, 1000 - Mooca', '2025-02-20', 'Email', 'financeiro@cosmeticospremium.com'),
(3, 'Produtos Masculinos S/A', '(11) 6666-7777', 'Rua da Consolação, 500 - Centro', '2025-03-10', 'CPF', '123.456.789-00'),
(4, 'Fornecedor Express', '(11) 7777-8888', 'Av. Paulista, 2000 - Bela Vista', '2025-04-05', 'Telefone', '(11) 7777-8888'),
(5, 'Beleza & Estilo Distribuidora', '(11) 8888-9999', 'Rua Augusta, 800 - Consolação', '2025-05-12', 'CNPJ', '98.765.432/0001-10');

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
(6, 'Vendas'),
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
(1, '08:00:00', 11),
(2, '08:30:00', 11),
(3, '09:00:00', 11),
(4, '09:30:00', 11),
(5, '10:00:00', 11),
(6, '10:30:00', 11),
(7, '11:00:00', 11),
(8, '11:30:00', 11),
(9, '14:00:00', 11),
(10, '14:30:00', 11),
(11, '15:00:00', 11),
(12, '15:30:00', 11),
(13, '16:00:00', 11),
(14, '16:30:00', 11),
(15, '17:00:00', 11),
(16, '08:00:00', 12),
(17, '08:30:00', 12),
(18, '09:00:00', 12),
(19, '09:30:00', 12),
(20, '10:00:00', 12),
(21, '10:30:00', 12),
(22, '11:00:00', 12),
(23, '14:00:00', 12),
(24, '14:30:00', 12),
(25, '15:00:00', 12),
(26, '15:30:00', 12),
(27, '16:00:00', 12),
(28, '16:30:00', 12),
(29, '17:00:00', 12),
(30, '09:00:00', 13),
(31, '09:30:00', 13),
(32, '10:00:00', 13),
(33, '10:30:00', 13),
(34, '11:00:00', 13),
(35, '14:00:00', 13),
(36, '14:30:00', 13),
(37, '15:00:00', 13),
(38, '15:30:00', 13),
(39, '16:00:00', 13),
(40, '16:30:00', 13);

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

--
-- Extraindo dados da tabela `pagar`
--

INSERT INTO `pagar` (`id`, `descricao`, `tipo`, `valor`, `data_lanc`, `data_venc`, `data_pgto`, `usuario_lanc`, `usuario_baixa`, `foto`, `pessoa`, `pago`, `produto`, `quantidade`, `funcionario`, `servico`, `cliente`) VALUES
(1, 'Compra de produtos para estoque', 'Compra', '1500.00', '2025-08-01', '2025-08-15', '2025-08-14', 6, 6, NULL, 1, 'Sim', 1, 50, 0, 0, 0),
(2, 'Aluguel do estabelecimento', 'Aluguel', '3500.00', '2025-08-01', '2025-08-10', '2025-08-09', 6, 6, 'comprovante_aluguel.pdf', 0, 'Sim', 0, 0, 0, 0, 0),
(3, 'Energia elétrica', 'Conta', '450.00', '2025-08-05', '2025-08-20', '0000-00-00', 6, 0, NULL, 0, 'Não', 0, 0, 0, 0, 0),
(4, 'Comissão barbeiro João', 'Comissão', '280.00', '2025-08-10', '2025-08-25', '2025-08-24', 6, 6, NULL, 11, 'Sim', 0, 0, 11, 0, 0),
(5, 'Compra produtos premium', 'Compra', '800.00', '2025-08-12', '2025-08-27', '0000-00-00', 6, 0, NULL, 2, 'Não', 4, 25, 0, 0, 0);

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
(1, 'Pomada Modeladora Premium', 'Pomada de alta fixação para modelagem profissional', 1, '15.00', '45.00', 35, '27-08-2025-20-33-52-pomada.png', 10),
(2, 'Creme Hidratante Barba', 'Creme nutritivo para hidratação da barba', 2, '12.00', '38.00', 28, '27-08-2025-20-48-46-creme.png', 8),
(3, 'Lâminas Profissionais', 'Lâminas de alta qualidade para barbear', 3, '2.50', '8.00', 150, '27-08-2025-20-45-49-lamina.png', 20),
(4, 'Água Mineral', 'Água mineral 500ml para clientes', 4, '1.00', '3.00', 80, '27-08-2025-20-40-45-agua.png', 15),
(5, 'Gel Fixador Extra Forte', 'Gel com fixação extra forte e brilho natural', 5, '8.00', '25.00', 42, '27-08-2025-20-39-25-gel.png', 12),
(6, 'Shampoo Anticaspa', 'Shampoo especializado para tratamento anticaspa', 6, '18.00', '55.00', 22, '27-08-2025-20-38-08-shampoo.png', 5),
(7, 'Condicionador Nutritivo', 'Condicionador para cabelos ressecados', 7, '16.00', '48.00', 18, '27-08-2025-20-35-54-condicionador.png', 8),
(8, 'Óleo para Barba Artesanal', 'Óleo natural para hidratação e brilho da barba', 8, '25.00', '75.00', 15, '27-08-2025-20-34-52-oleo_barba.png', 5);

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

--
-- Extraindo dados da tabela `receber`
--

INSERT INTO `receber` (`id`, `descricao`, `tipo`, `valor`, `data_lanc`, `data_venc`, `data_pgto`, `usuario_lanc`, `usuario_baixa`, `foto`, `pessoa`, `pago`, `produto`, `quantidade`, `servico`, `funcionario`) VALUES
(1, 'Serviço de corte - Carlos Silva', 'Serviço', '35.00', '2025-08-15', '2025-08-15', '2025-08-15', 11, 11, NULL, 1, 'Sim', 0, 0, 1, 11),
(2, 'Serviço de barba - Roberto Santos', 'Serviço', '30.00', '2025-08-16', '2025-08-16', '2025-08-16', 11, 11, NULL, 2, 'Sim', 0, 0, 2, 12),
(3, 'Corte + Barba - Fernando Lima', 'Serviço', '60.00', '2025-08-17', '2025-08-17', '2025-08-17', 6, 6, NULL, 3, 'Sim', 0, 0, 10, 13),
(4, 'Venda pomada - Marcos Oliveira', 'Produto', '45.00', '2025-08-18', '2025-08-18', '2025-08-18', 11, 11, NULL, 4, 'Sim', 1, 1, 0, 0),
(5, 'Serviço de corte - André Costa', 'Serviço', '35.00', '2025-08-19', '2025-08-19', '0000-00-00', 11, 0, NULL, 5, 'Não', 0, 0, 1, 11),
(6, 'Venda óleo barba - Paulo Ferreira', 'Produto', '75.00', '2025-08-19', '2025-08-19', '2025-08-19', 6, 6, NULL, 6, 'Sim', 8, 1, 0, 0);

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

--
-- Extraindo dados da tabela `saidas`
--

INSERT INTO `saidas` (`id`, `produto`, `quantidade`, `motivo`, `usuario`, `data`) VALUES
(1, 1, 2, 'Venda para cliente', 11, '2025-08-15'),
(2, 3, 10, 'Uso interno - serviços', 6, '2025-08-16'),
(3, 5, 1, 'Venda para cliente', 11, '2025-08-17'),
(4, 8, 1, 'Venda para cliente', 6, '2025-08-18'),
(5, 2, 3, 'Uso interno - tratamentos', 11, '2025-08-19'),
(6, 4, 5, 'Consumo interno', 6, '2025-08-19');

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
(1, 'Corte Tradicional', 1, '35.00', '27-08-2025-20-53-30-corte.png', 15, 'Sim', '10.00'),
(2, 'Barba Completa', 2, '30.00', '27-08-2025-20-53-41-barba.png', 7, 'Sim', '8.00'),
(3, 'Corte + Barba', 1, '60.00', '27-08-2025-20-53-48-corte_barba.png', 15, 'Sim', '15.00'),
(4, 'Corte Degradê', 1, '40.00', '27-08-2025-20-54-57-degrade.png', 15, 'Sim', '12.00'),
(5, 'Barba + Bigode', 2, '35.00', '27-08-2025-20-55-06-barba_bigode.png', 7, 'Sim', '10.00'),
(6, 'Tratamento Capilar', 3, '80.00', '27-08-2025-21-02-14-tratamento_capilar.png', 30, 'Sim', '20.00'),
(7, 'Coloração Masculina', 4, '120.00', '27-08-2025-20-57-13-coloracao.png', 45, 'Sim', '30.00'),
(8, 'Massagem Relaxante', 5, '50.00', '27-08-2025-20-58-51-massagem.png', 0, 'Sim', '15.00'),
(9, 'Corte Infantil', 1, '25.00', '27-08-2025-21-01-11-infantil.png', 20, 'Sim', '8.00'),
(10, 'Pacote Completo', 1, '150.00', '27-08-2025-21-01-21-completo.png', 30, 'Sim', '40.00');

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
(1, 'Cortes Profissionais', 'Oferecemos cortes modernos e clássicos com técnicas profissionais. Nossos barbeiros são especializados em diferentes estilos para atender todas as preferências.'),
(2, 'Barba Perfeita', 'Serviços completos de barba com produtos premium. Desde o corte até a finalização, cuidamos de cada detalhe para garantir o melhor resultado.'),
(3, 'Ambiente Moderno', 'Espaço confortável e moderno, equipado com as melhores ferramentas e produtos do mercado para proporcionar uma experiência única.'),
(4, 'Atendimento Premium', 'Atendimento personalizado e de qualidade, com profissionais experientes e dedicados à satisfação de nossos clientes.');

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
(6, 'Administrador', 'admin@barbeariaelite.com', '123.456.789-00', '123', '202cb962ac59075b964b07152d234b70', 'Administrador', '2025-01-01', 'Sim', '(11) 99999-0000', 'Rua Augusta, 1500 - Consolação', '27-08-2025-21-16-36-gerente.png', 'Não', 'Email', 'admin@barbeariaelite.com'),
(11, 'João Silva', 'joao@barbeariaelite.com', '987.654.321-00', '123', '202cb962ac59075b964b07152d234b70', 'Barbeiro', '2025-02-15', 'Sim', '(11) 98888-1111', 'Rua das Palmeiras, 200 - Vila Madalena', '27-08-2025-21-13-25-f3.png', 'Sim', 'CPF', '987.654.321-00'),
(12, 'Pedro Santos', 'pedro@barbeariaelite.com', '456.789.123-00', '123', '202cb962ac59075b964b07152d234b70', 'Barbeiro', '2025-03-10', 'Sim', '(11) 97777-2222', 'Av. Paulista, 800 - Bela Vista', '27-08-2025-21-12-44-f2.png', 'Sim', 'Telefone', '(11) 97777-2222'),
(13, 'Lucas Oliveira', 'lucas@barbeariaelite.com', '789.123.456-00', '123', '202cb962ac59075b964b07152d234b70', 'Barbeiro', '2025-04-20', 'Sim', '(11) 96666-3333', 'Rua Oscar Freire, 150 - Jardins', '27-08-2025-21-11-10-f1.png', 'Sim', 'Email', 'lucas@barbeariaelite.com'),
(14, 'Maria Fernanda', 'maria@barbeariaelite.com', '321.654.987-00', '123', '202cb962ac59075b964b07152d234b70', 'Recepcionista', '2025-05-05', 'Sim', '(11) 95555-4444', 'Rua Consolação, 300 - Centro', '27-08-2025-21-16-08-maria.png', 'Não', 'CPF', '321.654.987-00'),
(15, 'Carlos Gerente', 'gerente@barbeariaelite.com', '654.987.321-00', '123', '202cb962ac59075b964b07152d234b70', 'Gerente', '2025-06-01', 'Sim', '(11) 94444-5555', 'Rua Augusta, 1500 - Consolação', '27-08-2025-21-15-48-carlos.png', 'Não', 'Email', 'gerente@barbeariaelite.com');

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
-- Extraindo dados da tabela `usuarios_permissoes`
--

INSERT INTO `usuarios_permissoes` (`id`, `usuario`, `permissao`) VALUES
(1, 11, 20),
(2, 11, 21),
(3, 11, 22),
(4, 12, 20),
(5, 12, 21),
(6, 12, 22),
(7, 13, 20),
(8, 13, 21),
(9, 13, 22),
(10, 14, 1),
(11, 14, 3),
(12, 14, 20),
(13, 14, 22),
(14, 15, 1),
(15, 15, 2),
(16, 15, 3),
(17, 15, 16),
(18, 15, 17),
(19, 15, 18),
(20, 15, 19),
(21, 15, 20),
(22, 15, 21),
(23, 15, 25),
(24, 15, 26),
(25, 15, 27),
(26, 15, 28),
(27, 15, 29),
(28, 15, 30),
(29, 15, 31);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `cat_produtos`
--
ALTER TABLE `cat_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `cat_servicos`
--
ALTER TABLE `cat_servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `dias`
--
ALTER TABLE `dias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `grupo_acessos`
--
ALTER TABLE `grupo_acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `pagar`
--
ALTER TABLE `pagar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `receber`
--
ALTER TABLE `receber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `saidas`
--
ALTER TABLE `saidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `textos_index`
--
ALTER TABLE `textos_index`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `usuarios_permissoes`
--
ALTER TABLE `usuarios_permissoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
