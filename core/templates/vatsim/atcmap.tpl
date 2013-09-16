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
	center: new google.maps.LatLng(28.08619, 36.40541),
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
icon: "http://www.baggelis.com/atc.jpg",  
	title: "<?php echo $acars[2];?>",
});
var contentString = '<font face=Tahoma><table><tr><td colspan="2"><b>Controler: </b> <?php echo $acars[2];?></td></tr><td><b>Station Controling : </b> <?php echo $acars[0];?></td></tr></table></font>';
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
        <th>Real Name</th>
        <th>Airport Icao</th>
    </tr>
    <?php
        if ($flights)
        {
            foreach($flights as $flight)
            {
                echo '<tr>';
                               echo '<td>'.$flight[2].'</td>';
                echo '<td>'.$flight[0].'</td>';
              
                echo '</tr>';
            }
        }
    ?>
</table>

