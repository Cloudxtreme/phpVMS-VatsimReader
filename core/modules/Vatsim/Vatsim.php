<?php
//simpilotgroup addon module for phpVMS virtual airline system
//
//simpilotgroup addon modules are licenced under the following license:
//Creative Commons Attribution Non-commercial Share Alike (by-nc-sa)
//To view full icense text visit http://creativecommons.org/licenses/by-nc-sa/3.0/
//A link to http://www.simpilotgroup.com must be provided on any webpage utilizing this script
//
//@author David Clark (simpilot)
//@copyright Copyright (c) 2011, David Clark
//@license http://creativecommons.org/licenses/by-nc-sa/3.0/

class Vatsim extends CodonModule {
    public $section=null;
    public $count = 0;

    public function get_vatsim_data($find) {
    //get new file from Vatsim if the existing one is more than 5 minutes old
        if(!file_exists('vatsimdata.txt') || time()-filemtime('vatsimdata.txt') > 300) {
        //choose a random download location per Vatsim policy
            $random = (rand(1, 4));
            if ($random == 1) {$url = 'http://www.net-flyer.net/DataFeed/vatsim-data.txt';}
            if ($random == 2) {$url = 'http://www.klain.net/sidata/vatsim-data.txt';}
            if ($random == 3) {$url = 'http://fsproshop.com/servinfo/vatsim-data.txt';}
            if ($random == 4) {$url = 'http://info.vroute.net/vatsim-data.txt';}
            //get the file
            $file = new CodonWebService();
            $contents = @$file->get($url);
            //save new file to server
            $newfile="vatsimdata.txt";
            $file = fopen ($newfile, "w");
            fwrite($file, $contents);
            fclose ($file);
        }

        $contents = file('vatsimdata.txt');
        $this->section = array();
        $readsection = false;
        foreach($contents as $line) {
            if(preg_match("/.*{$find}.*/i", $line, $matches)) {
                $readsection = true;
                continue;
            }
            if($readsection) {
                if(trim($line) == ';') {
                    break;
                }

                $this->section[] = $line;
                $count=$this->count++;
            }
        }
    }

    public function create_vatsim_data($find, $type, $callsign) {
        if($this->section == null)
            $this->get_vatsim_data($find, $type, $callsign);
        
        if(count($callsign) <= 1)
        {$callsigns = '/^'.$callsign.'/';}
        else
        {$callsigns = '/(^' .implode('|^', $callsign) .')/i'; }
        
        foreach ($this->section as $row) {
            $row_info = explode(":", $row);
            if (preg_match("/^$type/", $row_info[3])) {
                if (preg_match("$callsigns", $row_info[0])) {
                    Template::Set('row_info', $row_info);
                    Template::Show('vatsim.tpl');
                }
            }
        }
    }

    public function count_vatsim_data($find, $type, $callsign) {
        if($this->section == null)
            $this->get_vatsim_data($find, $type, $callsign);
        
        if(count($callsign) <= 1)
        {$callsigns = '/^'.$callsign.'/';}
        else
        {$callsigns = '/(^' .implode('|^', $callsign) .')/i'; }

        foreach ($this->section as $row) {
            $row_info = explode(":", $row);
            if (preg_match("/^$type/", $row_info[3])) {
                if (preg_match("$callsigns", $row_info[0])) {
                    $count = $count + 1;
                }
            }
        }
        if(!$count){$count = 0;}
        echo $count;
    }
}