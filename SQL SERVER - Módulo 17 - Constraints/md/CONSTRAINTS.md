<h1 align="center">
  🔒 Constraints <br>
  <img src="https://img.shields.io/badge/-NOT%20NULL%20..%20FOREIGN%20KEY-14b8a6?style=flat-square"/>
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/Módulo-17-4FC3F7?style=flat-square"/>
  <img src="https://img.shields.io/badge/Slide-Módulo%2018-blueviolet?style=flat-square"/>
</p>

> 📌 Seguindo o padrão dos módulos anteriores, nos slides de abertura o instrutor deve numerar este
> conteúdo como **"Módulo 18"**, correspondendo à pasta `Módulo 17` deste repositório.

> 🖼️ Este módulo ainda não tem screenshots das aulas na pasta `img/` — assim que forem adicionados,
> as tags `<img>` correspondentes entram nas seções abaixo.

<h2 align="center">💡 O que são Constraints? <br>
<img src="https://img.shields.io/badge/-Conceito-f59e0b?style=flat-square"/></h2>

**Para que servem:**

- **Constraints** são regras aplicadas a colunas (ou à tabela como um todo) que restringem o tipo de
  dado aceito nelas;
- Garantem a **integridade** e a **consistência** dos dados, impedindo linhas duplicadas, campos
  obrigatórios em branco, valores fora do domínio esperado ou registros "órfãos" sem relação válida
  com outra tabela;
- Podem ser definidas na criação da tabela (`CREATE TABLE`) ou adicionadas/removidas depois
  (`ALTER TABLE`).

<h2 align="center">🧩 As 7 Constraints do SQL Server <br>
<img src="https://img.shields.io/badge/-Tipos-8b5cf6?style=flat-square"/></h2>

| # | Constraint | O que faz |
|---|------------|-----------|
| 1 | `NOT NULL` | Obriga a coluna a sempre ter um valor |
| 2 | `UNIQUE` | Não permite valores repetidos na coluna |
| 3 | `CHECK` | Valida uma condição lógica antes de aceitar o valor |
| 4 | `DEFAULT` | Define um valor padrão quando nada é informado no `INSERT` |
| 5 | `IDENTITY` | Gera valores numéricos automáticos e sequenciais |
| 6 | `PRIMARY KEY` | Identifica unicamente cada linha (por baixo dos panos: `NOT NULL` + `UNIQUE`) |
| 7 | `FOREIGN KEY` | Garante que o valor exista em outra tabela (relação entre tabelas) |

```sql
CREATE TABLE Exemplo_Combinado
(
    ID     INT IDENTITY(1,1) PRIMARY KEY,
    Nome   VARCHAR(100) NOT NULL,
    Email  VARCHAR(100) UNIQUE NOT NULL,
    Idade  INT CHECK (Idade >= 18),
    Status VARCHAR(20) DEFAULT 'Ativo'
)
```

> 💬 É possível (e recomendado) nomear as constraints com `CONSTRAINT nome_da_regra`, o que facilita
> encontrá-las, alterá-las ou removê-las depois.

<h2 align="center">🏗️ Estudo de caso: dCliente, dGerente e fContratos <br>
<img src="https://img.shields.io/badge/-Estudo%20de%20caso-475569?style=flat-square"/></h2>

O módulo usa três tabelas para demonstrar o "antes e depois" das constraints — primeiro criadas
**sem** nenhuma regra, depois recriadas **com** as constraints adequadas:

| Tabela | Papel | Constraints aplicadas |
|--------|-------|------------------------|
| `dCliente` | Dimensão de clientes | `PRIMARY KEY` (IDENTITY), `NOT NULL`, `UNIQUE` (CPF e Email) |
| `dGerente` | Dimensão de gerentes | `PRIMARY KEY` (IDENTITY), `NOT NULL`, `UNIQUE` (Email), `DEFAULT` (Regional) |
| `fContratos` | Fato de contratos | `PRIMARY KEY` (IDENTITY), `FOREIGN KEY` (cliente e gerente), `CHECK` (valor e status), `DEFAULT` (data e status) |

```sql
CREATE TABLE fContratos(
    ID_Contrato   INT IDENTITY(1,1) CONSTRAINT PK_fContratos PRIMARY KEY,
    ID_Cliente    INT NOT NULL CONSTRAINT FK_fContratos_dCliente REFERENCES dCliente(ID_Cliente),
    ID_Gerente    INT NOT NULL CONSTRAINT FK_fContratos_dGerente REFERENCES dGerente(ID_Gerente),
    ValorContrato DECIMAL(10,2) NOT NULL CONSTRAINT CK_fContratos_Valor CHECK (ValorContrato > 0),
    DataContrato  DATE NOT NULL CONSTRAINT DF_fContratos_Data DEFAULT GETDATE(),
    Status        VARCHAR(20) NOT NULL
                   CONSTRAINT DF_fContratos_Status DEFAULT 'Ativo'
                   CONSTRAINT CK_fContratos_Status CHECK (Status IN ('Ativo', 'Cancelado', 'Concluído'))
)
```

