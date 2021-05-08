<?
function drawTable()
{
     $cols = 10;
     $rows = 10;
     $color;

     echo "<table>";

     for ($tr = 1; $tr <= $rows; $tr++) 
     {
          echo "<tr>";
          
          for ($td = 1; $td <= $cols; $td++) 
          { 
               echo "<td>" . $tr * $td . "</td>"; 
          }
          
          echo "</tr>";
     }
     
     echo "</table>";
}
?>