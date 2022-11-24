-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passenger NOT NULL,
  seat TEXT NOT NULL,
  flight_info INTEGER REFERENCES flight_info  
);

CREATE TABLE passenger
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE cities_countries
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE airline_info
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE flight_info
(
 id SERIAL PRIMARY KEY,
 airline INTEGER REFERENCES airline_info,
 departure TIMESTAMP NOT NULL,
 arrival TIMESTAMP NOT NULL,
 from_city INTEGER REFERENCES cities_countries,
 to_city INTEGER REFERENCES cities_countries
);

INSERT INTO tickets
 (passenger_id, seat, flight_info)
VALUES
(1,'33B', 1),
(2, '8A', 2),
(3, '12F', 3),
(4, '20A', 4),
(5, '23D', 5),
(6, '18C', 6),
(7, '9E', 7),
(8, '1A', 8),
(9, '32B', 9),
(10, '10D', 10);

INSERT INTO passenger
 (first_name, last_name)
VALUES
 ('Jennifer', 'Finch'),
 ('Thadeus', 'Gathercoal'),
 ('Sonja', 'Pauley'),
 ('Jennifer', 'Finch'),
 ('Waneta', 'Skeleton'),
 ('Thadeus', 'Gathercoal'),
 ('Berkie', 'Wycliff'),
 ('Alvin', 'Leathes'),
 ('Berkie', 'Wycliff'),
 ('Cory', 'Squibbes');

INSERT INTO cities_countries
 (city, country)
VALUES
('Los Angeles', 'United States'),
('Washington DC', 'United States'),
('Seattle', 'United States'),
('Cedar Rapids', 'United States'),
('New York', 'United States'),
('Charlotte', 'United States'),
('Chicago', 'United States'),
('New Orleans', 'United States'),
('Las Vegas', 'United States'),
('Tokyo', 'Japan'),
('Paris', 'France'),
('Dubai', 'UAE'),
('Sao Paolo', 'Brazil'),
('London', 'United Kingdom'),
('Mexico City', 'Mexico'),
('Casablanca', 'Morocco'),
('Beijing', 'China'),
('Santiago', 'Chile');

INSERT INTO airline_info
 (airline_name)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO flight_info
(airline, departure, arrival, from_city, to_city)
VALUES
(1, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 2, 3),
(2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 10, 14),
(3, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 1, 9),
(3, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3,15),
(4, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 11, 16),
(5, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 12, 17),
(1, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 5, 6),
(6, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 4, 7),
(6, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 8),
(7, '2019-01-20 19:30:00', '2019-01-20 22:45:00',13, 18);



 
 
 
 
 
 
 