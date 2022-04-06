/*Queries that provide answers to the questions from all projects.*/
-- Project 1

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND  escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT name FROM animals WHERE neutered = TRUE;
SELECT name FROM animals WHERE name <>'Gabumon';
SELECT name FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Project 2
-- Transactions

BEGIN;
UPDATE animals
SET species = 'unspecified';

SELECT name, species FROM animals;

ROLLBACK;

SELECT name, species FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

SELECT species, name FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;


SELECT * FROM animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SELECT name, date_of_birth FROM animals; 

SAVEPOINT SAVEPOINT_01;

UPDATE animals
SET weight_kg = weight_kg * -1;
SELECT name, weight_kg FROM animals;

ROLLBACK TO SAVEPOINT_01;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT name, weight_kg FROM animals;

-- Queries

SELECT COUNT(*) as number_of_animals FROM animals;

SELECT COUNT(*) as number_of_animals_not_tried_to_escape FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) as average_weight FROM animals;

SELECT neutered, SUM(escape_attempts) as escape_attempted FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) as avergage_escape_attempted FROM animals
WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000
GROUP BY species;

-- Project 3

SELECT animals.name
FROM animals 
INNER JOIN owners 
ON animals.owner_id = owners.id 
WHERE owners.name = 'Melody Pond';  

SELECT animals.name
FROM animals 
INNER JOIN species 
ON animals.species_id = species.id 
WHERE species.name = 'Pokemon';

SELECT owners.name as owner_name, animals.name as animal_name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.id)
FROM species
JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

SELECT animals.name as animal_name
FROM owners
JOIN animals ON owners.id = animals.owner_id
JOIN species ON species.id = animals.species_id
WHERE species.name = 'Digimon' AND owners.name = 'Jennifer Orwell'; 

SELECT animals.name as animal_name
FROM owners
JOIN animals ON owners.id = animals.owner_id
WHERE owners.name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT filtered name
FROM (
  SELECT owners.name as owner_name, COUNT(animals.id) as animals_owned 
  FROM owners
  JOIN animals ON owners.id = animals.owner_id
  GROUP BY owners.name
) AS filtered
WHERE filtered.animals_owned = 
  (
    SELECT MAX (filtered.animals_owned)
    FROM (
      SELECT owners.name as owner_name, COUNT(animals.id) as animals_owned 
      FROM owners
      JOIN animals ON owners.id = animals.owner_id
      GROUP BY owners.name
    ) AS filtered
);
