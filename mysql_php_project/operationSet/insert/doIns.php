<?php
  $username = $_GET['username'];
  $password = $_GET['password'];
  $database = $_GET['database'];
  $table = $_GET['table'];
  if (!$username && !$password && !$database && !$table)
    exit('輸入為空');

  $link = mysqli_connect('localhost', $username, $password, $database);
  if (!$link)
    exit('連接失敗');

  mysqli_set_charset($link, 'utf8');

  //屬性
  $sql = 'SELECT * from '. $table;
  $obj = mysqli_query($link, $sql);
  $numAttr = mysqli_num_fields($obj);
  $arr = [];
  for ($i=0; $i < $numAttr; $i++) {
    $result = mysqli_fetch_field_direct($obj, $i);
    $arr[$i] = $result -> name;
  }
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../maincss.css">
  <link rel="stylesheet" href="doIns.css">
  <title>Document</title>
</head>
<body>
  <section>
    <div class="container">
      <div class="content">
        <?php
          echo '<form class="box" action="dodoIns.php">';
            echo '<h2>Insert</h2>';
            echo '<input type="hidden" name="username" value="' . $username . '">';
            echo '<input type="hidden" name="password" value="' . $password . '">';
            echo '<input type="hidden" name="database" value="' . $database . '">';
            echo '<input type="hidden" name="table" value="' . $table . '">';
            foreach ($arr as $val)
            {
              echo '<input type="text" name="attribute[]"  placeholder="' . $val . '" required="required">';
            }
            echo '<input type="submit" value="插入">';
          echo '</form>';
        ?>
      </div>
    </div>
  </section>
</body>
</html>
