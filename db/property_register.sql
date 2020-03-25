DROP TABLE property_register;
CREATE TABLE property_register(
    id SERIAL PRIMARY KEY,
    address VARCHAR(255),
    value INT,
    bedrooms INT,
    year INT
);

SELECT * FROM property_register;
