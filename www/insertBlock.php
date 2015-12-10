<?php
	include_once "global.php";
	
	mysql_connect($mysql_host,$mysql_user,$mysql_password) or die(mysql_error());
	mysql_select_db($mysql_database) or die(mysql_error());
	
	$objectID = $_GET['id'];
	$X = $_GET['x'];
	$Y = $_GET['y'];
	$Z = $_GET['z'];
	
	mysql_query("INSERT INTO BlockInstance (xpos, ypos, zpos, objectID) 
				  VALUES($X, $Y, $Z, $objectID)");
	
?>