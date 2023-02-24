CREATE DATABASE vet_clinic;

CREATE TABLE IF NOT EXISTS animals (
  id SERIAL PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

ALTER TABLE animals ADD species TEXT;

CREATE TABLE IF NOT EXISTS owners(
	id SERIAL PRIMARY KEY,
	full_name TEXT,
	age INT
);

CREATE TABLE IF NOT EXISTS species(
	id SERIAL PRIMARY KEY,
	name TEXT
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id integer;
ALTER TABLE animals ADD FOREIGN KEY(species_id) REFERENCES species(id);