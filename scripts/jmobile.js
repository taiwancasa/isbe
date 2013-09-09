// JavaScript Document
(function(){
 
 var device = '', _ipad = 'ipad', _iphone = 'iphone', ua = navigator.userAgent.toLowerCase();
// console.info(device+","+ua)
 if( ua.indexOf(_ipad) != -1 )
 {
     device = 'ios tablet ' + _ipad;
	 window.location.href="m1.html";
 }
 else if( ua.indexOf(_iphone) != -1 )
{
     device = 'ios mobile ' + _iphone;
	  window.location.href="m1.html";
}
 else if( ua.match(/android/) )
 {
     device = 'android';
     if(ua.indexOf('mobile')==-1)
	 {
         device += ' tablet';
		  window.location.href="m1.html";
	 }
     else
 		{
         device += ' mobile';
		  window.location.href="m1.html";
		}
 }
 if(device)
 {
     device = 'touch ' + device;
     document.documentElement.className += ' ' + device;
 }
 window._device = device;
}
)();