-- ==============================================================================
-- 🔤 [SQL Server] Funções Condicionais
-- 📚 Aula 7 de 18: CASE Aninhado (Nested CASE)
-- ==============================================================================
-- Introdução: O CASE aninhado ocorre quando utilizamos um bloco CASE dentro de outro.
-- Isso é útil para aplicar regras mais detalhadas, onde uma condição secundária 
-- só é avaliada após a condição principal ser atendida.
-- ==============================================================================

-- 🔍 Consulta de referência (Tabela de origem)

-- SELECT * FROM DimEmployee;

-- ==============================================================================
-- 📋 Execução do Exemplo: Cálculo de Bônus por Cargo e Salário
-- ==============================================================================

SELECT DISTINCT
    FirstName AS "Nome do Funcionário", -- 👤 Primeiro nome do funcionário
    Title AS "Cargo do Funcionário", -- 💼 Cargo do funcionário
    SalariedFlag AS "Flag de Salário", -- 💰 Indicador se é assalariado (1) ou não (0)
    CASE
        WHEN 
			Title = 'Sales Group Manager' 
			THEN 
            CASE    
                WHEN 
					SalariedFlag = 1 THEN 0.20 -- 🟢 Se for assalariado: 20% de bônus
                ELSE 
					0.15 -- 🔴 Se não for assalariado: 15% de bônus
            END
        WHEN 
			Title = 'Sales Region Manager' 
		THEN 
			0.15 -- 📊 Bônus de 15% para este cargo
        WHEN 
			Title = 'Sales State Manager' 
		THEN 
			0.07 -- 📉 Bônus de 7 % para este cargo
        ELSE 
			0.02 -- 🛒 Bônus de 2% para os demais (ex: Sales Store Manager)
    END AS "Bônus Percentual" -- 🏷️ Nova coluna calculada com o percentual de bônus
FROM
    DimEmployee; -- 🏢 Tabela de onde os dados são extraídos