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
  <link rel="stylesheet" href="update.css">
  <title>Document</title>
</head>

<body>
  <section>
    <div class="container">
      <div class="content">
        <div class="caption">
          <h2>選擇要修改的表格</h2>
        </div>
        <form class="containerBtn" action="doUpd.php">
          <input type="hidden" name="username" value="<?php echo $username ?>">
          <input type="hidden" name="password" value="<?php echo $password ?>">
          <input type="hidden" name="database" value="<?php echo $database ?>">
          <input type="submit" class="btn" name="table" value="publisher">
          <input type="submit" class="btn" name="table" value="agent"><br />
          <input type="submit" class="btn" name="table" value="website">
          <input type="submit" class="btn" name="table" value="games">
        </form>
      </div>
    </div>
  </section>
</body>
</html>
