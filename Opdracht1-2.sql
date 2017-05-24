CREATE TABLE "adressen" (
	"id" int IDENTITY(1,1) PRIMARY KEY,
	"straat" text,
	"huisnummer" int,
	"postcode" text,
	"woonplaats" text
);

CREATE TABLE "klanten" (
	"klantnummer" int IDENTITY(1,1) PRIMARY KEY,
	"voornaam" text,
	"tussenvoegsel" text,
	"achternaam" text,
	"adres_id" int REFERENCES "adressen"("id")
);

CREATE TABLE "rekeningen" (
	"rekeningnummer" int IDENTITY(1,1) PRIMARY KEY,
	"tegoed" float,
	"eigenaar" int REFERENCES "klanten"("klantnummer"),
	"type" char,
	"datum_geopend" date
);

CREATE TABLE "automatische_transacties" (
	"id" int IDENTITY(1,1) PRIMARY KEY,
	"bedrag" float,
	"dag_van_maand" int,
	"beschrijving" text,
	"datum_aanmaken" date,
	"afschrijven_rekeningnummer" int REFERENCES "rekeningen"("rekeningnummer"),
	"overmaken_rekeningnummer" int
);

CREATE TABLE "transacties" (
	"id" int IDENTITY(1,1) PRIMARY KEY,
	"type" char,
	"bedrag" float,
	"beschrijving" text,
	"datum" date,
	"rekeningnummer" int REFERENCES "rekeningen"("rekeningnummer")
);

CREATE TABLE "leningen" (
	"id" int IDENTITY(1,1) PRIMARY KEY,
	"datum_contract" date,
	"datum_verval" date,
	"bedrag" float,
	"eigenaar" int REFERENCES "klanten"("klantnummer"),
	"betalingsinterval" text,
	"tegenrekening" int REFERENCES "rekeningen"("rekeningnummer")
);

CREATE TABLE "betaling_lening" (
	"id" int IDENTITY(1,1) PRIMARY KEY,
	"bedrag" int,
	"beschrijving" text,
	"datum" date,
	"id_lening" int REFERENCES "leningen"("id")
);
