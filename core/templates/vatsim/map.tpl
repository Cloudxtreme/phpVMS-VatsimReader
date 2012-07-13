<?php
	if(!$flights)
	{
    	$flights = array();
	}
?>
<center>
<div class="mapcenter" align="center">
<div id="acarsmap" style="width:680px; height: 500px;"></div>
</div>

<script type="text/javascript">
var options = {
	zoom: 4,
	center: new google.maps.LatLng(45.484400, -95.334821),
	mapTypeId: google.maps.MapTypeId.ROADMAP,
	streetViewControl: false,
	
}
var map = new google.maps.Map(document.getElementById("acarsmap"), options);
</script>
<?php
$count = 0;
foreach($flights as $acars)
{
?>

<script type="text/javascript">
var pointer_<?php echo $count;?> = new google.maps.LatLng(<?php echo $acars[5];?>, <?php echo $acars[6];?>);
var point_<?php echo $count;?> = new google.maps.Marker({
	position: pointer_<?php echo $count;?>,
	map: map,
	icon: "<?php echo fileurl('/lib/images/inair/'.$acars[38].'.png');?>",
	title: "<?php echo $acars[2];?>",
});
var contentString = '<font face=Tahoma><table><tr><td colspan="2"><b>Pilot: </b> <?php echo $acars[2];?></td></tr><td><b>Departure: </b> <?php echo $acars[11];?></td><td><b>Arrival: </b> <?php echo $acars[13];?></td></tr><tr><td><b>Flight #: </b> <?php echo $acars[0];?></td><td><b>Aircraft: </b> <?php echo $acars[9];?></td></tr><tr><td><b>Altitude: </b> <?php echo $acars[7];?> Feet</td><td><b>Heading: </b> <?php echo $acars[38];?> Degrees</td></tr><tr><td><b>GS: </b> <?php echo $acars[8];?> knots</td></tr></table></font>';
var infowindow_<?php echo $count;?> = new google.maps.InfoWindow({
    content: contentString
});
google.maps.event.addListener(point_<?php echo $count;?>, 'click', function() {
	infowindow_<?php echo $count;?>.open(map,point_<?php echo $count;?>);
});
</script>
<?php
$count = 1 + $count;
}
?>

</center>

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