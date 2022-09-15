<?php
$DATABASE = "";
$DBUSER = "";
$DBPASSWD = "";
$PATH = "YOUR PATH";
$FILE_NAME = "backup-DB-" . $DATABASE ."-". date("d-m-Y-H.i.s"). ".sql.gz";
exec('/usr/bin/mysqldump -u ' . $DBUSER . ' -p' . $DBPASSWD . ' ' . $DATABASE . ' | gzip --best > ' . $PATH . $FILE_NAME);
date_default_timezone_set("Asia/Bangkok");
echo "[".date("d-m-Y H:i:s")."] Backup Database " . $DATABASE . " Successfully<br>";
echo  "[".date("d-m-Y H:i:s")."] File Name : " . $FILE_NAME . "<br>";
//  "Database(" . $DATABASE . ") backup completed. File name: " . $FILE_NAME;





?>
