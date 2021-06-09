<?php
    class Manager
    {
        public $ID;
        public $Name;
        public $Phone;
        public $AddressID;
        public $BirthDate;
        public $ShiftTime;
        public $JobTypeID;
        public $Salary;
        
        function __construct($ID)
        {
            $sql = "select * from manager where $ID = ManagerID";
            $ManagerDataSet = mysql_query($sql) or die(mysql_error());
            if($row = mysql_fetch_array($ManagerDataSet))
            {
                $this->$Name = $row ["Managername"];
                $this->$Phone = $row ["Managerphone"];
                $this->$AddressID = $row ["ManagerAddressID"];
                $this->$BirthDate = $row ["Managerbirthdate"];
                $this->$ShiftTime = $row ["Managershifttime"];
                $this->$JobTypeID = $row ["ManagerjobtypeID"];
                $this->$Salary = $row["Managersalary"];
            }
        }

        public static function SelectManagers()
        {
            $sql = "select * from manager ordered by Managername";
            $ManagerDataSet = mysqli_query($sql) or die(mysqli_error($connection));
            $i = 0;
            while($row = mysql_fetch_array($ManagerDataSet))
            {
                $result[$i] = new Manager($row["ManagerID"]);
                $i++;
            }
            return $result;
        }
        
    }
?>