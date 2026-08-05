<h1 align="center">
  ƒ(x) Functions <br>
  <img src="https://img.shields.io/badge/-CREATE%20FUNCTION-14b8a6?style=flat-square"/>
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/Módulo-20-4FC3F7?style=flat-square"/>
  <img src="https://img.shields.io/badge/Slide-Módulo%2021-blueviolet?style=flat-square"/>
</p>

> 📌 Seguindo o padrão dos módulos anteriores, nos slides de abertura o instrutor deve numerar este
> conteúdo como **"Módulo 21"**, correspondendo à pasta `Módulo 20` deste repositório.

> 🖼️ Este módulo ainda não tem screenshots das aulas na pasta `img/` — assim que forem adicionados,
> as tags `<img>` correspondentes entram nas seções abaixo.

<h2 align="center">💡 O que é uma Function? <br>
<img src="https://img.shields.io/badge/-Conceito-f59e0b?style=flat-square"/></h2>

**Para que serve:**

- Uma **Function** definida pelo usuário encapsula uma lógica que se repete em várias consultas, com
  um nome reutilizável — evita repetir a mesma expressão/`CASE` em várias queries e centraliza a regra
  de negócio em um único lugar;
- Existem dois tipos principais: **Scalar Function** (devolve um único valor) e **Table-Valued
  Function**/TVF (devolve uma tabela inteira, usável no `FROM`).

```sql
CREATE FUNCTION nome_da_function (@parametro tipo)
RETURNS tipo_de_retorno
AS
BEGIN
    DECLARE @resultado tipo_de_retorno

    -- lógica...

    RETURN @resultado
END
```

> 💬 Diferente de uma Procedure, uma Function é **obrigada** a devolver um valor com `RETURN` e não
> pode executar `INSERT`/`UPDATE`/`DELETE` — ela serve para **calcular e devolver algo**, não para
> alterar dados.

<h2 align="center">🚀 Criando e utilizando uma Scalar Function <br>
<img src="https://img.shields.io/badge/-CREATE%20FUNCTION-3b82f6?style=flat-square"/></h2>

```sql
CREATE FUNCTION dbo.fn_SalarioAnual(@Salario DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salario * 13
END

-- Usada como qualquer expressão: no SELECT, WHERE, etc.
SELECT Nome, Salario, dbo.fn_SalarioAnual(Salario) AS SalarioAnual
FROM Funcionario
WHERE dbo.fn_SalarioAnual(Salario) > 50000
```

<h2 align="center">🔀 Estruturas condicionais dentro da Function <br>
<img src="https://img.shields.io/badge/-IF%20..%20ELSE-8b5cf6?style=flat-square"/></h2>

O corpo aceita `IF/ELSE` normalmente — a única regra é que, em **qualquer** caminho possível, a
function precisa terminar em `RETURN`:

```sql
CREATE FUNCTION dbo.fn_ClassificarSalario(@Salario DECIMAL(10,2))
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @Classificacao VARCHAR(20)

    IF @Salario < 2000
        SET @Classificacao = 'Baixo'
    ELSE IF @Salario BETWEEN 2000 AND 8000
        SET @Classificacao = 'Médio'
    ELSE
        SET @Classificacao = 'Alto'

    RETURN @Classificacao
END
```

<h2 align="center">🧮 Funções mais complexas <br>
<img src="https://img.shields.io/badge/-M%C3%BAltiplos%20par%C3%A2metros-475569?style=flat-square"/></h2>

Uma function pode receber vários parâmetros e usar várias variáveis locais para organizar o cálculo
em etapas:

```sql
CREATE FUNCTION dbo.fn_CalcularBonus(@Salario DECIMAL(10,2), @AnosDeCasa INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @PercentualBonus DECIMAL(5,2)
    DECLARE @ValorBonus DECIMAL(10,2)
    DECLARE @BonusMinimo DECIMAL(10,2) = 100.00

    SET @PercentualBonus = CASE WHEN @AnosDeCasa > 5 THEN 0.10 ELSE 0.05 END
    SET @ValorBonus = @Salario * @PercentualBonus

    IF @ValorBonus < @BonusMinimo
        SET @ValorBonus = @BonusMinimo

    RETURN @ValorBonus
END
```

<h2 align="center">📊 Table-Valued Function (TVF) <br>
<img src="https://img.shields.io/badge/-RETURNS%20TABLE-475569?style=flat-square"/></h2>

Devolve uma tabela inteira, usada no `FROM` como se fosse uma tabela/view:

```sql
CREATE FUNCTION dbo.fn_FuncionariosComBonusAcimaDe(@ValorMinimo DECIMAL(10,2))
RETURNS TABLE
AS
RETURN
(
    SELECT
        Nome,
        Salario,
        dbo.fn_CalcularBonus(Salario, AnosDeCasa) AS Bonus
    FROM Funcionario
    WHERE dbo.fn_CalcularBonus(Salario, AnosDeCasa) >= @ValorMinimo
)

SELECT * FROM dbo.fn_FuncionariosComBonusAcimaDe(500.00)
```

<h2 align="center">📋 Resumo <br>
<img src="https://img.shields.io/badge/-Resumo-475569?style=flat-square"/></h2>

| Sintaxe | O que faz |
|---------|-----------|
| `CREATE FUNCTION nome(@parametro) RETURNS tipo AS BEGIN ... RETURN valor END` | Cria uma scalar function |
| `CREATE FUNCTION nome(@parametro) RETURNS TABLE AS RETURN (SELECT ...)` | Cria uma table-valued function |
| `dbo.nome_da_function(argumento)` | Chama a function (scalar: em expressões; TVF: no `FROM`) |
| `sys.objects` (`type` = `FN`/`IF`/`TF`) | Consulta as functions existentes no banco |

<h2 align="center">🗄️ Conteúdo do Módulo <br>
<img src="https://img.shields.io/badge/-Tópicos-475569?style=flat-square"/></h2>

| Tópico | Status |
|--------|--------|
| O que é uma Function (scalar vs table-valued) | ✅ Concluído |
| Como criar e utilizar uma Function | ✅ Concluído |
| Estrutura condicional dentro de uma Function | ✅ Concluído |
| Funções complexas: múltiplos parâmetros e Table-Valued Function | ✅ Concluído |
| Exercícios | ⏳ Pendente (aguardando enunciado) |
