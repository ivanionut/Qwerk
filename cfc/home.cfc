component home displayname="Home" extends="Page" {
	public function view(){
		/* display the default view for the home controller
		* by doing load()
		 */
		 var date = now();
		 var views = arrayNew(1);

		 var model = loadModel('homeModel');

		 arrayAppend(views, '_partial');
		 arrayAppend(views, '_partial1');
		 arrayAppend(views, '_partial2');

		 loadheader('Home');
		 load('test_view'
		 	, 'index'
		 	, views
		 	, date);
		 loadFooter();
	}

	public any function test(){

	}
}