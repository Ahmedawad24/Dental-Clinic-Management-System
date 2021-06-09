<?php
    require_once "M_Users.php";

    class UsersView
    {
        public function ShowAllUsers()
        {
            $result = Users::SelectAllUsers();
            for($i=0; $i<count($result); $i++)
            {
                echo("a href = C_Users.php?id=".$result[$i]->ID.">".$result[$i]->Username."</a><br>");
            }
        }

        public function ShowUsersDetails($UsersObject)
        {
            echo "<table border = 2> <tr><td>ID</td><td>".$UsersObject->ID."</td></tr>";
            echo "<tr><td>Users</td><td>".$UsersObject->Username."</td></tr>";
            echo "<tr><td>Users</td><td>".$UsersObject->Password."</td></tr>";
            echo "<tr><td>Users</td><td>".$UsersObject->UsertypeID."</td></tr>";
            echo "</table>";
        }
    }
?>