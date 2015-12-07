<?php
	include_once "global.php";
	
	mysql_connect($mysql_host,$mysql_user,$mysql_password) or die(mysql_error());
  mysql_select_db($mysql_database) or die(mysql_error());
	
	$X = $_GET['x'];
	$Y = $_GET['y'];
	$Z = $_GET['z'];
	
	$result = mysql_query("DELETE FROM BlockInstance WHERE xpos = $X AND ypos = $Y AND zpos = $Z");
	
?>
