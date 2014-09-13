component Model hint="This is the base model class" extends="QwerkActions" implements="QwerkFramework" {
	this.result = '';
	this.table = '';
	this.model = '';
	this.qdb = '';
	this.tableColumns = '';

	/**
	* @hint "Constructor"
	*/
	public function init(required itemName){
		setModel(itemName);
		return this.model;
	}

	/**
	* @hint "gets the table schema for a particular model"
	* @table "The table name to get the schema for"
	*/
	public function getTableAttributes(required string table){
 		var columns = {};
		var result = '';
		var type = '';
		var length = '';
		var key = '';
		var field = '';
		var allowNull = '';

 		this.table = arguments.table;

		this.qdb = request.qwerkfactory.newQDB();
		this.qdb.init(tableName = this.table);
		this.qdb.getTableAttributes();
		this.result = this.qdb.execute().getResult();

		for(i = 1; i LT this.result.recordcount; i++){
			result = this.result;

			type = ReReplaceNoCase(result['type'][i], '[0-9()]', '', 'all');
			length = ReReplaceNoCase(result['type'][i], '[a-z()]', '', 'all');
			key = (len(result['key'][i])) ? result['key'][i] : false;
			field = result['field'][i];
			allowNull = result['null'][i];

			columns["#field#"] = {};
			columns["#field#"].type = "#type#";
			columns["#field#"].length = "#length#";
			columns["#field#"].key = "#key#";
			columns["#field#"].null = "#allowNull#";
		}

		this.tableColumns = columns;
		return this.tableColumns;
	}

	/**
	* @description "This method checks the requested model exists and returns an instance of it"
	*/
	public function get(){
		var directory = createObject('component', 'cfc.application.ClassFinder');

		if(not structKeyExists(this, "model"))
			return false;

		this.model = directory.checkClassExists(this.model, 'cfc.models');
		return (isObject(this.model)) ? this.model : false;
	}

	/**
	* @hint "This is a setter"
	*/
	public function setTable(required string tableName){
		this.table = tableName;
	}

	/**
	* @hint "This is a getter"
	*/
	public function getTable(){
		return this.table;
	}

	/**
	* @hint "set the current model"
	*/
	public function setModel(required string modelName){
		this.model = arguments.modelName;
		get();
	}
}