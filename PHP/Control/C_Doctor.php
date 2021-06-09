<form action="<?=$_SERVER['REQUEST_URI'];?>" method=GET>

    <table border=2>
    <tr><th>Name</th><td><input type="text" name="name"></td></tr>
    <tr><th>Phone Numer</th><td><input type="number" name="number"></td></tr>
    <tr><th>Address</th><td><input type="text" name="address"></td></tr>
    <tr><th>Birthdate</th><td><input type="date" name="birthdate"></td></tr>
    <tr><th>Shift Time</th><td><input type="text" name="shifttime"></td></tr>
    <tr><th>Job Type</th><td><input type="text" name="jobtype"></td></tr>
    <tr><th>Salary</th><td><input type="number" name="salary"></td></tr>
    </table>

    <br>

    <input type="submit" name="AddButton" value="Add" />
    <input type="submit" name="UpdateButton" value="Update" />
    <input type="submit" name="DeleteButton" value="Delete" />

</form>

<?php
    require_once 'M_Doctor.php';
    require_once 'V_Doctor.php';
    require_once 'Connection.php';

    echo $_SERVER['REQUEST_METHOD'];
    echo "<br>";
    echo $_SERVER['PHP_SELF'];
    echo "<br>";
    echo __FILE__;
    echo "<br>";
    echo $_SERVER['PHP_SELF'];
    echo "<br>";
    echo $_SERVER['REQUEST_URI'];
    echo "<br>";
    
    if (isset($_REQUEST['DocID'])) {
        $DoctorObject = new Doctor($_REQUEST['DocID']);
        $Temp = $_REQUEST['DocID'];
        $View = new DoctorView();
        $View->ShowDoctorDetails($DoctorObject);
        if (isset($_GET['AddButton'])) 
        {
            $DoctorObject = new Doctor($Temp);
            $db = Database::getInstance();
            $connection = Database::GetConnection();
            $sql = "INSERT INTO `doctors`(`Docname`, `Docphone`, `Docbirthdate`, `Docshifttime`, `Docsalary`) VALUES ($DoctorObject->Name,$DoctorObject->PhoneNumber,$DoctorObject->Birthdate,$DoctorObject->ShiftTime,$DoctorObject->Salary)";
            mysqli_query($sql, $connection) or die(mysqli_error($connection));
        }else {
            echo "No Add <br>";
        }

        if (isset($_GET['UpdateButton'])) 
        {
            $DoctorObject = new Doctor($Temp);
            $db = Database::getInstance();
            $connection = Database::GetConnection();
            $ID = $DoctorObject->ID;
            $Name = $DoctorObject->Name;
            $PhoneNumber = $DoctorObject->PhoneNumber;
            $AddressID = $DoctorObject->AddressID;
            $Address = $DoctorObject->Address;
            $Birthdate = $DoctorObject->Birthdate;
            $ShiftTime = $DoctorObject->ShiftTime;
            $JobTypeID = $DoctorObject->JobTypeID;
            $JobType = $DoctorObject->JobType;
            $Salary = $DoctorObject->Salary;
            $sql = "UPDATE `doctors` SET `Docname`=$Name,`Docphone`=$PhoneNumber,`DocaddressID`=$AddressID,`Docbirthdate`=$Birthdate,`Docshifttime`=$ShiftTime,`Docsalary`=$Salary WHERE `DocID` = $ID";
            mysqli_query($connection, $sql) or die(mysqli_error($connection));
        }else {
            echo "No Update <br>";
        }

        if (isset($_GET['DeleteButton'])) 
        {
            //$DoctorObject = new Doctor($_REQUEST['DocID']);
            echo "Delete";
            echo $Temp;
            // $db = Database::getInstance();
            // $connection = Database::GetConnection();
            // $sql = "DELETE FROM `doctors` WHERE DocID = $DoctorObject->ID";
            // mysqli_query($sql, $connection) or die(mysqli_error($connection));
        }else {
            echo "No Delete<br>";
        }
    }
        

    function DoctorAdd($DoctorObject){
        $connection = Database::GetConnection();
        $sql = "DELETE FROM `doctors` WHERE DocID = $DoctorObject->ID";
        mysqli_query($sql, $connection) or die(mysqli_error($connection));
    }

?>