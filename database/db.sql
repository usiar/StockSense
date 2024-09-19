-- Create the Company table
CREATE TABLE Company (
                         id INT PRIMARY KEY IDENTITY(1,1),  -- Auto-increment ID
                         name NVARCHAR(255) NOT NULL,        -- Company name
                         created_at DATETIME DEFAULT GETDATE() -- Timestamp when company is created
);

-- Create the Storage table
CREATE TABLE Storage (
                         id INT PRIMARY KEY IDENTITY(1,1),  -- Auto-increment ID
                         company_id INT,                    -- Foreign key to Company table
                         name NVARCHAR(255) NOT NULL,       -- Storage name
                         created_at DATETIME DEFAULT GETDATE(), -- Timestamp when storage is created
                         FOREIGN KEY (company_id) REFERENCES Company(id)  -- Establish many-to-one relationship
);

-- Create the Product table
CREATE TABLE Product (
                         id INT PRIMARY KEY IDENTITY(1,1),  -- Auto-increment ID
                         name NVARCHAR(255) NOT NULL,       -- Product name
                         description NVARCHAR(MAX),         -- Product description
                         created_at DATETIME DEFAULT GETDATE() -- Timestamp when product is created
);

-- Create the many-to-many join table for Storage and Product
CREATE TABLE StorageProduct (
                                storage_id INT,                     -- Foreign key to Storage table
                                product_id INT,                     -- Foreign key to Product table
                                PRIMARY KEY (storage_id, product_id), -- Composite primary key for many-to-many relationship
                                FOREIGN KEY (storage_id) REFERENCES Storage(id), -- Storage foreign key
                                FOREIGN KEY (product_id) REFERENCES Product(id)  -- Product foreign key
);
