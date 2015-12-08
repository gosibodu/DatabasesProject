<?php
	include_once "global.php";
	
	mysql_connect($mysql_host,$mysql_user,$mysql_password) or die(mysql_error());
  mysql_select_db($mysql_database) or die(mysql_error());
	
	$X = $_GET['x'];
	$Y = $_GET['y'];
	$Z = $_GET['z'];
	
	$result = mysql_query("SELECT inventoryID, slotNum, item, damage, quantity, stackSize
	                        FROM Item I,BlockInventory B 
	                        WHERE I.objectID = B.item AND xpos = $X AND ypos = $Y AND zpos = $Z");
	
	$data = array();
	while($row = mysql_fetch_row($result)) {
		$data[] = $row;
	}
	
	echo json_encode($data);
?>
