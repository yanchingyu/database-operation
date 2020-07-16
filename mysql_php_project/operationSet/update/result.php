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
  $sqlAttr = 'select * from ' . $table . ' WHERE id='.$_GET['attr'][0];
  $obj = mysqli_query($link, $sqlAttr);
  $numAttr = mysqli_num_fields($obj);

  $arr = [];
  for ($i=0; $i<$numAttr; $i++)
  {
    $result = mysqli_fetch_field_direct($obj, $i);
    $arr[$i] = $result -> name;
  }

  if (!empty($_GET['attr']))
  {
    $sql = 'UPDATE ' . $table . ' SET ';
    for ($i=1; $i < $numAttr ; $i++) {
      $sql .= $arr[$i] . '=' . type($_GET['attr'][$i]) . (($i == $numAttr-1)? '': ',');
    }
    $sql .= ' WHERE id=' . $_GET['attr'][0];
    mysqli_query($link, $sql);
    mysqli_close($link);
  }

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../maincss.css">
  <title>Document</title>
</head>
<body>
  <section>
    <div class="container">
      <div class="content">
        <div class="">
          <h2>修改成功</h2>
        </div>
      </div>
    </div>
  </section>
</body>
</html>

<?php
  function type($var){
    if (gettype($var) == gettype(''))
      return "'$var'";
    if(gettype($var) == gettype(true) or gettype($var) == gettype(123))
      return $var;
  }
 ?>
