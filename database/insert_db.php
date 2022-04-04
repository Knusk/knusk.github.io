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

$sql = "INSERT INTO vitser (vitsen, forfatter, kategori)
VALUES ('Du er ikke så smart som du tror.', '2', '3')";

if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}
// Close connection
mysqli_close($link);
?>
