<?php
  $page = empty($_GET['page'])? 1: $_GET['page'];
  $username = $_GET['username'];
  $password = $_GET['password'];
  $database = $_GET['database'];
  $attribute = $_GET['attribute'];   // select
  $table = $_GET['table'];      // from

  if (!$username && !$password && !$database && !$attribute && !$table)
    exit('輸入為空');

  $link = mysqli_connect('localhost', $username, $password, $database);
  if (!$link)
    exit('連接失敗');

  mysqli_set_charset($link, 'utf8');

  $sql = 'SELECT ' . $attribute . ' FROM ' . $table;
  if (!empty($_GET['condition']))
    $sql = $sql . ' WHERE ' . $_GET['condition'];

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../maincss.css">
  <link rel="stylesheet" href="doSear.css">
  <title>Document</title>
</head>
<body>
  <section>
    <div class="container">
      <div class="content">
        <?php
          // 分頁開始
          $sqlCount = 'select count(*) as count from (' . $sql . ') prod';
          $res = mysqli_query($link, $sqlCount);
          $pageRes = mysqli_fetch_assoc($res);

          $count = $pageRes['count'];   // 總共幾筆資料
          $num = 5;   // 每頁五筆資料
          $pageCount = ceil($count/$num);   // 求頁數
          $offest = ($page-1) * $num;   //偏移量

          $sql =  $sql . " limit $offest, $num";
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
          echo '<table width="900" border="1">';
          foreach ($arr as $attr){
            echo '<th class="attr">' . $attr . '</th>';
          }
          while ($rows = mysqli_fetch_assoc($obj))
          {
              echo '<tr>';
                foreach ($rows as $val){
                  echo '<td class="val">' . $val . '</td>';
                }
              echo '</tr>';
          }
          echo '</table>';
          $prev = $page - 1;
          $next = $page + 1;
          if ($prev < 1)
            $prev = 1;

          if ($next > $pageCount)
            $next = $pageCount;

        	mysqli_close($link);
          // 分頁結束
        ?>

        <a class="btn" href="doSear.php?page=<?php echo "$prev&username=$username&password=$password&database=$database&attribute=$attribute&table=$table&condition=" . cod(); ?>">上一頁</a>
        <a class="btn" href="doSear.php?page=<?php echo "$next&username=$username&password=$password&database=$database&attribute=$attribute&table=$table&condition=" . cod(); ?>">下一頁</a>
      </d iv>
    </div>
  </section>
</body>
</html>

<?php
  function cod()
  {
    if (!empty($_GET['condition']))
      return $_GET['condition'];
  }
 ?>
