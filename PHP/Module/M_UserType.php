<?php
     class UserType
     {
         public $ID;
         public $UserType;
         
         function __construct($ID)
         {
             $sql = "select * from usertype where $ID = UserTypeID";
             $UserTypeDataSet = mysql_query($sql) or die(mysql_error());
             if($row = mysql_fetch_array($UserTypeDataSet))
             {
                 $this->$UserType = $row ["UserType"];
             }
         }
 
         public static function SelectAllUserTypes()
         {
             $sql = "select * from users ordered by UserType";
             $UserTypeDataSet = mysql_query($sql) or die(mysql_error());
             $i = 0;
             while($row = mysql_fetch_array($UserTypeDataSet))
             {
                 $result[$i] = new UserType($row["UserTypeID"]);
                 $i++;
             }
             return $result;
         }
         
     }
?>