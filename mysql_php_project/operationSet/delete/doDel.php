<?php
  $page = empty($_GET['page'])? 1: $_GET['page'];
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
  if (!empty($_GET['id']))
  {
    $id = [];
    foreach ($_GET['id'] as $val)
    {
      $id[] += $val;
    }
    foreach ($id as $val)
    {
      $sql = 'DELETE FROM ' . $table . ' WHERE id = ' . $val;
      mysqli_query($link, $sql);
    }
  }
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../maincss.css">
  <link rel="stylesheet" href="doDel.css">
  <title>Document</title>
</head>
<body>
  <section>
    <div class="container">
      <div class="content">
        <?php
          // 分頁開始
          $sqlCount = 'select count(*) as count from '. $table;
          $res = mysqli_query($link, $sqlCount);
          $pageRes = mysqli_fetch_assoc($res);

          $count = $pageRes['count'];   // 總共幾筆資料
          $num = 5;   // 每頁五筆資料
          $pageCount = ceil($count/$num);   // 求頁數
          $offest = ($page-1) * $num;   //偏移量

          $sql = "select * from $table limit $offest, $num";
          $obj = mysqli_query($link, $sql);
          // 屬性個數
          $numAttr = mysqli_num_fields($obj);
          $arr = [];
          // 屬性存放到arr陣列裡
          for ($i=0; $i<$numAttr; $i++)
          {
            $result = mysqli_fetch_field_direct($obj, $i);
            $arr[$i] = $result -> name;
          }

          // 資料
          echo '<h2>' . $table . '</h2>';
          echo '<form action="doDel.php">';
            echo '<table width="900" border="1">';
              echo '<th></th>';
              foreach ($arr as $attr){
                echo '<th class="attr">' . $attr . '</th>';
              }
              while ($rows = mysqli_fetch_assoc($obj))
              {
                echo '<tr>';
                  echo '<input type="hidden" name="username" value="' . $username . '">';
                  echo '<input type="hidden" name="password" value="' . $password . '">';
                  echo '<input type="hidden" name="database" value="' . $database . '">';
                  echo '<input type="hidden" name="table" value="' . $table . '">';
                  echo '<td class="checkbox">' . '<input type="checkbox" name="id[]" value="' . $rows['id'] . '"></td>';
                  foreach ($rows as $val){
                    echo '<td class="val">' . $val . '</td>';
                  }
                echo '</tr>';
              }
            echo '</table>';
            echo '<div class="submit"><input type="submit" value="刪除"></div>';
          echo '</form>';
          $prev = $page - 1;
          $next = $page + 1;
          if ($prev < 1)
            $prev = 1;

          if ($next > $pageCount)
            $next = $pageCount;

        	mysqli_close($link);
          // 分頁結束
        ?>

        <a class="btn" href="doDel.php?page=<?php echo "$prev&username=$username&password=$password&database=$database&table=$table" ?>">上一頁</a>
        <a class="btn" href="doDel.php?page=<?php echo "$next&username=$username&password=$password&database=$database&table=$table" ?>">下一頁</a>
      </div>
    </div>
  </section>
</body>
</html>
