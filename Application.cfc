component {
	this.name = 'MyECA';
	this.sessionManagement = true;

	public function onApplicationStart(){
		application.datasource= 'myeca';
		application.db = CreateObject('component', 'cfc.Database');
		application.user = CreateObject('component' ,'cfc.User');
		application.page = CreateObject('component', 'cfc.Page');

		return true;
	}

	public function onRequestStart(){
		include 'includes/header.cfm';
		return true;
	}

	public function onRequestEnd(){
		include 'includes/footer.cfm';
		return true;
	}

	public function onError(){
		writeOutput("ERROR!!!");
		return true;
	}
}