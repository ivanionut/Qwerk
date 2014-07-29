component Model hint="This is the base model class" extends="QwerkActions" implements="QwerkFramework" {
	property string query;
	property string table;
	property string model;

	/**
	* @hint "Constructor"
	*/
	public function init(required itemName){
		setTable(itemName);

		return get();
	}

	/**
	* @description "This method checks the requested model exists and returns an instance of it"
	*/
	public function get(){
		var directory = createObject('component', 'cfc.application.ClassFinder');
		this.model = directory.checkClassExists(getTable(), 'cfc.models');

		return (isObject(this.model)) ? this.model : false;
	}

	/**
	* @hint "This is a setter"
	*/
	public function setTable(required string tableName){
		table = tableName;
	}

	/**
	* @hint "This is a getter"
	*/
	public function getTable(){
		return table;
	}

	/**
	* @hint "returns the current model"
	*/
	public function getCurrentModel(){
		return (isDefined("this.model")) ? this.model : false;
	}
}