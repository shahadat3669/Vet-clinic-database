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