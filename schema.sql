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

ALTER TABLE animals ADD owner_id integer;
ALTER TABLE animals ADD FOREIGN KEY(owner_id) REFERENCES owners(id);

CREATE TABLE IF NOT EXISTS vets (
  id SERIAL PRIMARY KEY,
  name varchar(100),
  age INT,
  date_of_graduation DATE
);

CREATE TABLE IF NOT EXISTS specializations (
  species_id INT NOT NULL REFERENCES species(id) ON DELETE CASCADE,
  vets_id INT NOT NULL REFERENCES vets(id) ON DELETE CASCADE
);
