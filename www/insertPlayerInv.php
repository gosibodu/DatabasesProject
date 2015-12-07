<?php
	include_once "global.php";
	
	mysql_connect($mysql_host,$mysql_user,$mysql_password) or die(mysql_error());
    mysql_select_db($mysql_database) or die(mysql_error());
		
	$result = mysql_query("INSERT INTO PlayerInventory (name, inventoryID, slotNum, item, quantity) VALUES (n,i,s,i,q)");
	
	if($result == FALSE)
	{
		echo "The object was not inserted into the inventory";
	}
?>
