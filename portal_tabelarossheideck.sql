BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "portal_tabelarossheideck" (
	"id"	INTEGER,
	"idade_em_vida"	INTEGER,
	"a"	Decimal,
	"b"	Decimal,
	"c"	Decimal,
	"d"	Decimal,
	"e"	Decimal,
	"f"	Decimal,
	"g"	Decimal,
	"h"	Decimal,
	PRIMARY KEY("id")
);
INSERT INTO "portal_tabelarossheideck" ("id","idade_em_vida","a","b","c","d","e","f","g","h") VALUES (1,2,1.02,1.05,'3.51',9.03,18.9,39.3,53.1,75.4),
 (2,4,2.08,2.11,'4.55',10.0,19.8,34.6,53.6,75.7),
 (3,6,3.18,3.21,'5.62',11.0,20.7,35.3,54.1,76.0),
 (4,8,4.32,4.35,'6.73',12.1,21.6,36.1,54.6,76.3),
 (5,10,5.5,5.53,'7.88',13.2,22.6,36.9,55.2,76.6),
 (6,12,6.72,6.75,'9.07',14.3,23.6,37.7,55.8,76.9),
 (7,14,7.98,8.01,'10.3',15.4,24.6,38.5,56.4,77.2),
 (8,16,9.28,9.31,'11.6',16.6,25.7,39.4,57.0,77.5),
 (9,18,10.6,10.6,'12.9',17.8,26.8,40.3,57.6,77.8),
 (10,20,12.0,12.0,'14.2',19.1,27.9,41.8,58.3,78.2),
 (11,22,13.4,13.4,'15.6',20.4,29.1,42.2,59.0,78.5),
 (12,24,14.9,14.9,'17,00',21.8,30.3,43.1,59.6,78.9),
 (13,26,16.4,16.4,'18.5',23.1,31.5,44.1,60.4,79.3),
 (14,28,17.9,17.9,'20.00',24.6,32.8,45.2,61.1,79.6),
 (15,30,19.5,19.5,'21.5',26.0,34.1,46.2,61.8,80.0),
 (16,32,21.1,21.1,'23.1',27.5,35.4,47.3,62.6,80.4),
 (17,34,22.8,22.8,'24.7',29.0,36.8,48.4,63.4,80.8),
 (18,36,24.5,24.5,'26.4',30.5,38.1,49.5,64.2,81.3),
 (19,38,26.2,26.2,'28.1',32.2,39.6,50.7,65.0,81.7),
 (20,40,28.8,28.8,'29.9',33.8,41.0,51.9,65.9,82.1),
 (21,42,29.9,29.8,'31.6',35.5,42.5,53.1,66.7,82.6),
 (22,44,31.7,31.7,'33.4',37.2,44.0,54.4,67.6,83.1),
 (23,46,33.6,33.6,'35.2',38.9,45.6,55.6,68.5,83.5),
 (24,48,35.6,35.5,'37.1',40.7,47.2,56.9,69.4,84.0),
 (25,50,37.5,37.5,'39.1',42.6,48.8,58.2,70.4,84.5),
 (26,52,39.5,39.5,'41.9',44.0,50.5,59.6,71.3,'85,00'),
 (27,54,41.6,41.6,'43.00',46.3,52.1,61.0,72.3,85.5),
 (28,56,43.7,43.7,'45.1',48.2,53.9,62.4,73.3,86.0),
 (29,58,45.8,45.8,'47.2',50.2,55.6,63.8,74.3,86.6),
 (30,60,48.8,48.8,'49.3',52.2,57.4,65.3,75.3,87.1),
 (31,62,50.2,50.2,'51.5',54.2,59.2,66.7,75.4,87.7),
 (32,64,52.5,52.5,'53.7',56.3,61.1,68.3,77.5,88.2),
 (33,66,54.8,54.8,'55.9',58.4,69.0,69.8,78.6,88.8),
 (34,68,57.1,57.1,'58.2',60.6,64.9,71.4,79.7,89.4),
 (35,70,59.5,59.5,'60.5',62.8,66.8,72.9,80.8,90.4),
 (36,72,62.2,62.2,'62.9','65,00',68.8,74.6,81.9,90.9),
 (37,74,64.4,64.4,'65.3',67.3,70.8,76.2,83.1,91.2),
 (38,76,66.9,66.9,'67.7',69.6,72.9,77.9,84.3,91.8),
 (39,78,69.4,69.4,'72.2',71.9,74.9,89.6,85.5,92.4),
 (40,80,'72,00',72.0,'72.7',74.3,77.1,81.3,86.7,93.1),
 (41,82,74.6,74.6,'75.3',76.7,79.2,83.0,88.0,93.7),
 (42,84,77.3,77.3,'77.8',79.1,81.4,84.5,89.2,94.4),
 (43,86,80.0,80.0,'80.5',81.6,83.6,86.6,90.5,95.0),
 (44,88,82.7,82.7,'83.2',84.1,85.8,88.5,91.8,95.7),
 (45,90,85.5,85.5,'85.9',86.7,88.1,90.3,93.1,96.4),
 (46,92,88.3,88.3,'88.6',89.3,90.4,92.2,94.5,97.1),
 (47,94,91.2,91.2,'91.4',91.9,92.8,94.1,95.8,97.8),
 (48,96,94.1,94.1,'94.2',94.6,95.1,96.0,97.2,98.5),
 (49,98,97.0,97.0,'97.1',97.3,97.6,98.0,98.0,99.8),
 (50,100,100.0,100.0,'100.00',100.0,100.0,100.0,100.0,100.0);
COMMIT;