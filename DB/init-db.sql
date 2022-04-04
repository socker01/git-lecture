DROP DATABASE IF EXISTS gitlesson;

CREATE DATABASE gitlesson
     WITH
     OWNER = postgres
     ENCODING = 'UTF-8'
     LC_COLLATE = 'cs_CZ.UTF-8'
     LC_CTYPE = 'cs_CZ.UTF-8'
     TABLESPACE = pg_default
     CONNECTION LIMIT = -1
     TEMPLATE template0;

\c gitlesson;

CREATE TABLE IF NOT EXISTS UZIVATELE(
	ID BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	JMENO VARCHAR(255) NOT NULL,
	PRIJMENI VARCHAR(255) NOT NULL,
	VEK INTEGER
);

CREATE TABLE IF NOT EXISTS ADRESY(
	ID BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	ULICE VARCHAR(255) NOT NULL,
	MESTO VARCHAR(255) NOT NULL,
	PSC VARCHAR(255) NOT NULL,
	ID_UZIVATELE BIGINT NOT NULL,
	CONSTRAINT ADRESY_UZIVATELE_ID_fk FOREIGN KEY (ID_UZIVATELE) REFERENCES UZIVATELE
);

CREATE TABLE IF NOT EXISTS KNIHY(
	ID BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	NAZEV VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS VYPUJCKY(
	ID BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	ID_UZIVATELE BIGINT NOT NULL,
	ID_KNIHY BIGINT NOT NULL,
	CONSTRAINT VYPUJCKY_UZIVATELE_ID_fk FOREIGN KEY (ID_UZIVATELE) REFERENCES UZIVATELE,
	CONSTRAINT VYPUJCKY_KNIHY_ID_fk FOREIGN KEY (ID_KNIHY) REFERENCES KNIHY	
);

INSERT INTO UZIVATELE (JMENO, PRIJMENI, VEK) VALUES ('Jan', 'Makovec', 33);
INSERT INTO UZIVATELE (JMENO, PRIJMENI, VEK) VALUES ('Jana', 'Maková', 18);
INSERT INTO UZIVATELE (JMENO, PRIJMENI, VEK) VALUES ('Petr', 'Tvarohový', 23);
INSERT INTO UZIVATELE (JMENO, PRIJMENI, VEK) VALUES ('Romana', 'Tvarohová', 27);
INSERT INTO UZIVATELE (JMENO, PRIJMENI, VEK) VALUES ('Vladimír', 'Jahodový', 21);
INSERT INTO UZIVATELE (JMENO, PRIJMENI, VEK) VALUES ('Petra', 'Malinová', 45);
INSERT INTO UZIVATELE (JMENO, PRIJMENI, VEK) VALUES ('Marie', 'Pomerančová', 42);

INSERT INTO ADRESY (ULICE, MESTO, PSC, ID_UZIVATELE) VALUES ('Rozmarýnová 11', 'Ořechov', '623 12', 1);
INSERT INTO ADRESY (ULICE, MESTO, PSC, ID_UZIVATELE) VALUES ('Luďka Rohlíčka 48', 'Chlebov', '610 13', 2);
INSERT INTO ADRESY (ULICE, MESTO, PSC, ID_UZIVATELE) VALUES ('Hrachová 33', 'Tvarohov', '555 21', 3);
INSERT INTO ADRESY (ULICE, MESTO, PSC, ID_UZIVATELE) VALUES ('Nugátová 1', 'Jablůňkov', '231 72', 4);
INSERT INTO ADRESY (ULICE, MESTO, PSC, ID_UZIVATELE) VALUES ('Solničková 14', 'Cukrová Lhota', '111 34', 5);
INSERT INTO ADRESY (ULICE, MESTO, PSC, ID_UZIVATELE) VALUES ('Pepřová 198', 'Melounový ráj', '954 14', 6);
INSERT INTO ADRESY (ULICE, MESTO, PSC, ID_UZIVATELE) VALUES ('Povidlín 18', 'Povidlín', '432 27', 7);

INSERT INTO KNIHY (NAZEV) VALUES ('Vaříme s Jirkou Babicou');
INSERT INTO KNIHY (NAZEV) VALUES ('Čokoládové delikatesy');
INSERT INTO KNIHY (NAZEV) VALUES ('Česká kuchyně');
INSERT INTO KNIHY (NAZEV) VALUES ('Do Asie s Pepem Maliňákem');
INSERT INTO KNIHY (NAZEV) VALUES ('Pečeme ovocné dorty');
INSERT INTO KNIHY (NAZEV) VALUES ('Kulinárium');
INSERT INTO KNIHY (NAZEV) VALUES ('Babiččiny zavařeniny');

INSERT INTO VYPUJCKY (ID_UZIVATELE, ID_KNIHY) VALUES (2, 1);
INSERT INTO VYPUJCKY (ID_UZIVATELE, ID_KNIHY) VALUES (2, 3);
INSERT INTO VYPUJCKY (ID_UZIVATELE, ID_KNIHY) VALUES (4, 5);
INSERT INTO VYPUJCKY (ID_UZIVATELE, ID_KNIHY) VALUES (5, 4);