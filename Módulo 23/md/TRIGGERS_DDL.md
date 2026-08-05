<h1 align="center">
  🏛️ Triggers DDL <br>
  <img src="https://img.shields.io/badge/-EVENTDATA()-14b8a6?style=flat-square"/>
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/Módulo-23-4FC3F7?style=flat-square"/>
  <img src="https://img.shields.io/badge/Slide-Módulo%2024-blueviolet?style=flat-square"/>
</p>

> 📌 Seguindo o padrão dos módulos anteriores, nos slides de abertura o instrutor deve numerar este
> conteúdo como **"Módulo 24"**, correspondendo à pasta `Módulo 23` deste repositório.

> 🖼️ Este módulo ainda não tem screenshots das aulas na pasta `img/` — assim que forem adicionados,
> as tags `<img>` correspondentes entram nas seções abaixo.

<h2 align="center">💡 O que é uma Trigger DDL? <br>
<img src="https://img.shields.io/badge/-Conceito-f59e0b?style=flat-square"/></h2>

**Para que serve:**

- Enquanto uma Trigger **DML** reage a mudanças nos **dados**, uma Trigger **DDL** reage a mudanças na
  **estrutura** do banco: `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`, `CREATE PROCEDURE`, etc;
- É uma ferramenta de **auditoria e governança**: registra (ou até bloqueia) quem alterou a estrutura
  do banco, quando e o quê.

| Escopo | Alcance |
|--------|---------|
| `ON DATABASE` | Eventos DDL dentro de **um** banco específico |
| `ON ALL SERVER` | Eventos DDL em **qualquer** banco da instância |

```sql
CREATE TRIGGER nome_da_trigger
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    -- comandos T-SQL, usando EVENTDATA()
END
```

> 💬 Diferente das Triggers DML, uma Trigger DDL **não** tem as tabelas `inserted`/`deleted` — os
> detalhes do evento vêm da função `EVENTDATA()`, que devolve um XML com tipo do evento, objeto
> afetado, comando T-SQL executado e login que executou.

<h2 align="center">📝 Criando uma Trigger DDL <br>
<img src="https://img.shields.io/badge/-CREATE%20TRIGGER-8b5cf6?style=flat-square"/></h2>

```sql
CREATE TRIGGER trg_LogEstrutura
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    DECLARE @EventData XML = EVENTDATA()

    INSERT INTO LogAlteracoesEstrutura(Evento, ObjetoAlvo, ComandoTSQL, LoginUsado)
    VALUES (
        @EventData.value('(/EVENT_INSTANCE/EventType)[1]', 'VARCHAR(100)'),
        @EventData.value('(/EVENT_INSTANCE/ObjectName)[1]', 'VARCHAR(200)'),
        @EventData.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'NVARCHAR(MAX)'),
        @EventData.value('(/EVENT_INSTANCE/LoginName)[1]', 'VARCHAR(100)')
    )
END
```

| Nó do XML (`EVENTDATA()`) | O que contém |
|-----------------------------|----------------|
| `EventType` | Tipo do evento (ex.: `CREATE_TABLE`) |
| `ObjectName` | Nome do objeto afetado |
| `TSQLCommand/CommandText` | Comando T-SQL que disparou o evento |
| `LoginName` | Login que executou o comando |

<h2 align="center">🛠️ Habilitando, Desabilitando e Excluindo <br>
<img src="https://img.shields.io/badge/-Gerenciamento-475569?style=flat-square"/></h2>

```sql
DISABLE TRIGGER trg_LogEstrutura ON DATABASE  -- desliga temporariamente
ENABLE TRIGGER trg_LogEstrutura ON DATABASE   -- liga de novo
DROP TRIGGER trg_LogEstrutura ON DATABASE     -- remove definitivamente

-- Consultando as triggers DDL do banco (parent_class = 0)
SELECT name, is_disabled FROM sys.triggers WHERE parent_class = 0
```

<h2 align="center">📋 Resumo <br>
<img src="https://img.shields.io/badge/-Resumo-475569?style=flat-square"/></h2>

| Sintaxe | O que faz |
|---------|-----------|
| `CREATE TRIGGER nome ON DATABASE FOR evento(s) AS ...` | Cria uma trigger DDL de escopo de banco |
| `CREATE TRIGGER nome ON ALL SERVER FOR evento(s) AS ...` | Cria uma trigger DDL de escopo de servidor |
| `EVENTDATA()` | XML com os detalhes do evento DDL disparado |
| `DISABLE/ENABLE TRIGGER nome ON DATABASE` | Desliga/liga a trigger sem excluí-la |
| `DROP TRIGGER nome ON DATABASE` | Remove a trigger definitivamente |

<h2 align="center">🗄️ Conteúdo do Módulo <br>
<img src="https://img.shields.io/badge/-Tópicos-475569?style=flat-square"/></h2>

| Tópico | Status |
|--------|--------|
| O que é uma Trigger DDL (escopo DATABASE vs ALL SERVER, EVENTDATA) | ✅ Concluído |
| Criando uma Trigger DDL (CREATE_TABLE, ALTER_TABLE, DROP_TABLE) | ✅ Concluído |
| Habilitando, Desabilitando e Excluindo uma Trigger DDL | ✅ Concluído |
