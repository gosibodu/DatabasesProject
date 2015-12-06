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
	name varchar (20)
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
	(0, 0, "Void"),
	(1, 0, "Dirt"),
	(2, 0, "Sand"),
	(3, 0, "Stone"),
	(4, 0, "Water"),
	(5, 0, "Chest"),
	(6, 1, "Stone Sword"),
	(7, 1, "Diamond Sword"),
	(8, 1, "Health Potion"),
	(9, 1, "Stone Pickaxe"),
	(10, 1, "Diamond Pickaxe"),
	(11, 1, "Egg"),
	(12, 1, "Crafting Table"),
	(13, 1, "Bone"),
	(14, 1, "Coal"),
	(15, 1, "Iron Ingot"),
	(16, 0, "Lava");

Insert Into Block(objectID, stackSize, damage, flowrate, slows, falls, name) values
	(0, 64, 0, 0, NULL, FALSE),
	(1, 64, 0, 0, NULL, FALSE),
	(2, 64, 0, 0, NULL, TRUE),
	(3, 64, 0, 0, NULL, FALSE),
	(4, 64, 0, 5, NULL, FALSE),
	(5, 64, 0, 0, NULL, FALSE),
	(16, 64, 15, 1, NULL, FALSE);
	
Insert Into Item(objectID, stackSize, damage, name) values
	(6, 1, 10),
	(7, 1, 20),
	(8, 16, -20),
	(9, 1, 3),
	(10, 1, 3),
	(11, 16, 0),
	(12, 1, 0),
	(13, 64, 0),
	(14, 64, 0),
	(15, 64, 0);

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
