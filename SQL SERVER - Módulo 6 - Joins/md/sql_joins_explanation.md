<h1 align="center">
  <span style="color:#4FC3F7;">SQL</span> - <br>
  <span style="color:purple;">Guia Completo de JOINs</span>
<img src="https://cdn-icons-png.flaticon.com/512/2772/2772128.png" width="36" style="vertical-align:middle;"/>
</h1>

<p align="center">
<img src="../img/sql joins.jpeg" alt="SQL JOINs" width="600">
</p>

<p align="center">
Guia completo e profissional sobre <strong>JOINs no SQL</strong>, abordando conceitos, funcionamento lógico, diferenças entre tipos de junção e boas práticas de mercado 🗄️📊  
<br><br>
<img src="https://img.shields.io/badge/SQL-111827?style=flat-square&logo=instructure&logoColor=white" style="vertical-align:middle; margin-left:5px;"/>
</p>

<h2 align="center">📚 O que são JOINs?</h2>

<p align="center">
<strong>'JOIN'</strong> é o recurso do SQL responsável por <strong>combinar dados de duas ou mais tabelas</strong> com base em uma condição lógica entre colunas relacionadas.<br><br>
Em bancos relacionais, os JOINs permitem reconstruir informações distribuídas entre tabelas fato e dimensão, mantendo integridade e organização dos dados.
</p>

<h2 align="center">🔗 Tipos de JOIN no SQL</h2>

<h3 align="center">1️⃣ INNER JOIN</h3>

<p align="center">
Retorna apenas os registros que possuem correspondência em <strong>ambas as tabelas</strong>.<br>
É o tipo de JOIN mais utilizado no mercado.
</p>

📌 Características:
- Exclui registros sem correspondência;  
- Mantém apenas interseção entre tabelas;  
- Ideal para análises com relacionamento obrigatório.

<h3 align="center">2️⃣ LEFT JOIN (LEFT OUTER JOIN)</h3>

<p align="center">
Retorna todos os registros da tabela da esquerda e apenas os correspondentes da tabela da direita.
</p>

📌 Características:
- Mantém 100% da tabela da esquerda;  
- Onde não houver correspondência, retorna NULL;  
- Muito usado para identificar ausência de relacionamento.

<h3 align="center">3️⃣ RIGHT JOIN (RIGHT OUTER JOIN)</h3>

<p align="center">
Retorna todos os registros da tabela da direita e apenas os correspondentes da tabela da esquerda.
</p>

📌 Características:
- Mantém 100% da tabela da direita;  
- NULL onde não houver correspondência;  
- Menos utilizado que o LEFT JOIN.

<h3 align="center">4️⃣ FULL JOIN (FULL OUTER JOIN)</h3>

<p align="center">
Retorna todos os registros de ambas as tabelas, combinando correspondentes e preenchendo com NULL onde não houver correspondência.
</p>

📌 Características:
- União completa das tabelas;  
- Inclui interseção + exclusivos da esquerda + exclusivos da direita;  
- Excelente para auditorias e reconciliações de dados.

<h3 align="center">5️⃣ CROSS JOIN</h3>

<p align="center">
Retorna o produto cartesiano entre as tabelas.
</p>

📌 Características:
- Cada linha da tabela A combina com todas as linhas da tabela B;  
- Pode gerar grande volume de dados;  
- Usado com cautela.

<h3 align="center">6️⃣ SELF JOIN</h3>

<p align="center">
Junção de uma tabela com ela mesma.
</p>

📌 Características:
- Utiliza alias obrigatoriamente;  
- Comum em estruturas hierárquicas;  
- Aplicado em organogramas, dependências e relações internas.

<h2 align="center">🧠 Conceito Lógico por Trás dos JOINs</h2>

<p align="center">
Todo JOIN depende de uma <strong>condição de relacionamento</strong>, normalmente baseada em:
</p>

- Chave primária e chave estrangeira;  
- Relacionamentos 1:1, 1:N ou N:N;  
- Igualdade lógica entre colunas.

<h2 align="center">⚖️ Diferença Entre JOIN e WHERE</h2>

<p align="center">
JOIN define <strong>como as tabelas se relacionam</strong>.<br>
WHERE define <strong>quais registros serão filtrados</strong> após a junção.
</p>

<h2 align="center">🚀 Boas Práticas Profissionais</h2>

- Sempre utilizar aliases claros;  
- Garantir que colunas de junção estejam indexadas;  
- Evitar CROSS JOIN sem necessidade;  
- Preferir LEFT JOIN ao invés de RIGHT JOIN por padrão de leitura;  
- Validar cardinalidade antes de aplicar agregações.

<h2 align="center">🏛️ Contexto em Data Warehouses</h2>

<p align="center">
JOINs são fundamentais em modelos:
</p>

- Tabela Fato × Tabela Dimensão;  
- Modelo Estrela (Star Schema);  
- Modelo Floco de Neve (Snowflake Schema).

<h2 align="center">🎯 Objetivo deste Guia</h2>

<p align="center">
Fornecer uma base sólida e profissional sobre JOINs, preparando para:<br><br>
✔️ Consultas complexas;<br>
✔️ Análises de dados avançadas;<br>
✔️ Modelagem relacional;<br>
✔️ Performance e otimização.
</p>

<h2 align="center">💻 Compatibilidade</h2>

<div align="center">
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" height="28"/>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" height="28"/>
  <img src="https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white" height="28"/>
  <img src="https://img.shields.io/badge/SQLServer-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white" height="28"/>
</div>

<h2 align="center">📌 Conclusão</h2>

<p align="center">
Dominar JOINs é essencial para qualquer profissional de dados.<br>
Eles representam a base da análise relacional e da construção de consultas robustas em SQL.
</p>