component SingletonFactory{

	property config;
	property singleton;

	/**
	* @hint "Constructor"
	*/
	public function init(required struct config){
		this.config = config;

		createSingleton();
		return this;
	}

	public function addSingleton(required name, required object){
		this.singleton[name] = object;
	}

	public function createSingleton(){
		var local = {};

		// instantiate QDB
		local.qdb = createObject('component', 'QDB');

		// register the object as an available singleton
		addSingleton("QDB", local.qdb);
	}

	public function getSingleton(required name){
		return this.singleton[name];
	}
}