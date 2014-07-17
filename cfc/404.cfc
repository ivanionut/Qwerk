component extends="Page" {
	public function view(){
		
		loadHeader();
		load('404');
		loadFooter();
		return true;
	}
}