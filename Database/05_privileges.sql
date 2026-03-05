-- Step 1: Purono user thakle delete kore fela (Clean slate)
DROP USER IF EXISTS 'pc_admin'@'localhost';
DROP USER IF EXISTS 'pc_customer'@'localhost';

-- Step 2: Notun duto User toiri kora ebang Password set kora
CREATE USER 'pc_admin'@'localhost' IDENTIFIED BY 'Admin@1234';
CREATE USER 'pc_customer'@'localhost' IDENTIFIED BY 'Customer@1234';

-- Step 3: Admin ke FULL ACCESS deya (She shob korte parbe)
GRANT ALL PRIVILEGES ON pc_builder_db.* TO 'pc_admin'@'localhost';

-- Step 4: Customer ke LIMITED ACCESS deya
-- a. Customer pura database er shob data shudhu dekhte (SELECT) parbe
GRANT SELECT ON pc_builder_db.* TO 'pc_customer'@'localhost';

-- b. Kintu Customer shudhu matro BUILDS ar BUILD_ITEMS table e notun data dhukate ba edit korte parbe
GRANT INSERT, UPDATE, DELETE ON pc_builder_db.BUILDS TO 'pc_customer'@'localhost';
GRANT INSERT, UPDATE, DELETE ON pc_builder_db.BUILD_ITEMS TO 'pc_customer'@'localhost';

-- Step 5: Privileges gulo database e save (Apply) kora
FLUSH PRIVILEGES;

-- Sir jokhon "Authentication and Privileges" er kaj dekhte chaibe, tumi ei SQL script ta dekhiye bolbe: "Sir, amra DCL (Data Control Language) bebohar kore system ke secure korechi. Ekjon normal user chaileo amader kono product er table e Drop ba Delete command chalate parbe na, karon tar kase shudhu SELECT privilege deya ase."
