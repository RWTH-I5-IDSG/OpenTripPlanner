/**
 * Max Wiederhold 
 * Feb 19th 2014
 */

otp.namespace("otp.core");

otp.core.BikeSharing = otp.Class({

    webapp          : null,
    
    stations		: null,
    
    initialize : function(webapp) {
    	this.webapp = webapp;
    },
    
   loadBikeStations : function(callbackTarget, callback) {
	   	var url = otp.config.hostname + '/' + otp.config.restService + '/ws/bike_rental';
    	$.ajax(url, {
    		dataType: 'jsonp',
    		
    		data: {
    			extended: 'true',
    		},
    		
    		success: function(data) {
    			callback.call(callbackTarget, data);
    		}
    	});
   }
    
    
});
//