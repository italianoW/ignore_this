create table if not exists galaxy(
galaxy_id serial primary key,
name  varchar(30) unique not null,
size int not null,
description text,
is_collapsed boolean
);

create table if not exists star(
star_id serial primary key,
name varchar(30) unique not null,
size int not null,
radius numeric(10,1),
description text,
is_cool boolean,
galaxy_id int references galaxy(galaxy_id)
);

create table if not exists planet(
planet_id serial primary key,
name varchar(30) unique not null,
size int not null,
radius numeric(10,1),
description text,
has_life boolean,
star_id int references star(star_id)
);
create table if not exists moon(
moon_id serial primary key,
name varchar(30) unique not null,
size int not null,
radius numeric(10,1),
description text,
orbits_around_planet boolean,
planet_id int references planet(planet_id)
);
create table if not exists other_celestial_body(
other_celestial_body_id serial primary key,
name varchar(30) unique not null,
size int not null,
radius numeric(10,1),
description text,
galaxy_id int references galaxy(galaxy_id)
);

INSERT INTO galaxy (name, size, description, is_cool) VALUES
('Andromeda', 1000, 'Nearest spiral galaxy', true),
('Milky Way', 900, 'Our home galaxy', true),
('Triangulum', 700, 'Small spiral galaxy', false),
('Whirlpool', 850, 'Interacting spiral galaxy', true),
('Sombrero', 600, 'Bright nucleus galaxy', true),
('Messier81', 750, 'Grand design spiral', false),
('Messier82', 500, 'Starburst galaxy', true),
('CentaurusA', 880, 'Radio galaxy', false),
('Pinwheel', 820, 'Face-on spiral galaxy', true),
('Cartwheel', 950, 'Ring galaxy', true),
('Tadpole', 670, 'Distorted galaxy', false),
('BlackEye', 610, 'Dust-heavy galaxy', false),
('Sunflower', 790, 'Flocculent spiral', true),
('Cigar', 560, 'Starburst activity', true),
('LeoI', 400, 'Dwarf galaxy', false),
('LeoII', 420, 'Small satellite galaxy', false),
('Sagittarius', 380, 'Elliptical dwarf', false),
('CanisMajor', 360, 'Closest galaxy', true),
('Fornax', 450, 'Dwarf spheroidal', false),
('Sculptor', 470, 'Satellite galaxy', false);

INSERT INTO star (name, size, radius, description, is_cool, galaxy_id) VALUES
('Sol', 100, 695700.0, 'Yellow dwarf', true, 2),
('AlphaCentauri', 110, 834840.0, 'Triple star system', true, 2),
('Betelgeuse', 900, 617100000.0, 'Red supergiant', true, 1),
('Sirius', 120, 1189640.0, 'Brightest star', true, 2),
('Vega', 140, 2376000.0, 'Blue-white star', false, 3),
('Rigel', 880, 78900000.0, 'Blue supergiant', true, 4),
('Polaris', 600, 44400000.0, 'North star', true, 5),
('Deneb', 860, 203000000.0, 'Luminous star', false, 6),
('Procyon', 130, 2030000.0, 'Binary system', false, 7),
('Altair', 150, 1560000.0, 'Fast rotating star', true, 8),
('Aldebaran', 500, 44300000.0, 'Red giant', false, 9),
('Antares', 920, 680000000.0, 'Supergiant star', true, 10),
('Spica', 300, 7800000.0, 'Binary star', false, 11),
('Castor', 200, 1500000.0, 'Multiple star system', false, 12),
('Pollux', 350, 6200000.0, 'Orange giant', true, 13),
('Regulus', 400, 3700000.0, 'Bright star', true, 14),
('Bellatrix', 480, 5900000.0, 'Blue giant', false, 15),
('Arcturus', 430, 25000000.0, 'Red giant', true, 16),
('Capella', 520, 12000000.0, 'Binary giant stars', true, 17),
('Fomalhaut', 330, 1400000.0, 'Young star', false, 18);

