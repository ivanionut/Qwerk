component {
	this.name = 'Qwerk';
	this.sessionManagement = true;

	public function onApplicationStart(){
		query = new Query();
		application.datasource= 'myeca';

		// get the installation path
		query.setDatasource(application.datasource);
		query.addParam(name="option", value="path", cfsqltype="cf_sql_varchar");
		result = query.execute(sql="
			SELECT * FROM myeca_options
			WHERE `option` = :option
		");

		if(DirectoryExists(result.getResult().value)){
			application.path = result.getResult().value;
		} else {
			onError('Installation path does not exist');
		}
		
		return true;
	}

	public function onRequestStart(){

		application.user = CreateObject('component' ,'cfc.User');
		application.page = CreateObject('component', 'cfc.Page');
		application.url = CreateObject('component', 'cfc.URLParser');
		
/* 		writeDump(application.model.init('homeModel'));
		abort; */
		return true;
	}

	public function onRequestEnd(){
		return true;
	}

	public function onSessionStart(){
		
	}

/* 	public function onError(required string message="Unknown error"){
		writeOutput('<b>Failed:</b>' & message);
		return true;
	} */
}