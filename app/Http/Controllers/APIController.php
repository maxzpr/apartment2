<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use DB;

class APIController extends Controller
{
    public function index()
    {
        $update_response = file_get_contents("php://input");
        $update = json_decode($update_response, true);
        file_put_contents('data.json',$update_response);
        if (isset($update["queryResult"]["action"])) {
            $msg = $update["queryResult"]["action"];
            if($msg == "ค่าน้ำ123"){
                
            }
        }else{
            echo "ไม่พบคำตอบ";
        }
    }

    private function find_ans($word="")
    {
        $ans = "";
        return (['fulfillmentText'=> $ans ]);
    }
}

?>