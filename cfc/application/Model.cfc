component Model hint="This is the base model class" extends="QwerkActions" implements="QwerkFramework" {
	property query;
	property table;
	property tableColumns;
	property columnTypes;
	property model;

	/**
	* @hint "Constructor"
	*/
	public function init(required itemName){
		setModel(itemName);
		return getCurrentModel();
	}

	/**
	* @description "This method checks the requested model exists and returns an instance of it"
	*/
	public function get(){
		var directory = createObject('component', 'cfc.application.ClassFinder');
		this.model = directory.checkClassExists(this.model, 'cfc.models');

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

	public function setModel(required string modelName){
		this.model = arguments.modelName;
	}

	/**
	* @hint "returns the current model"
	*/
	public function getCurrentModel(){
		return (structKeyExists(this, "model")) ? get() : false;
	}
}