<?php
	include_once "global.php";
	
	mysql_connect($mysql_host,$mysql_user,$mysql_password) or die(mysql_error());
	mysql_select_db($mysql_database) or die(mysql_error());
	
	$result = mysql_query("SELECT B.objectID,name,hasInventory 
							FROM Object O,Block B 
							WHERE O.objectID = B.objectID");
	
	$data = array();
	while($row = mysql_fetch_row($result)) {
		$data[] = $row;
	}
	
	echo json_encode($data);
?>