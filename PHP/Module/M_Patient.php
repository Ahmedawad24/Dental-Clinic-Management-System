<?php

//requiring database place and foreign key tables
require_once 'Connection.php';

    class Patient
    {
        public $ID;
        public $Name;
        public $PhoneNumber;
        public $AddressID;
        public $Address;
        public $Birthdate;
        public $BloodType;
        public $HealthCareID;
        public $LocalID;
        public $MedicalDiagnosisID;
        public $MedicalDiagnosisObj;


        function construct_id($ID)
        {
            $db = Database::GetConnection();
            if ($ID != "") 
            {
                $sql = "SELECT * FROM `patients` WHERE PatID = $ID";
                $connecntion = Database::GetConnection();
                $PatientDataset = mysqli_query($connecntion, $sql) or die(mysqli_error());
                if($row = mysqli_fetch_array($PatientDataset))
                {
                    $this->Name = $row['Patname'];
                    $this->PhoneNumber = $row['Patphone'];
                    $this->AddressID = $row['pataddressID'];
                    //filling Address
                    /*

                    */
                    $this->Birthdate = $row['Patbirthdate'];
                    $this->BloodType = $row['Patbloodtype'];
                    $this->HealthCareID = $row['PathealthcareID'];
                    $this->LocalID = $row['PatlocalID'];
                    // $sql3 = "select * from medicalhistory where MhistoryID = $MedicalDiagnosisID";
                    // $AllMedicalID = mysql_query($sql3) or die(mysql_error());
                    // $j = 0;
                    // while($row2 = mysql_fetch_array($AllMedicalID))
                    // {
                    //     $this->$MedicalDiagnosisObj[$j] = new MedicalHistory($row2["MhistoryID"]);
                    //     $j++;
                    // }
                }
            }
        }

        public static function SelectAllPatients()
        {
            $connecntion = Database::GetConnection();
            $sql = "SELECT * FROM `patients` ORDER BY Patname";
            $PatientDataset = mysqli_query($connecntion, $sql) or die(mysqli_error());
            $i = 0;
            $result;
            while($row = mysqli_fetch_array($PatientDataset))
            {
                $result[$i] = new Patient($row['PatID']);
                $i++;
            }
            return $result;
        }
    }

?>