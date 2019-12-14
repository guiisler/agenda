<?php
session_start(); // Starting Session
$error=''; // Variable To Store Error Message
if (isset($_POST['submit'])) {
	if (empty($_POST['username']) || empty($_POST['password'])) {
		$error = "Os campos Usuario e senha nao podem estar vazios";
	}
	else
	{
	// Define $username and $password
	$username=$_POST['username'];
	$password=$_POST['password'];

	// Establishing Connection with Server by passing server_name, user_id and password as a parameter
	$connection = mysqli_connect("localhost", "guiisler", "Marista@2015");

	// To protect MySQL injection for Security purpose
	$username = stripslashes($username);
	$password = stripslashes($password);
	$username = mysqli_real_escape_string($connection, $username);
	$password = mysqli_real_escape_string($connection, $password);

	// Selecting Database
	$db = mysqli_select_db($connection, 'agenda');

	// SQL query to fetch information of registerd users and finds user match.
	$query = "select * from agenda where password='$password' AND username='$username'";
	$result = mysqli_query($connection, $query);

	$rows = mysqli_num_rows($result);


	if ($rows == 1) 
	{
		$_SESSION['login_user']=$username; // Initializing Session
		header("location: home.html"); // Redirecting To Other Page
		} else {
			$error = "  Usuário ou senha inválidos";
		}
		mysqli_close($connection); // Closing Connection
	}

}
?>