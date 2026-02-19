<h1 align="center">
  ⚙️ GitHub Actions <br>
  <span style="color:#4FC3F7;">Workflows de Automação</span>
</h1>

<p align="center">
  Documentação técnica dos processos automatizados do repositório <strong>SQL - HashtagTreinamentos</strong> 🗄️📊
</p>

<h2 align="center">🎯 Objetivo dos Workflows</h2>

<p align="center">
Garantir validação automática de scripts SQL, organização estrutural do projeto e padronização profissional através de <strong>CI (Continuous Integration)</strong>.
</p>

<h2 align="center">📂 Estrutura dos Workflows: </h2>

<pre>
.github<img src="https://skillicons.dev/icons?i=github" width="15">/
└── workflows<img src="https://skillicons.dev/icons?i=githubactions" width="15"/>/
      ├── cm.yml<img src="https://skillicons.dev/icons?i=githubactions" width="15"/>
      ├── cm_validate.yml<img src="https://skillicons.dev/icons?i=githubactions" width="15"/>
      ├── documentation.yml<img src="https://skillicons.dev/icons?i=githubactions" width="15"/>
      └── desc.md <img src="https://img.shields.io/badge/Markdown-FFFFFF?style=flat-square&logo=markdown&logoColor=black" height="14"/>
</pre>

<h2 align="center">🧪 cm.yml — CI SQL</h2>

<p align="center">
Workflow responsável por executar todos os arquivos <code>.sql</code> automaticamente em ambiente Linux (Ubuntu) utilizando banco temporário SQLite.
</p>

<strong>Responsabilidades:</strong>

- Executar scripts SQL em ambiente isolado;  
- Validar sintaxe automaticamente;  
- Detectar erros antes de merge;  
- Rodar em push e pull request.  

<h2 align="center">🔎 cm_validate.yml — Validação Estrutural</h2>

<p align="center">
Workflow dedicado à validação organizacional do projeto.
</p>

<strong>Responsabilidades: </strong>

- Monitorar alterações em arquivos SQL;  
- Garantir existência de scripts nas pastas corretas;  
- Validar consistência estrutural;  
- Manter padrão do repositório.

<h2 align="center">🚀 Benefícios da Automação: </h2>

<p align="center">

✅ Redução de erros manuais;
✅ Garantia de integridade dos scripts; 
✅ Padronização profissional;
✅ Preparação para ambiente corporativo; e
✅ Aplicação prática de DevOps em SQL.

</p>

<h2 align="center">🏛️ Integração com o Projeto: </h2>

<p align="center">
Os workflows garantem que consultas envolvendo tabelas como <strong>categorias, clientes, historico_produtos, itens_pedido, pagamentos, pedidos, produtos, resumo_pagamentos e vendedores</strong> estejam sempre validadas estruturalmente.
</p>