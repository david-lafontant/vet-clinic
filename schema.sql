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

CREATE TABLE vets ( id SERIAL PRIMARY KEY, 
name varchar(100) NOT NULL,
age INTEGER,
date_of_graduation DATE NOT NULL);

CREATE TABLE specialization (
  species_id INT, 
  vets_id INT, 
  CONSTRAINT species_key FOREIGN KEY (species_id) REFERENCES species(id), 
  CONSTRAINT vets_key FOREIGN KEY (vets_id) REFERENCES vets(id) ON DELETE CASCADE
);

CREATE TABLE visits (
  animal_id INT, 
  vets_id INT, 
  date_of_visit DATE, 
  CONSTRAINT animals_key FOREIGN KEY (animal_id) REFERENCES animals(id), 
  CONSTRAINT vets_key FOREIGN KEY (vets_id) REFERENCES vets(id)
);

-- Performance Database (Project)

CREATE INDEX visits_animals_index ON visits(animals_id);

CREATE INDEX visits_vets_index ON visits(vets_id desc);

CREATE INDEX owners_email_index ON owners(email);
