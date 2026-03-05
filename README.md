```mermaid
erDiagram
    USERS {
        string user_id PK
        string name
        string email
        string password_hash
        string role
    }

    CATEGORIES {
        string category_id PK
        string category_name
    }

    PRODUCTS {
        string product_id PK
        string name
        string brand
        float price
        int stock_quantity
        string category_id FK
    }

    CPUS {
        string product_id PK "Also FK to PRODUCTS"
        string socket_type
        int core_count
        float tdp_watt
        int passmark_score
    }

    MOTHERBOARDS {
        string product_id PK "Also FK to PRODUCTS"
        string socket_type
        string form_factor
        string supported_ram_type
        int m2_slots
    }

    RAMS {
        string product_id PK "Also FK to PRODUCTS"
        string ram_type
        int capacity_gb
        int speed_mhz
    }

    GPUS {
        string product_id PK "Also FK to PRODUCTS"
        float length_mm
        float tdp_watt
        int passmark_score
    }

    CASINGS {
        string product_id PK "Also FK to PRODUCTS"
        string supported_form_factors
        float max_gpu_length_mm
    }

    PSUS {
        string product_id PK "Also FK to PRODUCTS"
        float wattage
        string form_factor
    }

    BUILDS {
        string build_id PK
        string build_name
        float total_price
        float total_wattage
        date created_at
        string user_id FK
    }

    BUILD_ITEMS {
        string build_item_id PK
        string build_id FK
        string product_id FK
        int quantity
    }

    PRICE_HISTORY_LOG {
        string log_id PK
        float old_price
        float new_price
        date change_date
        string product_id FK
    }

    %% Core Relationships
    USERS ||--o{ BUILDS : "saves"
    CATEGORIES ||--o{ PRODUCTS : "contains"
    
    %% Inheritance Relationships (1 to 0 or 1)
    PRODUCTS ||--o| CPUS : "is_a"
    PRODUCTS ||--o| MOTHERBOARDS : "is_a"
    PRODUCTS ||--o| RAMS : "is_a"
    PRODUCTS ||--o| GPUS : "is_a"
    PRODUCTS ||--o| CASINGS : "is_a"
    PRODUCTS ||--o| PSUS : "is_a"
    
    %% Build Details and Logs
    BUILDS ||--|{ BUILD_ITEMS : "has"
    PRODUCTS ||--o{ BUILD_ITEMS : "included_in"
    PRODUCTS ||--o{ PRICE_HISTORY_LOG : "tracked_in"
