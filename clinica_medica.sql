-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 08-Maio-2023 às 05:49
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica_medica`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Atendente`
--

CREATE TABLE `Atendente` (
  `CPF` varchar(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `CEP` varchar(8) NOT NULL,
  `Rua` varchar(100) NOT NULL,
  `Numero` varchar(10) NOT NULL,
  `Bairro` varchar(100) NOT NULL,
  `Cidade` varchar(100) NOT NULL,
  `Estado` char(2) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `CadastraMedico`
--

CREATE TABLE `CadastraMedico` (
  `AtendenteCPF` varchar(11) DEFAULT NULL,
  `MedicoCRM` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `CadastraPaciente`
--

CREATE TABLE `CadastraPaciente` (
  `DataCadastro` datetime DEFAULT NULL,
  `PacienteCPF` varchar(11) DEFAULT NULL,
  `AtendenteCPF` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Consulta`
--

CREATE TABLE `Consulta` (
  `Codigo` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `EmailPaciente`
--

CREATE TABLE `EmailPaciente` (
  `id` int(11) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `PacienteCPF` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `EnderecoPaciente`
--

CREATE TABLE `EnderecoPaciente` (
  `id` int(11) NOT NULL,
  `Rua` varchar(20) NOT NULL,
  `Cidade` varchar(30) DEFAULT NULL,
  `Estado` varchar(30) DEFAULT NULL,
  `Bairro` varchar(30) DEFAULT NULL,
  `Cep` int(11) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `PacienteCPF` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Medico`
--

CREATE TABLE `Medico` (
  `Estado_CRM` varchar(2) DEFAULT NULL,
  `CRM` varchar(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Especialidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `MedicoConsulta`
--

CREATE TABLE `MedicoConsulta` (
  `ConsultaCodigo` int(11) DEFAULT NULL,
  `MedicoCRM` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Paciente`
--

CREATE TABLE `Paciente` (
  `CPF` varchar(11) NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Paciente_Consulta`
--

CREATE TABLE `Paciente_Consulta` (
  `PacienteCPF` varchar(11) DEFAULT NULL,
  `ConsultaCodigo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `RegistraConsulta`
--

CREATE TABLE `RegistraConsulta` (
  `AtendenteCPF` varchar(11) DEFAULT NULL,
  `ConsultaCodigo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TelefonePaciente`
--

CREATE TABLE `TelefonePaciente` (
  `id` int(11) NOT NULL,
  `Telefone` varchar(20) NOT NULL,
  `PacienteCPF` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `Atendente`
--
ALTER TABLE `Atendente`
  ADD PRIMARY KEY (`CPF`);

--
-- Índices para tabela `CadastraMedico`
--
ALTER TABLE `CadastraMedico`
  ADD KEY `MedicoCRM` (`MedicoCRM`),
  ADD KEY `AtendenteCPF` (`AtendenteCPF`);

--
-- Índices para tabela `CadastraPaciente`
--
ALTER TABLE `CadastraPaciente`
  ADD KEY `AtendenteCPF` (`AtendenteCPF`),
  ADD KEY `PacienteCPF` (`PacienteCPF`);

--
-- Índices para tabela `Consulta`
--
ALTER TABLE `Consulta`
  ADD PRIMARY KEY (`Codigo`);

--
-- Índices para tabela `EmailPaciente`
--
ALTER TABLE `EmailPaciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PacienteCPF` (`PacienteCPF`);

--
-- Índices para tabela `EnderecoPaciente`
--
ALTER TABLE `EnderecoPaciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PacienteCPF` (`PacienteCPF`);

--
-- Índices para tabela `Medico`
--
ALTER TABLE `Medico`
  ADD PRIMARY KEY (`CRM`);

--
-- Índices para tabela `MedicoConsulta`
--
ALTER TABLE `MedicoConsulta`
  ADD KEY `MedicoCRM` (`MedicoCRM`),
  ADD KEY `ConsultaCodigo` (`ConsultaCodigo`);

--
-- Índices para tabela `Paciente`
--
ALTER TABLE `Paciente`
  ADD PRIMARY KEY (`CPF`);

--
-- Índices para tabela `Paciente_Consulta`
--
ALTER TABLE `Paciente_Consulta`
  ADD KEY `PacienteCPF` (`PacienteCPF`),
  ADD KEY `ConsultaCodigo` (`ConsultaCodigo`);

--
-- Índices para tabela `RegistraConsulta`
--
ALTER TABLE `RegistraConsulta`
  ADD KEY `AtendenteCPF` (`AtendenteCPF`),
  ADD KEY `ConsultaCodigo` (`ConsultaCodigo`);

--
-- Índices para tabela `TelefonePaciente`
--
ALTER TABLE `TelefonePaciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PacienteCPF` (`PacienteCPF`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Consulta`
--
ALTER TABLE `Consulta`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `EmailPaciente`
--
ALTER TABLE `EmailPaciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `EnderecoPaciente`
--
ALTER TABLE `EnderecoPaciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `TelefonePaciente`
--
ALTER TABLE `TelefonePaciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `CadastraMedico`
--
ALTER TABLE `CadastraMedico`
  ADD CONSTRAINT `CadastraMedico_ibfk_1` FOREIGN KEY (`MedicoCRM`) REFERENCES `Medico` (`CRM`),
  ADD CONSTRAINT `CadastraMedico_ibfk_2` FOREIGN KEY (`AtendenteCPF`) REFERENCES `Atendente` (`CPF`);

--
-- Limitadores para a tabela `CadastraPaciente`
--
ALTER TABLE `CadastraPaciente`
  ADD CONSTRAINT `CadastraPaciente_ibfk_1` FOREIGN KEY (`AtendenteCPF`) REFERENCES `Atendente` (`CPF`),
  ADD CONSTRAINT `CadastraPaciente_ibfk_2` FOREIGN KEY (`PacienteCPF`) REFERENCES `Paciente` (`CPF`);

--
-- Limitadores para a tabela `EmailPaciente`
--
ALTER TABLE `EmailPaciente`
  ADD CONSTRAINT `EmailPaciente_ibfk_1` FOREIGN KEY (`PacienteCPF`) REFERENCES `Paciente` (`CPF`);

--
-- Limitadores para a tabela `EnderecoPaciente`
--
ALTER TABLE `EnderecoPaciente`
  ADD CONSTRAINT `EnderecoPaciente_ibfk_1` FOREIGN KEY (`PacienteCPF`) REFERENCES `Paciente` (`CPF`);

--
-- Limitadores para a tabela `MedicoConsulta`
--
ALTER TABLE `MedicoConsulta`
  ADD CONSTRAINT `MedicoConsulta_ibfk_1` FOREIGN KEY (`MedicoCRM`) REFERENCES `Medico` (`CRM`),
  ADD CONSTRAINT `MedicoConsulta_ibfk_2` FOREIGN KEY (`ConsultaCodigo`) REFERENCES `Consulta` (`Codigo`);

--
-- Limitadores para a tabela `Paciente_Consulta`
--
ALTER TABLE `Paciente_Consulta`
  ADD CONSTRAINT `Paciente_Consulta_ibfk_1` FOREIGN KEY (`PacienteCPF`) REFERENCES `Paciente` (`CPF`),
  ADD CONSTRAINT `Paciente_Consulta_ibfk_2` FOREIGN KEY (`ConsultaCodigo`) REFERENCES `Consulta` (`Codigo`);

--
-- Limitadores para a tabela `RegistraConsulta`
--
ALTER TABLE `RegistraConsulta`
  ADD CONSTRAINT `RegistraConsulta_ibfk_1` FOREIGN KEY (`AtendenteCPF`) REFERENCES `Atendente` (`CPF`),
  ADD CONSTRAINT `RegistraConsulta_ibfk_2` FOREIGN KEY (`ConsultaCodigo`) REFERENCES `Consulta` (`Codigo`);

--
-- Limitadores para a tabela `TelefonePaciente`
--
ALTER TABLE `TelefonePaciente`
  ADD CONSTRAINT `TelefonePaciente_ibfk_1` FOREIGN KEY (`PacienteCPF`) REFERENCES `Paciente` (`CPF`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
