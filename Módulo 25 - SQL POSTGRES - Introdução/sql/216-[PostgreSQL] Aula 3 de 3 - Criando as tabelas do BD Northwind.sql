-- ============================================================
-- 🐘 PostgreSQL  |  📦 Módulo 25 — Introdução
-- 📖 Aula 3 de 3  |  Criando as tabelas do BD Northwind
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — O banco Northwind
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  O Northwind é um banco de dados de exemplo, criado pela
  Microsoft, que simula uma empresa de importação/exportação
  de alimentos: tem Clientes, Funcionários, Fornecedores,
  Produtos, Categorias, Pedidos e os Itens de cada Pedido.

  É um dos bancos de exemplo mais usados no mundo para estudar
  SQL - e será o banco usado daqui pra frente no PostgreSQL,
  no lugar dos bancos avulsos criados em cada módulo do SQL
  Server.

  Principais diferenças de sintaxe usadas abaixo (SQL Server → PostgreSQL):
  - IDENTITY(1,1) →  GENERATED ALWAYS AS IDENTITY (ou SERIAL)
  - VARCHAR / INT →  mesmos tipos, sem mudança
  - GO →  não existe no Postgres❌ (usa apenas ";")
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Rode este script já conectado dentro do banco criado no
-- pgAdmin na aula anterior.

-- 1️⃣ Categorias dos produtos
CREATE TABLE categories 
(
   category_id    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   category_name  VARCHAR(50)  NOT NULL,
   description    VARCHAR(255)
);

-- 2️⃣ Fornecedores
CREATE TABLE suppliers 
(
   supplier_id    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   company_name   VARCHAR(50)  NOT NULL,
   contact_name   VARCHAR(50),
   country        VARCHAR(50)
);

-- 3️⃣ Produtos
CREATE TABLE products 
(
   product_id     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   product_name   VARCHAR(50)     NOT NULL,
   supplier_id    INT REFERENCES suppliers(supplier_id),
   category_id    INT REFERENCES categories(category_id),
   unit_price     DECIMAL(10,2)   NOT NULL DEFAULT 0,
   units_in_stock INT             NOT NULL DEFAULT 0,
   discontinued   BOOLEAN         NOT NULL DEFAULT FALSE
);

-- 4️⃣ Transportadoras
CREATE TABLE shippers 
(
   shipper_id     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   company_name   VARCHAR(50) NOT NULL,
   phone          VARCHAR(24)
);

-- 5️⃣ Clientes
CREATE TABLE customers 
(
   customer_id    CHAR(5) PRIMARY KEY,
   company_name   VARCHAR(50) NOT NULL,
   contact_name   VARCHAR(50),
   country        VARCHAR(50),
   city           VARCHAR(50)
);

-- 6️⃣ Funcionários
CREATE TABLE employees 
(
   employee_id    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   first_name     VARCHAR(50) NOT NULL,
   last_name      VARCHAR(50) NOT NULL,
   title          VARCHAR(50),
   birth_date     DATE,
   hire_date      DATE,
   reports_to     INT REFERENCES employees(employee_id)
);

-- 7️⃣ Pedidos
CREATE TABLE orders 
(
   order_id       INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   customer_id    CHAR(5) REFERENCES customers(customer_id),
   employee_id    INT REFERENCES employees(employee_id),
   shipper_id     INT REFERENCES shippers(shipper_id),
   order_date     DATE NOT NULL,
   shipped_date   DATE,
   freight        DECIMAL(10,2) DEFAULT 0
);

-- 8️⃣ Itens de cada pedido
CREATE TABLE order_details 
(
   order_id       INT REFERENCES orders(order_id),
   product_id     INT REFERENCES products(product_id),
   unit_price     DECIMAL(10,2) NOT NULL,
   quantity       INT           NOT NULL,
   discount       DECIMAL(4,2)  NOT NULL DEFAULT 0,
   PRIMARY KEY (order_id, product_id)
);

-- ────────────────────────────────────────────────────────────
-- 🌱 Populando com alguns dados de exemplo
-- ────────────────────────────────────────────────────────────

INSERT INTO categories (category_name, description) VALUES
   ('Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
   ('Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
   ('Produce', 'Dried fruit and bean curd'),
   ('Seafood', 'Seaweed and fish');

INSERT INTO suppliers (company_name, contact_name, country) VALUES
   ('Exotic Liquids', 'Charlotte Cooper', 'UK'),
   ('New Orleans Cajun Delights', 'Shelley Burke', 'USA'),
   ('Tokyo Traders', 'Yoshi Nagase', 'Japan');

INSERT INTO products (product_name, supplier_id, category_id, unit_price, units_in_stock) VALUES
   ('Chai',        1, 1, 18.00, 39),
   ('Chang',       1, 1, 19.00, 17),
   ('Chef Anton''s Cajun Seasoning', 2, 2, 22.00, 53),
   ('Ikura',       3, 4, 31.00, 31);

INSERT INTO shippers (company_name, phone) VALUES
   ('Speedy Express', '(503) 555-9831'),
   ('United Package', '(503) 555-3199');

INSERT INTO customers (customer_id, company_name, contact_name, country, city) VALUES
   ('ALFKI', 'Alfreds Futterkiste',        'Maria Anders',    'Germany', 'Berlin'),
   ('ANATR', 'Ana Trujillo Emparedados',   'Ana Trujillo',    'Mexico',  'México D.F.'),
   ('ANTON', 'Antonio Moreno Taquería',    'Antonio Moreno',  'Mexico',  'México D.F.');

INSERT INTO employees (first_name, last_name, title, birth_date, hire_date) VALUES
   ('Nancy',   'Davolio',  'Sales Representative', '1968-12-08', '2020-05-01'),
   ('Andrew',  'Fuller',   'Sales Manager',        '1962-02-19', '2019-08-14');

INSERT INTO orders (customer_id, employee_id, shipper_id, order_date, shipped_date, freight) VALUES
   ('ALFKI', 1, 1, '2024-07-04', '2024-07-16', 32.38),
   ('ANATR', 2, 2, '2024-07-05', '2024-07-10', 11.61);

INSERT INTO order_details (order_id, product_id, unit_price, quantity, discount) VALUES
   (1, 1, 18.00, 12, 0),
   (1, 3, 22.00, 10, 0.05),
   (2, 2, 19.00, 5, 0);

-- Conferindo os dados
SELECT * FROM customers;
SELECT * FROM orders;