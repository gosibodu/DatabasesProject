<?php
	include_once "global.php";
	
	mysql_connect($mysql_host,$mysql_user,$mysql_password) or die(mysql_error());
  mysql_select_db($mysql_database) or die(mysql_error());
	
	$result = mysql_query("UPDATE BlockInstance SET objectID = $objectID WHERE X = $X AND Y = $Y AND Z = $Z");
	
	if($result == false)
	{
		echo "Error! Modification failed!"
	}
?>
