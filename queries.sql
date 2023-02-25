SELECT name FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31';

SELECT name FROM animals WHERE neutered IS TRUE AND escape_attempts<3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg>10.5;

SELECT name FROM animals WHERE neutered IS TRUE;

SELECT name FROM animals WHERE name NOT IN ('Gabumon');

SELECT name FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
    SET TRANSACTION READ WRITE;
    UPDATE animals SET species = 'unspecified';
    SELECT * FROM   animals;
	ROLLBACK;
END;

BEGIN;
	UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
	UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
    SELECT * FROM   animals;
	COMMIT;
END;

BEGIN;
	DELETE FROM animals;
	ROLLBACK;
    SELECT * FROM   animals;
END;

BEGIN;
	DELETE FROM animals WHERE date_of_birth > '01-01-2022';
	SAVEPOINT DELETED_AFTER_JAN_2022;
	UPDATE animals SET weight_kg = weight_kg * -1;
    SELECT * FROM   animals;
	ROLLBACK TO DELETED_AFTER_JAN_2022;
	UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
    SELECT * FROM   animals;
	COMMIT;
END;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;

SELECT * FROM animals LEFT JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond';

SELECT * FROM animals LEFT JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT * FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(*) FROM species INNER JOIN animals ON (animals.species_id = species.id) GROUP BY species.name;

SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Jennifer Orwell' AND animals.species_id = (SELECT id FROM species WHERE species.name LIKE 'Digimon');

SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;

SELECT owners.full_name, count (*) FROM animals INNER JOIN owners ON (animals.owner_id = owners.id) GROUP BY owners.full_name ORDER BY COUNT (*) DESC LIMIT 1;