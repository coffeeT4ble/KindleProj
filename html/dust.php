<?php                                                                                                                                                                                                                
header('Content-Type: text/html');                                                                                                                                                                                   
echo "<html><body>";                                                                                                                                                                                                 
$output = shell_exec('dust /');                                                                                                                                                                                      
echo "<pre>" . htmlspecialchars($output) . "</pre>";                                                                                                                                                                 
echo "</body></html>";                                                                                                                                                                                               
?>
