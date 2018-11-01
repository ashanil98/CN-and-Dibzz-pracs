<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "myDB";
$name = $_POST["name"];
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "INSERT INTO Table1 VALUES ('$name')";
if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?> 
<html>
    <body>
        for <?php echo $_POST["name"]; ?><br>
    </body>
</html> 
