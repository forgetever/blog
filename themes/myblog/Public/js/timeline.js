$(document).ready(function() {
	var timelineAnimate;
	/*
	# =============================================================================
	#   Timeline animation
	# =============================================================================
	 */
	timelineAnimate = function(elem) {
		return $(".timeline.animated li").each(function(i) {
			var bottom_of_object, bottom_of_window;
			bottom_of_object = $(this).position().top + $(this).outerHeight();
			bottom_of_window = $(window).scrollTop() + $(window).height();
			console.log(bottom_of_object);console.log(bottom_of_window);
			
			if (bottom_of_window > bottom_of_object) {
				return $(this).addClass("active");
			}
		});
	};
	timelineAnimate();
	$(window).scroll(function() {
		return timelineAnimate();
	});

});
