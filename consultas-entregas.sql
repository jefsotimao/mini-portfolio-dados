-- 📦 Base: entregas
-- Este script contém consultas SQL para análise de dados logísticos.
-- Autor: Jeferson Carlos
-- Projeto: Mini Portfólio de Dados (Parte 2)

------------------------------------------------------------
-- 1️⃣ Total de entregas por status
------------------------------------------------------------
SELECT 
    Status, 
    COUNT(*) AS Total_Entregas
FROM entregas
GROUP BY Status
ORDER BY Total_Entregas DESC;

------------------------------------------------------------
-- 2️⃣ Média de valor de frete e distância por cidade de destino
------------------------------------------------------------
SELECT 
    Cidade_Destino,
    ROUND(AVG(Valor_Frete), 2) AS Media_Frete,
    ROUND(AVG(Distancia_km), 1) AS Media_Distancia
FROM entregas
GROUP BY Cidade_Destino
ORDER BY Media_Frete DESC;

------------------------------------------------------------
-- 3️⃣ Top 5 motoristas com mais entregas
------------------------------------------------------------
SELECT 
    Motorista, 
    COUNT(*) AS Total_Entregas
FROM entregas
GROUP BY Motorista
ORDER BY Total_Entregas DESC
LIMIT 5;

------------------------------------------------------------
-- 4️⃣ Total de entregas atrasadas
------------------------------------------------------------
SELECT 
    COUNT(*) AS Total_Atrasadas
FROM entregas
WHERE Status = 'Atrasada';

------------------------------------------------------------
-- 5️⃣ Prazo médio e valor médio das entregas concluídas
------------------------------------------------------------
SELECT 
    ROUND(AVG(Prazo_dias), 2) AS Prazo_Medio,
    ROUND(AVG(Valor_Frete), 2) AS Valor_Medio
FROM entregas
WHERE Status = 'Concluída';

------------------------------------------------------------
-- 6️⃣ Relação entre distância e valor do frete (classificação)
------------------------------------------------------------
SELECT 
    CASE 
        WHEN Distancia_km < 200 THEN 'Curta'
        WHEN Distancia_km BETWEEN 200 AND 500 THEN 'Média'
        ELSE 'Longa'
    END AS Faixa_Distancia,
    ROUND(AVG(Valor_Frete), 2) AS Media_Frete
FROM entregas
GROUP BY Faixa_Distancia
ORDER BY Media_Frete DESC;
