BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "portal_nomecondominio" (
	"id"	integer NOT NULL,
	"nome"	varchar(300) NOT NULL,
	"endereco"	varchar(300),
	"cidade"	varchar(100),
	"UF"	varchar(2),
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "portal_nomecondominio" ("id","nome","endereco","cidade","UF") VALUES (1,'San Marco II - Ilha Modena','Estr. da Limeirinha','Bonfim Paulista','SP'),
 (2,'Valencia - Ilha Túria','Rua Gil Parisi, 70','Bonfim Paulista','SP'),
 (3,'San Marco II - Siena','Estr. da Limeirinha','Bonfim Paulista','SP'),
 (4,'San Marco II - Romitê','Estr. da Limeirinha','Bonfim Paulista','SP'),
 (5,'San Marco II - Genova','Estr. da Limeirinha','Bonfim Paulista','SP'),
 (6,'Odila Mestriner','Rua Garibaldi','Ribeirão Preto','SP'),
 (7,'Buona Vita Ribeirão','Av. Oscar Niemeyer, 104 ','Bonfim Paulista','SP'),
 (8,'Quinta dos Ventos','Av. Oscar Niemeyer, 995','Bonfim Paulista','SP'),
 (9,'Residencial Terras de Florença','Av. Luiz Eduardo Toledo Prado, 4300','Bonfim Paulista','SP'),
 (10,'Condomínio  Residencial Laranjeiras','R. Flávio Canesin, 777 - Recreio das Acacias','Ribeirão Preto','SP');
COMMIT;
