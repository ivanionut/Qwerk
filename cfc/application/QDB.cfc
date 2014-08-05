component QDB{

	property dsn;
	property selectColumns;
	property insertColumns;
	property updateColumns;
	property table;
	property condition;
	property update;
	property insert;
	property result;
	property query;

	/**
	* @hint "Constructor"
	* @config "Config passed the database abstraction layer"
	*/
	public function init(required struct config){
		
		var set = (structKeyExists(config, "dsn")) ? setDatasource(config.dsn) : 0;

		// return (set) ? true : false;
	}

	/**
	* @hint "Sets the datasource for the application"
	* @datasource "This is the datasource saved in CFIDE"
	*/
	public function setDatasource(required datasource){
		this.dsn = datasource;

		return true;
	}

	/**
	* @hint "Gets the datasource for the application"
	*/
	public function getDatasource(){
		return (this.dsn) ? this.dsn : false;
	}

	/**
	* @hint "Performs a select on the database"
	* @columnsSelect "The columns you wish to displ;ay data in the query"
	*/
	public function select(required columnsSelect){
		this.selectColumns = columnsSelect;
	}
	
	public function setTable(required string tableName){
		this.table = tableName;
	}

	public function where(struct cols){
		this.condition = cols;
	}

	/**
	* @hint "This builds the query before execution"
	*/
	public function execute(){
		var viewLine = (structKeyExists(this, "selectColumns")) ? this.selectColumns : '';
		var tableLine = (structKeyExists(this, "table")) ? this.table : '';
		var conditionLine = (structKeyExists(this, "condition")) ? this.condition : '';
		var query = '';

		if(viewLine neq ''){
			this.query = new Query();

			/* Create the select part of the query */
			query="
				SELECT #viewLine#
				FROM #this.table#
			";

			/* Create the condition part of the query if it's been specified*/
			if(not structIsEmpty(conditionLine)){
				query = query & "
					WHERE #conditionLine.field# = #conditionLine.value#
				";
			}

			this.query.setDatasource(this.dsn);
			this.result = this.query.execute(sql = query);

			return this.result;
		}

		return false;		
	}

	public function getResult(){
		return this.result;
	}

	/**
	* @hint "Insert to Database"
	* @columns "The columns that will be affected"
	*/
	public function insert(required columns){
		this.insertColumns = columns;
	}

	/**
	* @hint "Update on the Database"
	* @columns "The columns that will be affected"
	*/
	public function update(required columns){
		this.updateColumns = columns;
	}
}