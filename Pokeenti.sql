DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS pokedex;
DROP TABLE IF EXISTS pokemon_pokemonsteam;

DROP TABLE IF EXISTS pokemons_team;
DROP TABLE IF EXISTS pokemons_team_stats;
DROP TABLE IF EXISTS stats;

DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS pokemon_types;
DROP TABLE IF EXISTS pc_pokemon_pc_stats;

DROP TABLE IF EXISTS pc_pokemon;
DROP TABLE IF EXISTS pc_stats;


CREATE TABLE pokemons(
	id_pokemon INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	pokemon CHAR NOT NULL
);
CREATE TABLE types(
    id_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(24) NOT NULL
);

CREATE TABLE pokemon_types(
	id_pokemon_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pokemon INT UNSIGNED NOT NULL,
    id_type INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_pokemon) REFERENCES pokemons(id_pokemon),
    FOREIGN KEY (id_type) REFERENCES types (id_type)
);

CREATE TABLE pokedex(
	id_pokedex INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	pokemon INT NOT NULL,
	n_list INT NOT NULL,
	`description` INT NOT NULL,
	seen BOOLEAN NOT NULL,
	own BOOLEAN NOT NULL,
	sprite VARCHAR(32) NOT NULL,
	next_evolution CHAR NULL,
	evolution_level INT NULL,
	FOREIGN KEY (pokemon) REFERENCES pokemons(pokemon),
);

CREATE TABLE pokemons_team(
    id_pokemon_team INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nickname VARCHAR(24) NULL,
    `status` CHAR NULL,
    sprite VARCHAR(32) NOT NULL
);

CREATE TABLE pokemon_pokemonsteam(
    id_pokemon_pokemonteam INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pokemon INT UNSIGNED NOT NULL,
    id_pokemonteam INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_pokemon) REFERENCES pokemons (id_pokemon),
    FOREIGN KEY (id_pokemonteam) REFERENCES pokemon_team (id_pokemon_team)
);


CREATE TABLE stats (
    id_stats INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hp INT NOT NULL,
    attack INT NOT NULL,
    special_attack INT NOT NULL,
    defense INT NOT NULL,
    special_defense INT NOT NULL,
    speed INT NOT NULL,
    `precision` INT NOT NULL,
    `level` INT NOT NULL,
    xp INT NOT NULL
);
	
CREATE TABLE pokemons_team_stats(
    id_pokemon_team_stat INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pokemon_team INT UNSIGNED NOT NULL,
    id_stat INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_pokemon_team) REFERENCES pokemons_team(id_pokemon_team),
	FOREIGN KEY (id_stat) REFERENCES stats (id_stats)
);
CREATE TABLE pc_pokemon(
	id_pc_pokemon INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pokemon CHAR NOT NULL,
	nickname VARCHAR(24) NULL,
    sprite VARCHAR(32) NOT NULL,
    n_pokedex_list INT NOT NULL,
    FOREIGN KEY (pokemon) REFERENCES pokedex (pokemons),
    FOREIGN KEY n_pokedex_list REFERENCES pokedex (n_list)

);
CREATE TABLE pc_stats(
	id_pc_stats INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hp INT NOT NULL,
    attack INT NOT NULL,
    special_attack INT NOT NULL,
    defense INT NOT NULL,
    special_defense INT NOT NULL,
    speed INT NOT NULL,
    `precision` INT NOT NULL,
    `level` INT NOT NULL,
    xp INT NOT NULL
);

CREATE TABLE pc_pokemon_pc_stats (
	id_pc_pokemon_pc_stats INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(24) NOT NULL
);