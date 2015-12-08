CREATE TABLE IF NOT EXISTS Player
(
	name 			varchar(20)		PRIMARY KEY, 
	health 			integer 		CHECK(health>=0),
	oxygen 			integer 		CHECK(oxygen>=0),
	experience 		integer 		CHECK(experience>=0),
	xpos 			integer,
	ypos 			integer,
	zpos 			integer
);

CREATE TABLE IF NOT EXISTS Object
(
	objectID 		integer 		 NOT NULL AUTO_INCREMENT,
	objectClass		integer 		NOT NULL CHECK(0 <= objectClass),  # 0 = block, 1 = item   
	name 			varchar(20),
	PRIMARY KEY (objectID)
);

ALTER TABLE Object ADD CHECK(objectClass <= 1);
ALTER TABLE Object AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS BlockInstance
(
	xpos 			integer,
	ypos 			integer,
	zpos 			integer,
	objectID 		integer 		REFERENCES Object(objectID),
	PRIMARY KEY (xpos, ypos, zpos)
);

CREATE TABLE IF NOT EXISTS PlayerInventory
(
	playerName 		varchar(20)		REFERENCES Player.name,
	inventoryID		integer    DEFAULT 0,
	slotNum 		integer 		UNIQUE CHECK(slotNum>=0),
	item 			integer 		DEFAULT NULL REFERENCES Object(objectID),
	quantity 		integer 		CHECK(quantity>=0),
	PRIMARY KEY (playerName,inventoryID,slotNum)
);

CREATE TABLE IF NOT EXISTS BlockInventory
(
	xpos 			integer      REFERENCES BlockInstance.xpos,
	ypos 			integer      REFERENCES BlockInstance.ypos,
	zpos 			integer      REFERENCES BlockInstance.zpos,
	inventoryID 	integer  DEFAULT 0, 
	slotNum 		integer 		UNIQUE CHECK(slotNum>=0),
	item 			integer      DEFAULT NULL REFERENCES Object(objectID),
	quantity 		integer 		CHECK(quantity>=0),
	PRIMARY KEY (xpos, ypos, zpos, inventoryID, slotNum)
);

CREATE TABLE IF NOT EXISTS Item
(
	objectID 		integer 		PRIMARY KEY REFERENCES Object.objectID,
	stackSize 		integer 		CHECK(stackSize>=1),
	damage 			integer
);

CREATE TABLE IF NOT EXISTS Block
(
	objectID 		integer 		PRIMARY KEY REFERENCES Object.objectID,
	stackSize 		integer 		CHECK(stackSize>=1),
	damage 			integer 		CHECK(damage>=0),
	flowrate 		integer,
	slows 			integer,
	falls 			boolean,
	hasInventory boolean  Default false
);

CREATE TABLE IF NOT EXISTS Effect
(
	objectID 		integer 		REFERENCES Item.ObjectID,
	effectType 		varchar(10),
	effectDuration 	integer 		CHECK(effectDuration > 0),
	PRIMARY KEY (objectID, effectType, effectDuration)
);

Insert Into Object(objectID, objectClass, name) VALUES
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

Insert Into Block(objectID, stackSize, damage, flowrate, slows, falls, hasInventory) VALUES
	(0, 64, 0, 0, NULL, FALSE, FALSE),
	(1, 64, 0, 0, NULL, FALSE, FALSE),
	(2, 64, 0, 0, NULL, TRUE, FALSE),
	(3, 64, 0, 0, NULL, FALSE, FALSE),
	(4, 64, 15, 5, NULL, FALSE, FALSE),
	(5, 64, 0, 0, NULL, FALSE, TRUE),
	(16, 64, 8, 1, NULL, FALSE, FALSE);
	
Insert Into Item(objectID, stackSize, damage) VALUES
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

Insert Into Effect(objectID, effectType, effectDuration) VALUES
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

Insert Into Player(name, health, oxygen, experience, xpos, ypos, zpos) VALUES
	("Steve", 100, 100, 0, 2, 2, 1);
  
Insert Into PlayerInventory(playerName, inventoryID, slotNum, item, quantity) VALUES
	("Steve", 0, 0, 7, 1),
	("Steve", 0, 1, 9, 1),
	("Steve", 0, 2, 2, 52),
	("Steve", 0, 3, 11, 16);
	
INSERT INTO `BlockInstance` (`xpos`, `ypos`, `zpos`, `objectID`) VALUES 
(0, 0, 0, 1),
(0, 1, 0, 2),
(1, 1, 0, 1),
(1, 0, 0, 2),
(1, -1, 0, 1),
(0, -1, 0, 2),
(-1, -1, 0, 1),
(-1, 0, 0, 2),
(-1, 1, 0, 1);
