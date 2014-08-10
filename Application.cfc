component {
	this.name = 'Qwerk';
	this.sessionManagement = true;

	public function onApplicationStart(){

		var config = {};
		config.dsn = 'qwerk';

		query = new Query();

		// get the installation path
		query.setDatasource(config.dsn);
		query.addParam(name="option", value="path", cfsqltype="cf_sql_varchar");
		result = query.execute(sql="
			SELECT * 
			FROM qwerk_options
			WHERE `option` = :option
		");


		application.url = CreateObject('component', 'cfc.application.URLParser');

		if(DirectoryExists(result.getResult().value)){
			application.path = result.getResult().value;
		} else {
			//onError('Installation path does not exist');

			/*
				THIS ERROR NEEDS TO BE HANDLED
			*/
		}

		application.singletonFactory = createObject('component', 'cfc.application.SingletonFactory').init(config);

		return true;
	}

	public function onRequestStart(){
		
		application.page = CreateObject('component', 'cfc.application.Page');
		request.qwerkfactory = createObject('component', 'QwerkFactory');

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