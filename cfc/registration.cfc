component registration displayname="Registration" extends="Page"{
	public function view(){
		var test = 'Hello World!';

		loadHeader('Registration');
		load('registration');
		loadFooter();
	}
}