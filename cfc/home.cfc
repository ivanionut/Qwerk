component home displayname="Home" extends="Page" {
	public function view(){
		/* display the default view for the home controller
		* by doing load()
		 */
		 loadheader();
		 load('test_view');
		 loadFooter();
	}

	public any function test(){

	}
}