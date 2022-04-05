/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND  escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name NOT IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT name FROM animals WHERE neutered = TRUE;
SELECT name FROM animals WHERE name NOT IN ('Gabumon');
SELECT name FROM animals WHERE weight_kg >= 10.5 AND weight_kg <= 17.3; ;