> 📌 A `FOREIGN KEY` protege a integridade nas duas direções: bloqueia `INSERT`/`UPDATE` na tabela
> filha (`fContratos`) apontando para um registro inexistente, **e** bloqueia `DELETE` na tabela pai
> (`dCliente`/`dGerente`) enquanto ela ainda for referenciada.

<h2 align="center">🚨 Violações de Constraints <br>
<img src="https://img.shields.io/badge/-Erros%20comuns-ef4444?style=flat-square"/></h2>

| Constraint violada | Exemplo de operação bloqueada | Mensagem típica |
|---------------------|-------------------------------|------------------|
| `NOT NULL` | Inserir `NULL` em uma coluna obrigatória | `Cannot insert the value NULL into column...` |
| `UNIQUE` / `PRIMARY KEY` | Repetir um valor que já existe | `Violation of UNIQUE KEY constraint...` |
| `CHECK` | Informar um valor fora da condição permitida | `The INSERT statement conflicted with the CHECK constraint...` |
| `FOREIGN KEY` (inserção/atualização na tabela filha) | Referenciar um ID que não existe na tabela pai | `The INSERT/UPDATE statement conflicted with the FOREIGN KEY constraint...` |
| `FOREIGN KEY` (exclusão na tabela pai) | Excluir um registro pai ainda referenciado | `The DELETE statement conflicted with the REFERENCE constraint...` |

<h2 align="center">🛠️ Gerenciando Constraints <br>
<img src="https://img.shields.io/badge/-ALTER%20TABLE-3b82f6?style=flat-square"/></h2>

Constraints não precisam ser definidas apenas no `CREATE TABLE` — também podem ser gerenciadas depois,
em uma tabela já existente:

```sql
-- Adicionar uma nova constraint
ALTER TABLE dGerente
ADD CONSTRAINT CK_dGerente_Email CHECK (Email LIKE '%@%')

-- Desabilitar temporariamente (sem excluir a regra)
ALTER TABLE fContratos
NOCHECK CONSTRAINT CK_fContratos_Valor

-- Reabilitar já revalidando os dados existentes
ALTER TABLE fContratos
WITH CHECK CHECK CONSTRAINT CK_fContratos_Valor

-- Remover definitivamente
ALTER TABLE dGerente
DROP CONSTRAINT CK_dGerente_Email

-- Consultar todas as constraints de uma tabela
sp_helpconstraint 'fContratos'
```

<h2 align="center">📋 Resumo <br>
<img src="https://img.shields.io/badge/-Resumo-475569?style=flat-square"/></h2>

| Sintaxe | O que faz |
|---------|-----------|
| `NOT NULL` | Impede valores em branco na coluna |
| `UNIQUE` | Impede valores repetidos na coluna |
| `CHECK (condição)` | Só aceita valores que satisfaçam a condição |
| `DEFAULT valor` | Preenche automaticamente quando a coluna é omitida no `INSERT` |
| `IDENTITY(inicial, incremento)` | Gera valores sequenciais automaticamente |
| `PRIMARY KEY` | Identificador único da linha (`NOT NULL` + `UNIQUE`) |
| `FOREIGN KEY ... REFERENCES` | Garante integridade referencial entre tabelas |
| `ALTER TABLE ... ADD/DROP CONSTRAINT` | Adiciona ou remove uma constraint depois de criada a tabela |
| `ALTER TABLE ... NOCHECK/WITH CHECK CHECK CONSTRAINT` | Desabilita/reabilita uma constraint sem excluí-la |

<h2 align="center">🗄️ Conteúdo do Módulo <br>
<img src="https://img.shields.io/badge/-Tópicos-475569?style=flat-square"/></h2>

| Tópico | Status |
|--------|--------|
| O que são Constraints | ✅ Introduzido |
| NOT NULL, UNIQUE, CHECK, DEFAULT, IDENTITY, PRIMARY KEY, FOREIGN KEY | ✅ Concluído |
| Criando as tabelas dCliente, dGerente e fContratos com Constraints | ✅ Concluído |
| Violações de Constraints (NOT NULL, UNIQUE, PK, CHECK, FK) | ✅ Concluído |
| Gerenciando Constraints (ALTER TABLE, NOCHECK, DROP) | ✅ Concluído |
| Exercícios | ⏳ Pendente (aguardando enunciado) |
