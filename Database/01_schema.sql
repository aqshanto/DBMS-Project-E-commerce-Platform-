CREATE DATABASE pc_builder_db;

USE pc_builder_db;

CREATE TABLE CATEGORIES (
    category_id VARCHAR(20) PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE PRODUCTS (
    product_id VARCHAR(30) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    category_id VARCHAR(20),
    FOREIGN KEY (category_id) REFERENCES CATEGORIES(category_id) 
        ON UPDATE CASCADE 
        ON DELETE SET NULL
);

--Note: ON DELETE SET NULL deya hoyeche jate kono category delete hoye geleo product ta database theke harie na jay, shudhu category faka hoye jay.

CREATE TABLE CPUS (
    product_id VARCHAR(30) PRIMARY KEY,
    socket_type VARCHAR(50) NOT NULL,
    core_count INT NOT NULL,
    tdp_watt DECIMAL(6, 2) NOT NULL,
    passmark_score INT,
    FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

--Logic Check: Ekhane ON DELETE CASCADE bebohar kora hoyeche. Er mane holo, admin jodi PRODUCTS table theke kono CPU delete kore dey, tahole ei CPUS table thekeo automatically shei row ta delete hoye jabe. Eta data redundancy ebang orphan data thekate khub kaje dey.

CREATE TABLE MOTHERBOARDS (
    product_id VARCHAR(30) PRIMARY KEY,
    socket_type VARCHAR(50) NOT NULL,
    form_factor VARCHAR(50) NOT NULL,
    supported_ram_type VARCHAR(20) NOT NULL,
    m2_slots INT DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);
