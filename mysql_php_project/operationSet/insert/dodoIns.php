<?php
  $username = $_GET['username'];
  $password = $_GET['password'];
  $database = $_GET['database'];
  $table = $_GET['table'];
  $attribute = $_GET['attribute'];
  if (!$username && !$password && !$database && !$table && $attribute)
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
  // 要插入的sql 語句
  $sql = 'INSERT INTO ' . $table . '(';
  for ($i=0; $i<$numAttr ; $i++)
  {
    $sql .= $arr[$i] . (($i==$numAttr-1) ? '': ', ');
  }
  $sql .= ') VALUES (';
  for ($i=0; $i < $numAttr; $i++) {
    $sql .= type($attribute[$i]) . (($i==$numAttr-1) ? '': ', ');
  }
  $sql .= ')';

  mysqli_query($link, $sql);

  mysqli_close($link);
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
        <div class="">
          <h2>更新成功</h2>
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
