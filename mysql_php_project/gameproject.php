<?php
  $username = $_GET['username'];
  $password = $_GET['password'];
  $database = $_GET['database'];
  if (!$username && !$password && !$database)
    exit('輸入為空');

  $link = mysqli_connect('localhost', $username, $password, $database);
  if (!$link)
    exit('連接失敗');

  mysqli_set_charset($link, 'utf8');
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>gameSQL operation</title>

</head>
  <frameset rows="*" cols="20%,*" frameborder="no">
    <frame src="menu.php<?php echo "?username=$username&password=$password&database=$database" ?>" scrolling="no" name="menu"></frame>
    <frame src="mainGameproject.html" scrolling="no" name="mainGameproject"></frame>
  </frameset>

</html>
