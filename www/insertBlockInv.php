<?php
	include_once "global.php";
	
	mysql_connect($mysql_host,$mysql_user,$mysql_password) or die(mysql_error());
    mysql_select_db($mysql_database) or die(mysql_error());
		
	$result = mysql_query("INSERT INTO BlockInventory (xpos, ypos, zpos, inventoryID, slotNum, item, quantity) VALUES (x,y,z,i,s,i,q)");
	
	if($result == FALSE)
	{
		echo "The object was not inserted into the inventory";
	}
?>
