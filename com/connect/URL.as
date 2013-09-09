package com.connect {
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	public class URL {

		
		
		public function URL() {
			// constructor code
		}
		
		
		public function getURL(str,win)
		{
			var myLink:String=str;
			var linkRequest:URLRequest=new URLRequest(myLink);
			navigateToURL(linkRequest,win);
		}
	}
	
}
