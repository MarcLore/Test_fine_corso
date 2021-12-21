/*CREAZIONE DATABASE*/
CREATE DATABASE gestione_biblioteca
	WITH
	OWNER = postgres
	ENCODING = 'UTF8'
	CONNECTION LIMIT = -1;

/*MENU----------------------------------------------------------------------------------------------------------------*/

SELECT "idM", nome, prezzo
	FROM public."Menù";

/*Creazione tabella Menù*/
CREATE TABLE public."Menù"
(
    "idM" integer,
    nome text,
    prezzo double precision,
    CONSTRAINT "Pk_Menù" PRIMARY KEY ("idM")
);

/*ID autonumerato UTENTE*/
ALTER TABLE IF EXISTS public."Menù" 
ALTER COLUMN "idM" ADD GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 );

/*INSERT MENU*/
INSERT INTO public."Menù"(
	nome, prezzo)
	VALUES ('Margherita', 5);
INSERT INTO public."Menù"(
	nome, prezzo)
	VALUES ('Boscaiola', 6.5);
INSERT INTO public."Menù"(
	nome, prezzo)
	VALUES ('Bufala', 6);
INSERT INTO public."Menù"(
	nome, prezzo)
	VALUES ('Calzone', 5.5);
INSERT INTO public."Menù"(
	nome, prezzo)
	VALUES ('Diavola', 5.5);
INSERT INTO public."Menù"(
	nome, prezzo)
	VALUES ('Funghi', 6);
INSERT INTO public."Menù"(
	nome, prezzo)
	VALUES ('Napoli', 6);
INSERT INTO public."Menù"(
	nome, prezzo)
	VALUES ('Ortolana', 5.5);
	
/*TAVOLO--------------------------------------------------------------------------------------------------------------*/

SELECT "idT", totale_posti
	FROM public."Tavolo";

/*Creazione tabella Tavolo*/
CREATE TABLE public."Tavolo"
(
    "idT" integer,
    totale_posti integer,
    CONSTRAINT "Pk_Tavolo" PRIMARY KEY ("idT")
);

/*ID autonumerato Tavolo*/
ALTER TABLE IF EXISTS public."Tavolo" 
ALTER COLUMN "idT" ADD GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 );

/*INSERT MENU*/
INSERT INTO public."Tavolo"(
	totale_posti)
	VALUES (2);
INSERT INTO public."Tavolo"(
	totale_posti)
	VALUES (4);
INSERT INTO public."Tavolo"(
	totale_posti)
	VALUES (4);
INSERT INTO public."Tavolo"(
	totale_posti)
	VALUES (2);
INSERT INTO public."Tavolo"(
	totale_posti)
	VALUES (6);

/*ORDINI--------------------------------------------------------------------------------------------------------------*/

SELECT "idO", "xidM", "xidT", data
	FROM public."Ordini";

/*Creazione tabella ORDINI*/
CREATE TABLE public."Ordini"
(
    "idO" integer,
    "xidM" integer,
    "xidT" integer,
	data timestamp without time zone, 
    CONSTRAINT "Pk_Ordini" PRIMARY KEY ("idO")
);

/*ID autonumerato ORDINI*/
ALTER TABLE IF EXISTS public."Ordini" 
ALTER COLUMN "idO" ADD GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 );

/*Creazione chiava esterna1 ORDINI verso MENU*/
ALTER TABLE IF EXISTS public."Ordini" 
ADD CONSTRAINT menù_fk 
FOREIGN KEY ("xidM") 
REFERENCES public."Menù" ("idM") MATCH SIMPLE

/*Creazione chiava esterna2 ORDINI verso TAVOLO*/
ALTER TABLE IF EXISTS public."Ordini" 
ADD CONSTRAINT tavolo_fk 
FOREIGN KEY ("xidT") 
REFERENCES public."Tavolo" ("idT") MATCH SIMPLE;

/*INSERT MENU*/
INSERT INTO public."Ordini"(
	"xidM", "xidT", data)
	VALUES (1, 1, '2021-12-01 20:05:00');
INSERT INTO public."Ordini"(
	"xidM", "xidT", data)
	VALUES (2, 3, '2021-12-01 21:06:40');
INSERT INTO public."Ordini"(
	"xidM", "xidT", data)
	VALUES (5, 3, '2021-12-02 19:56:10');
INSERT INTO public."Ordini"(
	"xidM", "xidT", data)
	VALUES (9, 4, '2021-12-02 20:36:44');
INSERT INTO public."Ordini"(
	"xidM", "xidT", data)
	VALUES (3, 5, '2021-12-02 20:59:59');
INSERT INTO public."Ordini"(
	"xidM", "xidT", data)
	VALUES (1, 4, '2021-12-03 21:43:12');
INSERT INTO public."Ordini"(
	"xidM", "xidT", data)
	VALUES (7, 2, '2021-12-04 20:23:18');
INSERT INTO public."Ordini"(
	"xidM", "xidT", data)
	VALUES (6, 2, '2021-12-06 20:38:15');
INSERT INTO public."Ordini"(
	"xidM", "xidT", data)
	VALUES (3, 1, '2021-12-06 21:15:16');
INSERT INTO public."Ordini"(
	"xidM", "xidT", data)
	VALUES (7, 3, '2021-12-06 21:10:59');
INSERT INTO public."Ordini"(
	"xidM", "xidT", data)
	VALUES (9, 4, '2021-12-07 21:59:59');