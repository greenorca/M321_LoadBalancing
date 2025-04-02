<?php
// Introduce a delay of 5 seconds
sleep(5);

// Get the server IP address
$server_ip = $_SERVER['SERVER_ADDR'] ?? 'Unknown';

// Respond with the server IP
header('Content-Type: text/plain');
echo "Hello, here is a response from Server IP: $server_ip\n";