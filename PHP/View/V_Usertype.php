<?php
    require_once "M_UsertType.php";

    class UserTypeView
    {
        public function ShowAllUserTypes()
        {
            $result = UserType::SelectAllUserTypes();
            for($i=0; $i<count($result); $i++)
            {
                echo ("a href = C_UserType.php?id=".$result[$i]->ID.">".$result[$i]->UserType."</a><br>");
            }
        }

        public function  ShowUserTypeDetails($UserTypeObject)
        {
            echo "<table border = 2> <tr><td>ID</td><td>".$UserTypeObject->ID."</td></tr>";
            echo "<tr><td>UserType</td><td>".$UserTypeObject->UserType."</td></tr>";
            echo "</table>";
        }
    }
?>