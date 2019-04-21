USE sakila;

-- 1a.
SELECT first_name, last_name
	FROM actor;

-- 1b.
SELECT UPPER(CONCAT(first_name," ",last_name))
	AS "Actor Name"
	FROM actor;

-- 2a.
SELECT actor_id, first_name, last_name
	FROM actor
	WHERE first_name = "Joe";

-- 2b.
SELECT *
	FROM actor
	WHERE last_name LIKE '%gen%';

-- 2c.
SELECT *
	FROM actor
	WHERE last_name LIKE '%li%'
	ORDER BY last_name, first_name;

-- 2d.
SELECT country_id, country
	FROM country
	WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- 3a.
ALTER TABLE actor
	ADD description BLOB NOT NULL;

DESCRIBE actor;

-- 3b. 
ALTER TABLE actor
	DROP COLUMN description;

DESCRIBE actor;

-- 4a.
SELECT COUNT(actor_id), last_name
	FROM actor
	GROUP BY last_name;

-- 4b.
SELECT last_name, COUNT(*)
	FROM actor
	GROUP BY last_name	
	HAVING COUNT(*) >= 2;

-- 4c.

UPDATE actor
	SET first_name = 'HARPO'
	WHERE first_name = 'GROUCHO'
	AND last_name = 'WILLIAMS';

-- 4d.
UPDATE actor
	SET first_name = 'GROUCHO'
	WHERE first_name = 'HARPO'
	AND last_name = 'WILLIAMS';

-- 5a. 
SHOW CREATE TABLE address;

CREATE TABLE `address` (
  `address_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `district` varchar(20) NOT NULL,
  `city_id` smallint(5) unsigned NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `location` geometry NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `idx_fk_city_id` (`city_id`),
  SPATIAL KEY `idx_location` (`location`),
  CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8

