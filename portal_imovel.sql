BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "portal_imovel" (
	"id"	integer NOT NULL,
	"idade"	integer NOT NULL,
	"bairro"	varchar(100) NOT NULL,
	"cidade"	varchar(200) NOT NULL,
	"aconstruida"	decimal NOT NULL,
	"atotal"	decimal NOT NULL,
	"dtaCadastro"	date,
	"status"	varchar(1) NOT NULL,
	"corretor_id"	bigint NOT NULL,
	"estadoconser_id"	bigint NOT NULL,
	"nomecondominio_id"	bigint,
	"padrao_id"	bigint NOT NULL,
	"tipo_id"	bigint NOT NULL,
	"vidautil_id"	bigint NOT NULL,
	"valorDeVenda"	decimal NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("padrao_id") REFERENCES "portal_padrao"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("vidautil_id") REFERENCES "portal_vidautil"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("tipo_id") REFERENCES "portal_tipo"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("corretor_id") REFERENCES "portal_corretor"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("estadoconser_id") REFERENCES "portal_estadoconser"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("nomecondominio_id") REFERENCES "portal_nomecondominio"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "portal_imovel" ("id","idade","bairro","cidade","aconstruida","atotal","dtaCadastro","status","corretor_id","estadoconser_id","nomecondominio_id","padrao_id","tipo_id","vidautil_id","valorDeVenda") VALUES (1,1,'San Marco','Bonfim Paulista',145,250,'2021-08-15','1',1,1,1,2,2,4,990000),
 (2,1,'San Marco','Bonfim',140,250,'2021-08-30','1',1,1,3,2,2,4,850000),
 (3,1,'Valência','Bonfim Paulista',170,320,'2021-09-10','1',1,1,2,2,2,4,1200000),
 (15,1,'Agra Ribeirão','Ribeirão Preto',169,253,'2021-10-02','1',1,1,7,2,2,4,980000),
 (16,15,'Higienópolis','Ribeirão Preto',149,160,'2021-05-10','1',1,2,6,3,1,5,495000),
 (20,1,'Terras de Florença','Ribeirão Preto',170,335,'2021-09-10','1',1,1,8,2,2,4,1150000),
 (22,1,'San Marco','Ribeirão Preto',152,304,'2021-08-10','1',1,1,14,2,2,4,900000),
 (23,18,'Jardim Macedo','Ribeirão Preto',93,104,'2021-10-07','1',1,3,12,4,1,5,350000),
 (24,1,'Santa Cruz José Jacques','Ribeirão Preto',110,130,'2021-08-08','1',1,2,15,3,1,5,475000),
 (25,18,'Higienópolis','Ribeirão Preto',201,210,'2021-11-14','1',1,2,16,3,1,5,550000);
CREATE UNIQUE INDEX IF NOT EXISTS "portal_imovel_padrao_id_tipo_id_nomecondominio_id_estadoconser_id_corretor_id_vidautil_id_c04b32bd_uniq" ON "portal_imovel" (
	"padrao_id",
	"tipo_id",
	"nomecondominio_id",
	"estadoconser_id",
	"corretor_id",
	"vidautil_id"
);
CREATE INDEX IF NOT EXISTS "portal_imovel_corretor_id_0daa5377" ON "portal_imovel" (
	"corretor_id"
);
CREATE INDEX IF NOT EXISTS "portal_imovel_estadoconser_id_985492b2" ON "portal_imovel" (
	"estadoconser_id"
);
CREATE INDEX IF NOT EXISTS "portal_imovel_nomecondominio_id_a9fab628" ON "portal_imovel" (
	"nomecondominio_id"
);
CREATE INDEX IF NOT EXISTS "portal_imovel_padrao_id_7687fafe" ON "portal_imovel" (
	"padrao_id"
);
CREATE INDEX IF NOT EXISTS "portal_imovel_tipo_id_5c8d8cb7" ON "portal_imovel" (
	"tipo_id"
);
CREATE INDEX IF NOT EXISTS "portal_imovel_vidautil_id_9b749ff7" ON "portal_imovel" (
	"vidautil_id"
);
COMMIT;
