<table width="100%">
    <tr>
        <th>Call Sign</th>
        <th>CID</th>
        <th>Real Name</th>
        <th>Aircraft</th>
    </tr>
    <?php
        if ($flights)
        {
            foreach($flights as $flight)
            {
                echo '<tr>';
                echo '<td>'.$flight[0].'</td>';
                echo '<td>'.$flight[1].'</td>';
                echo '<td>'.$flight[2].'</td>';
                echo '<td>'.$flight[9].'</td>';
                echo '</tr>';
            }
        }
    ?>
</table>