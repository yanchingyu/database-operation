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

  // 取得屬性放入 $arr
  $sqlAttr = 'select * from ' . $table . ' WHERE id='.$_GET['id'];
  $obj = mysqli_query($link, $sqlAttr);
  $numAttr = mysqli_num_fields($obj);

  $arr = [];
  for ($i=0; $i<$numAttr; $i++)
  {
    $result = mysqli_fetch_field_direct($obj, $i);
    $arr[$i] = $result -> name;
  }
  $arrVal = mysqli_fetch_assoc($obj);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../maincss.css">
  <link rel="stylesheet" href="dodoUpd.css">
  <title>Document</title>
</head>
<body>
  <section>
    <div class="container">
      <div class="content">
        <?php
          echo '<form class="box" action="result.php">';
            echo '<h2>Update</h2>';
            echo '<input type="hidden" name="username" value="' . $username . '">';
            echo '<input type="hidden" name="password" value="' . $password . '">';
            echo '<input type="hidden" name="database" value="' . $database . '">';
            echo '<input type="hidden" name="table" value="' . $table . '">';
            foreach ($arr as $val)
            {
              echo '<label class="form-input" for="attr[]">' .  $val . ': </label>';
              echo '<input type="text" name="attr[]" value="' . (($val == 'id')? $arrVal[$val].'"readonly ': $arrVal[$val].'"') . ' required="required"><br />';
            }
            echo '<input type="submit" value="提交">';
          echo '</form>';
         ?>
      </div>
    </div>
  </section>
</body>
</html>
