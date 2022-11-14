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
	is_trans boolean NOT NULL
);

CREATE TABLE parts (
	part_num varchar(50) PRIMARY KEY,
	name varchar(256) UNIQUE NOT NULL,
	part_cat_id integer NOT NULL,
	FOREIGN KEY (part_cat_id) REFERENCES part_categories (id)
);

CREATE TABLE sets (
	set_num varchar(50) PRIMARY KEY,
	name varchar(256) NOT NULL,
	year integer NOT NULL,
	theme_id integer NOT NULL,
	num_parts integer NOT NULL,
	FOREIGN KEY (theme_id) REFERENCES themes (id)
);

CREATE TABLE inventories (
	id integer PRIMARY KEY,
	version integer NOT NULL,
	set_num varchar(50) NOT NULL,
	FOREIGN KEY (set_num) REFERENCES sets (set_num)
);

CREATE TABLE inventory_sets (
	inventory_id integer NOT NULL,
	set_num varchar(50) NOT NULL,
	quantity integer NOT NULL,
	PRIMARY KEY (inventory_id, set_num),
	FOREIGN KEY (inventory_id) REFERENCES inventories (id),
	FOREIGN KEY (set_num) REFERENCES sets (set_num)	
);

CREATE TABLE inventory_parts (
	inventory_id integer NOT NULL,
	part_num varchar(50) NOT NULL,
	color_id integer NOT NULL,
	quantity integer NOT NULL,
	is_spare boolean NOT NULL,
	PRIMARY KEY (inventory_id, part_num, color_id, quantity, is_spare),
	FOREIGN KEY (inventory_id) REFERENCES inventories (id),
	FOREIGN KEY (part_num) REFERENCES parts (part_num),
	FOREIGN KEY (color_id) REFERENCES colors (id)
);