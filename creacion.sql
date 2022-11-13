CREATE TABLE part_categories (
	id integer PRIMARY KEY,
	name varchar(100) UNIQUE NOT NULL
);

CREATE TABLE themes (
	id integer PRIMARY KEY,
	name varchar(100) UNIQUE NOT NULL,
	parent_id integer,
	FOREIGN KEY (parent_id) REFERENCES themes (id)
);


CREATE TABLE colors (
	id integer PRIMARY KEY,
	name varchar(100) UNIQUE NOT NULL,
	rgb varchar(6) UNIQUE NOT NULL,
	is_trans BOOLEAN NOT NULL
);

CREATE TABLE parts (
	part_num varchar(50) PRIMARY KEY,
	name varchar(256) UNIQUE NOT NULL,
	part_cat_id integer NOT NULL,
	FOREIGN KEY (part_cat_id) REFERENCES part_categories (id)
);

