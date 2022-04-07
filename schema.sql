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

ALTER TABLE animals 
DROP COLUMN species;

CREATE TABLE owners (
  id SERIAL PRIMARY KEY, 
  name varchar(100) NOT NULL, 
  age INTEGER
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY, 
  name varchar(100) NOT NULL
);


ALTER TABLE animals 
ADD COLUMN species_id INTEGER, 
ADD COLUMN owner_id INTEGER;

ALTER TABLE animals 
ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners(id);

ALTER TABLE animals 
ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);

-- Project 4