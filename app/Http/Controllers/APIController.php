<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use DB;

class APIController extends Controller
{
    public function index(Request $req)
    {
        $update_response = file_get_contents("php://input");
        $update = json_decode($update_response, true);
        file_put_contents(base_path().'/data.json',$update_response);
        if (isset($update["queryResult"]["action"])) {
            $msg = $update["queryResult"]["action"];
            switch($msg){
                case "สอบถาม"   : return $this->detail();        break;
                case "รายละเอียด" : return $this->detail();        break;
                case "ค่าน้ำ"      : return $this->elect_water();  break;
                case "ค่าไฟ"      : return $this->elect_water();  break;
                case "ห้องว่าง"    :return $this->empty_room();   break;
                case "ราคา"    : return $this->price_type();   break;
                default : return ['fulfillmentText'=> "ไม่เข้าใจ" ]; break;
            }
        }else{
            echo "ไม่พบคำตอบ";
        }
    }

    private function detail()
    {
        $ans = DB::table('aparts')->first()->detail;
        return (['fulfillmentText'=> $ans ]);
    }

    private function elect_water($word="")
    {
        $ans = DB::table('aparts')->first();
        $data = "ค่าน้ำ {$ans->water} บาทต่อหน่วย \n\n ค่าไฟ {$ans->elect} บาทต่อหน่วย";
        return (['fulfillmentText'=> $data ]);
    }

    private function empty_room($word="")
    {
        $ans = DB::table('rooms')->select(DB::raw('SUM(IF(is_empty=0,1,0)) as is_empty,rent'))->where('type','=','พัดลม')->first();
        $ans2 = DB::table('rooms')->select(DB::raw('SUM(IF(is_empty=0,1,0))  as is_empty,rent'))->where('type','=','แอร์')->first();
        $ans->is_empty = empty($ans->is_empty)?0:$ans->is_empty;
        $ans2->is_empty = empty($ans2->is_empty)?0:$ans2->is_empty;
        $data = "ห้องพัดลม ราคา {$ans->rent} บาทต่อเดือน ว่าง {$ans->is_empty} ห้อง 
                 ห้องแอร์ ราคา {$ans2->rent} บาทต่อเดือน ว่าง {$ans2->is_empty} ห้อง";
        return (['fulfillmentText'=> $data ]);
    }

    private function price_type($word="")
    {
        return $this->empty_room();
    }
}

?>