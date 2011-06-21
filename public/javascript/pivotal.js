function update() {
	$.each(["unscheduled", "finished", "started", "delivered"], function(index, value) { 
	  $('.'+value).load('/update/'+value);
	})
}

$(function() {
	var updateInterval = window.setInterval(function() {
		update();
	}, 10000);
	
	update();
});