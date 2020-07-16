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
  <link rel="stylesheet" href="../maincss.css">
  <link rel="stylesheet" href="search.css">
  <title>Document</title>
</head>
<body>
  <section>
    <div class="container">
      <div class="content">
        <?php
          echo '<form class="box" action="doSear.php">';
            echo '<h2>Search</h2>';
            echo '<input type="hidden" name="username" value="' . $username . '">';
            echo '<input type="hidden" name="password" value="' . $password . '">';
            echo '<input type="hidden" name="database" value="' . $database . '">';
            echo '<input type="text" name="attribute" placeholder="呈現表格的屬性" required="required">';
            echo '<input type="text" name="table" placeholder="呈現的表格" required="required">';
            echo '<input type="text"  name="condition" placeholder="條件式">';
            echo '<input type="submit" value="搜尋">';
          echo '</form>';
        ?>
      </div>
    </div>
  </section>

</body>
</html>
