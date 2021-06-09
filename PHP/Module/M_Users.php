<?php
    class Users
    {
        public $ID;
        public $Username;
        public $Password;
        public $UsertypeID;
        
        function __construct($ID)
        {
            $sql = "select * from users where $ID = UserID";
            $UsersDataSet = mysql_query($sql) or die(mysql_error());
            if($row = mysql_fetch_array($UsersDataSet))
            {
                $this->$Username = $row ["Username"];
                $this->$Password = $row ["Passwrod"];
                $this->UsertypeID = $row ["UsertypeID"];
            }
        }

        public static function SelectAllUsers()
        {
            $sql = "select * from users ordered by Username";
            $UsersDataSet = mysql_query($sql) or die(mysql_error());
            $i = 0;
            while($row = mysql_fetch_array($UsersDataSet))
            {
                $result[$i] = new Users($row["UserID"]);
                $i++;
            }
            return $result;
        }
        
    }
?>