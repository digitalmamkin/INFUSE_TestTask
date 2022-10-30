<?php
require __DIR__.'/vendor/autoload.php';

/**
 * View
 */
// Current user data array;
$data = [
    'ip_address' => $_SERVER['REMOTE_ADDR'],
    'user_agent' => $_SERVER['HTTP_USER_AGENT'],
    'page_url' => basename($_SERVER['HTTP_REFERER']),
];

// Connect to DB:
$db = new MysqliDb ('127.0.0.1:8889', 'root', 'root', 'infuse_test_task');

// Add conditions in query;
foreach($data as $key => $value){
    $db->where($key, $value);
}

// Checking exist views for current user data;
$exist_view = $db->getOne("views");

// If this is first view;
if($exist_view == null){
    // Add first view in DB;
    $data['view_date'] = date('Y-m-d H:i:s');
    $data['views_count'] = 1;

    // Insert;
    $db->insert('views', $data);
}   else{
    // Add conditions in query for views update;
    foreach($data as $key => $value){
        $db->where($key, $value);
    }

    // Update;
    $db->update('views', [
        'views_count' => $exist_view['views_count'] + 1
    ]);
}

/**
 * Image
 */
// Getting random image from images folder;
$path = __DIR__ . '/images/'.rand(1, 4).'.jpg';
// Getting file type;
$type = pathinfo($path, PATHINFO_EXTENSION);
// Handle file for getting data;
$handle = fopen($path, "rb");
// Get data from the file;
$contents = fread($handle, filesize($path));
// Close file;
fclose($handle);
// Add HEADER from correct image view;
header("content-type: image/$type");
// "Return" image;
echo $contents;