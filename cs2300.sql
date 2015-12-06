CREATE TABLE IF NOT EXISTS `world` (
	`xpos`	bigint(20), 
	`ypos`	bigint(20), 
	`zpos`	bigint(20), 
	`id`	bigint(20),  
	PRIMARY KEY (`xpos`, `ypos`, `zpos`) 
);

INSERT INTO `world` (`xpos`, `ypos`, `zpos`, `id`) VALUES 
(0, 0, 0, 1),
(0, 1, 0, 1),
(1, 1, 0, 1),
(1, 0, 0, 2),
(1, -1, 0, 1),
(0, -1, 0, 1),
(-1, -1, 0, 1),
(-1, 0, 0, 1),
(-1, 1, 0, 1);