INSERT INTO planet (name, size, radius, description, has_life, star_id) VALUES
('MercuryX', 10, 2440.0, 'Rocky planet', false, 1),
('VenusX', 20, 6052.0, 'Thick atmosphere', false, 1),
('EarthX', 30, 6371.0, 'Habitable planet', true, 1),
('MarsX', 15, 3390.0, 'Red planet', false, 1),
('Kepler22b', 60, 12000.0, 'Super-Earth', false, 2),
('Gliese581g', 50, 11000.0, 'Potentially habitable', true, 3),
('HD209458b', 90, 100000.0, 'Hot Jupiter', false, 4),
('WASP12b', 95, 140000.0, 'Gas giant', false, 5),
('TRAPPIST1e', 25, 5800.0, 'Rocky exoplanet', true, 6),
('TRAPPIST1f', 28, 6000.0, 'Cold planet', false, 6),
('TRAPPIST1g', 32, 6200.0, 'Large rocky planet', false, 6),
('Kepler186f', 27, 6100.0, 'Earth-sized', true, 7),
('ProximaB', 26, 6000.0, 'Nearest exoplanet', true, 8),
('LHS1140b', 40, 7400.0, 'Dense planet', false, 9),
('Ross128b', 29, 6200.0, 'Temperate planet', true, 10),
('GJ667Cc', 33, 6900.0, 'Super-Earth', false, 11),
('HD40307g', 45, 8200.0, 'Potential ocean world', false, 12),
('55CancriE', 38, 7600.0, 'Carbon-rich planet', false, 13),
('TauCetiE', 31, 6500.0, 'Candidate habitable', true, 14),
('K218b', 42, 9000.0, 'Water-rich planet', false, 15);

INSERT INTO moon (name, size, radius, description, orbits_around_planet, planet_id) VALUES
('LunaX', 5, 1737.0, 'Earth-like moon', true, 3),
('PhobosX', 1, 11.0, 'Small moon', true, 4),
('DeimosX', 1, 6.0, 'Tiny moon', true, 4),
('EuropaX', 4, 1560.0, 'Icy moon', true, 7),
('GanymedeX', 6, 2634.0, 'Largest moon', true, 7),
('CallistoX', 5, 2410.0, 'Heavily cratered', true, 7),
('IoX', 4, 1821.0, 'Volcanic moon', true, 7),
('TitanX', 6, 2575.0, 'Dense atmosphere', true, 8),
('EnceladusX', 3, 252.0, 'Ice geysers', true, 8),
('MimasX', 2, 198.0, 'Cratered moon', true, 8),
('TritonX', 5, 1353.0, 'Retrograde orbit', true, 9),
('CharonX', 3, 606.0, 'Binary-like moon', true, 10),
('OberonX', 4, 761.0, 'Outer moon', true, 11),
('TitaniaX', 4, 789.0, 'Largest Uranian moon', true, 11),
('ArielX', 3, 578.0, 'Bright surface', true, 11),
('UmbrielX', 3, 585.0, 'Dark moon', true, 11),
('MirandaX', 2, 235.0, 'Extreme cliffs', true, 11),
('NixX', 1, 25.0, 'Small irregular moon', true, 12),
('HydraX', 1, 30.0, 'Distant moon', true, 12),
('KerberosX', 1, 19.0, 'Tiny moon', true, 12);

INSERT INTO other_celestial_body (name, size, radius, description, galaxy_id) VALUES
('Halley', 2, 11.0, 'Famous comet', 2),
('Oumuamua', 1, 0.2, 'Interstellar object', 1),
('CeresX', 5, 473.0, 'Dwarf planet', 2),
('VestaX', 4, 262.0, 'Asteroid belt object', 2),
('PallasX', 4, 256.0, 'Large asteroid', 3),
('HygieaX', 4, 215.0, 'Dark asteroid', 4),
('ErosX', 3, 8.4, 'Near-Earth asteroid', 5),
('BennuX', 2, 0.25, 'Sample return target', 6),
('ItokawaX', 2, 0.16, 'Rubble-pile asteroid', 7),
('RyuguX', 2, 0.43, 'Carbonaceous asteroid', 8),
('MakemakeX', 6, 715.0, 'Dwarf planet', 9),
('HaumeaX', 6, 780.0, 'Fast rotating dwarf', 10),
('ErisX', 7, 1163.0, 'Massive dwarf planet', 11),
('SednaX', 6, 995.0, 'Distant object', 12),
('OrcusX', 5, 917.0, 'Pluto-like object', 13),
('QuaoarX', 5, 555.0, 'Kuiper belt object', 14),
('VarunaX', 4, 668.0, 'Trans-Neptunian object', 15),
('IxionX', 4, 617.0, 'Plutino object', 16),
('ChaosX', 3, 160.0, 'Scattered disk object', 17),
('ArrokothX', 2, 18.0, 'Contact binary', 18);

