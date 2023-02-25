INSERT INTO animals (
  id, name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);


INSERT INTO animals (
  id, name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8), 
  (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04), 
  (4, 'Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO animals (
  id, name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (5, 'Charmander','02-08-2020', 0, FALSE, -11.0 ),
  (6, 'Plantmon','09-15-2021', 2, TRUE, -5.7 ),
  (7, 'Squirtle','04-02-1993', 3, FALSE, -12.13 ),
  (8, 'Angemon','06-12-2005', 1, TRUE, -45.0 ),
  (9, 'Boarmon','06-07-2005', 7, TRUE, 20.4 ),
  (10, 'Blossom','10-13-1998', 3, TRUE, 17.0 ),
  (11, 'Ditto','05-14-2022', 4, TRUE, 22.0 );

INSERT INTO owners 
  VALUES (DEFAULT, 'Sam Smith', 34),
  (DEFAULT, 'Jennifer Orwell', 19),
  (DEFAULT, 'Bob', 45),
  (DEFAULT, 'Melody Pond', 77),
  (DEFAULT, 'Dean Winchester', 14),
  (DEFAULT, 'Jodie Whittaker', 38);

INSERT INTO species 
  VALUES (DEFAULT, 'Pokemon'),
  (DEFAULT, 'Digimon');

UPDATE animals 
  SET species_id = 2 WHERE 
    name LIKE '%mon';

UPDATE animals 
  SET species_id = 1 WHERE
     name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets VALUES 
  (DEFAULT, 'William Tatcher', 45, '04-23-2000'),
  (DEFAULT, 'Maisy Smith', 26, 'Jan-17-2019'),
  (DEFAULT, 'Stephanie Mendez', 64, 'May-04-1981'),
  (DEFAULT, 'Jack Harkness', 38, 'Jun-08-2008');

INSERT INTO specializations VALUES (
  (SELECT id FROM vets WHERE vets.name = 'William Tatcher'), 
  (SELECT id FROM species WHERE species.name = 'Pokemon')
), (
  (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), 
  (SELECT id FROM species WHERE species.name = 'Pokemon')
), (
  (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), 
  (SELECT id FROM species WHERE species.name = 'Digimon')
), (
  (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), 
  (SELECT id FROM species WHERE species.name = 'Digimon')
);
