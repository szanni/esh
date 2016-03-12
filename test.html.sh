<!DOCTYPE html>
<html>
<body>
  <ul>
  <!--{{ for i in $(ls); do }}-->
    <li>{{= $i }}</li>
  <!--{{ done }}-->
  </ul>
</body>
</html>
