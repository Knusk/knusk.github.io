<?php
$servername = "localhost:8889";
$username = "knut-einar";
$password = "tullepassord";
$dbname = "vitse_db";

$link = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

$sql = "SELECT * FROM vitser";

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "id: " . $row["id"]. " - Forfatter_id: " . $row["forfatter"]. " Kategori: " . $row["kategori"]. "<br>";
  }
} else {
  echo "0 results";
}
// Close connection
mysqli_close($link);
?>
