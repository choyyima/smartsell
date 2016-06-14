<?php

include './config.php';
$usernamereg = $_POST['name']; // Fetching Values from URL.
$emailreg = $_POST['email'];
$cityreg = $_POST['city'];
$passwordreg = md5($_POST['password']); // Password Encryption, If you like you can also leave sha1.
// Check if e-mail address syntax is valid or not
$emailreg = filter_var($emailreg, FILTER_SANITIZE_EMAIL); // Sanitizing email(Remove unexpected symbol like <,>,?,#,!, etc.)
if (!filter_var($emailreg, FILTER_VALIDATE_EMAIL)) {
    echo "Invalid Email.......";
} else {
    $result = mysql_query("SELECT * FROM member WHERE email='$emailreg'");
    $data = mysql_num_rows($result);
    if (($data) == 0) {
        $query = mysql_query("insert into member(username, email, password, city) values ('$usernamereg', '$emailreg', '$passwordreg', '$cityreg')"); // Insert query
        if ($query) {
            echo "You have Successfully Registered.....";
           // header('Location: index.html');
        } else {
            echo "Error....!!";
        }
    } else {
        echo "This email is already registered, Please try another email...";
    }
}
//mysql_close();
