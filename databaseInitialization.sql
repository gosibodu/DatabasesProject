CREATE TABLE Player
(
	name varchar(20) primary key, 
	health integer check(health>=0),
	oxygen integer check(oxygen>=0),
	experience integer (experience>=0),
	xpos integer,
	ypos integer,
	zpos integer
);

CREATE TABLE Object
(
	objectID integer Primary Key,
	class integer check(0 <= class)  /* 0 = block, 1 = item  */ 
);

ALTER TABLE Object ADD check(class <= 1);

CREATE TABLE PlayerInventory
(
	playerName string REFERENCES Player,
	inventoryID integer,
	slot# integer check(slot#>=0),
	item integer REFERENCES Object(objectID) default(NULL)),
	quantity integer (quantity>=0),
	Primary Key (playerName,inventoryID,slot#)	
);

CREATE TABLE BlockInventory
(
	xpos integer,
	ypos integer,
	zpos integer,
	inventoryID integer,
	slot# integer check(slot#>=0),
	item integer,
	quantity integer check(quantity>=0),
	Primary Key (xpos, ypos, zpos, inventoryID, slot#)
);

CREATE TABLE Item
(
	objectID integer Primary Key REFERENCES Object.objectID,
	stackSize integer check(stackSize>=1),
	damage integer,
	name varchar(20)
);

CREATE TABLE Block
(
	objectID integer REFERENCES Object(objectID) Primary Key,
	stackSize integer check(stackSize>=1),
	damage integer check(damage>=0),
	flowrate integer,
	slows integer,
	falls boolean,
	name varchar(20)
);

CREATE TABLE BlockInstance
(
	xpos integer,
	ypos integer,
	zpos integer,
	objectID integer REFERENCES Object(objectID),
	Primary Key (objectID, xpos, ypos, zpos)
);


CREATE TABLE Effect
(
	objectID integer REFERENCES Object(objectID),
	effectType varchar(10),
	effectDuration integer check(effectDuration > 0),
	Primary Key (objectID, effectType, effectDuration)
);

Insert Into Object(objectID, class) values
	(0, 0),
	(1, 0),
	(2, 0),
	(3, 0),
	(4, 0),
	(5, 0),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 0);

Insert Into Block(objectID, stackSize, damage, flowrate, slows, falls, name) values
	(0, 64, 0, 0, NULL, FALSE, "Void"),
	(1, 64, 0, 0, NULL, FALSE, "Dirt"),
	(2, 64, 0, 0, NULL, TRUE, "Sand"),
	(3, 64, 0, 0, NULL, FALSE, "Stone"),
	(4, 64, 0, 1, NULL, FALSE, "Water"),
	(5, 64, 0, 0, NULL, FALSE, "Chest"),
	(16, 64, 0,0, NULL, FALSE, "Grass");
	
Insert Into Item(objectID, stackSize, damage, name) values
	(6, 1, 10, "Stone Sword"),
	(7, 1, 20, "Diamond Sword"),
	(8, 16, -20, "Health Potion"),
	(9, 1, 3, "Stone Pickaxe"),
	(10, 1, 3, "Diamond Pickaxe"),
	(11, 16, 0, "Egg"),
	(12, 1, 0, "Crafting Table"),
	(13, 64, 0, "Bone"),
	(14, 64, 0, "Coal"),
	(15, 64, 0, "Iron Ingot");

Insert Into Effect(objectID, effectType, effectDuration) values
	(6, NULL, NULL),
	(7, "Bleed", 5),
	(7, "Cripple", 5),	
	(8, "Heals", 1),
	(9, NULL, NULL),
	(10, "Mining5", 100),
	(11, NULL, NULL),
	(12, "Crafting", 100),
	(13, NULL, NULL),
	(14, NULL, NULL),
	(15, NULL, NULL);
