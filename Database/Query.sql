-- Scenario 1: Basic One-to-One Filtering (CPU ➡️ Motherboard)
-- Logic: Dhoro ekjon user prothome 'Core i7-14700K' (Product ID: CPU002) select koreche. Ebar se jokhon Motherboard er list dekhbe, database ke shudhu shei motherboard guloi dekhate hobe jader socket_type ei CPU er socket (LGA1700) er sathe match kore.
-- SQL Query:
SELECT 
    p.name AS 'Compatible Motherboard', 
    p.brand AS 'Brand', 
    p.price AS 'Price ($)', 
    m.socket_type AS 'Socket', 
    m.supported_ram_type AS 'RAM Support'
FROM MOTHERBOARDS m
JOIN PRODUCTS p ON m.product_id = p.product_id
JOIN CPUS c ON m.socket_type = c.socket_type
WHERE c.product_id = 'CPU002';

-- (Eta run korle dekhbe shudhu LGA1700 socket er ASUS, Gigabyte, MSI er motherboard gulo asche, kono AM4 ba AM5 socket er motherboard asbe na!)
-- Scenario 2: Omni-directional / Multi-Constraint Filtering (CPU + RAM ➡️ Motherboard)
-- Logic (The CEP Level): Eita hocche ashol Star Tech ba PCPartPicker er level er logic! Dhoro user non-linear bhabe age 'Core i7-14700K' (CPU002) ebang 'Corsair Vengeance DDR5' (RAM001) select kore feleche.
-- Ekhon tomader system ke emon Motherboard khujte hobe jeta eki sathe LGA1700 socket ebang DDR5 RAM support kore. Kono LGA1700 motherboard jodi DDR4 support kore, tobe sheta ei list theke filter out (bad) hoye jabe.
-- SQL Query:
SELECT 
    p_mobo.name AS 'Perfect Match Motherboard',
    p_mobo.brand AS 'Brand',
    m.socket_type AS 'CPU Socket',
    m.supported_ram_type AS 'RAM Type',
    p_mobo.price AS 'Price ($)'
FROM MOTHERBOARDS m
JOIN PRODUCTS p_mobo ON m.product_id = p_mobo.product_id
JOIN CPUS c ON m.socket_type = c.socket_type
JOIN RAMS r ON m.supported_ram_type = r.ram_type
WHERE c.product_id = 'CPU002' 
  AND r.product_id = 'RAM001';

-- (Eta run kore dekho, ager query te jekhane DDR4 motherboard gulo (jemon 'Z690 UD AX') eshechilo, ebar segulo automatically bad pore shudhu DDR5 gulo ashbe!)
