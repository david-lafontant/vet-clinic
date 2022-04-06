/* Database schema to keep the structure of entire database. */

-- Project 1
CREATE DATABASE vet_clinic;

CREATE TABLE animals ( id SERIAL PRIMARY KEY, 
name varchar(100) NOT NULL,
date_of_birth DATE NOT NULL,
escape_attempts INTEGER,
neutered BOOLEAN,
weight_kg REAL);

-- Project 2

ALTER TABLE animals
ADD COLUMN species varchar(100);

-- Project 3
