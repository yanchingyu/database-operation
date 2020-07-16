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
  <link rel="stylesheet" href="menu.css">
  <title>Document</title>

</head>
<body>
  <section>
    <div class="container">
      <div class="operation">
        <div>
          <a href="operationSet/allTable/allTable.php<?php echo "?username=$username&password=$password&database=$database" ?>" target="mainGameproject">表格瀏覽</a>
        </div>
        <div>
          <a href="operationSet/search/search.php<?php echo "?username=$username&password=$password&database=$database" ?>" target="mainGameproject">搜尋</a>
        </div>
        <div>
          <a href="operationSet/insert/insert.php<?php echo "?username=$username&password=$password&database=$database" ?>" target="mainGameproject">新增</a>
        </div>
        <div>
          <a href="operationSet/update/update.php<?php echo "?username=$username&password=$password&database=$database" ?>" target="mainGameproject">修改</a>
        </div>
        <div>
          <a href="operationSet/delete/delete.php<?php echo "?username=$username&password=$password&database=$database" ?>" target="mainGameproject">刪除</a>
        </div>
        <div>
          <a href="mainGameproject.html" target="mainGameproject">返回主頁面</a>
        </div>
      </div>
      <div class="block"></div>
    </div>
  </section>
</body>
</html>
