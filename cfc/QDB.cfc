component QDB{
	public function init(required struct config){
		
		return (structKeyExists(config, "dsn")) ? setDatasource(config.dsn) : false;
	}

	public function setDatasource(){

	}

	public function getDatasource(){

	}
}