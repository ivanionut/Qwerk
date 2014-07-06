component {
	// this.name = 'MyECA';
	this.datasource = 'myeca';
	this.sessionManagement = true;

	public function onApplicationStart(){
		application.datasource= 'myeca';
		application.db = CreateObject('component', 'cfc.Database');
		application.user = CreateObject('component' ,'cfc.User');

		return true;
	}
}