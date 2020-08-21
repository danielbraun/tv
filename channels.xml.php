<?php

header("Content-Type: text/xml");

$db_conn = pg_connect("host=localhost port=5432 user=danielbraun dbname=danielbraun");
$qu = pg_query($db_conn, file_get_contents("channels.sql"));
echo (pg_fetch_all($qu)[0]["xml"]);


pg_free_result($qu);
pg_close($db_conn);

?>
