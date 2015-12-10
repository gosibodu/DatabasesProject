<?php
	include_once "global.php";
	
	mysql_connect($mysql_host,$mysql_user,$mysql_password) or die(mysql_error());
  mysql_select_db($mysql_database) or die(mysql_error());
	
  $name = $_GET['name'];
  $inv = $_GET['inv'];
  $slot = $_GET['slot'];
  $item = $_GET['item'];
  $num = $_GET['qty'];
	
	mysql_query("INSERT INTO PlayerInventory (name, inventoryID, slotNum, item, quantity) 
	              VALUES ($name, $inv, $slot, $item, $num)");
	
?>
