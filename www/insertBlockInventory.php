<?php
	include_once "global.php";
	
	mysql_connect($mysql_host,$mysql_user,$mysql_password) or die(mysql_error());
	mysql_select_db($mysql_database) or die(mysql_error());
  
	$x = $_GET['x'];
	$y = $_GET['y'];
	$z = $_GET['z'];
	$inv = $_GET['inv'];
	$slot = $_GET['slot'];
	$item = $_GET['item'];
	$num = $_GET['qty'];
  
	mysql_query("INSERT INTO BlockInventory (xpos, ypos, zpos, inventoryID, slotNum, item, quantity) 
							VALUES ($x,$y,$z,$inv,$slot,$item,$num)");
	
	$result = array('result' => 1);
	
	echo json_encode($result);
?>