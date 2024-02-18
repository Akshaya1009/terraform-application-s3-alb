#!/bin/bash

apt-update
apt install -y apache2

apt install -y awscli

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>from Terraform instance2</title>
</head>
<body>

<h1>Learning in Terraform instance2</h1>
<p>Enjoying learning terraform instance 2</p>

</body>
</html>
EOF

systemctl start apache2
syetemctl enable apache2

