component QDB{

	property dsn;
	property selectColumns;
	property insertColumns;
	property updateColumns;
	property table;
	property condition;
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

	/**
	* @hint "This will build the select query"
	* @whereClause "This is optional in a query"
	*/
	public function buildSelect(){
		var query = '';

		query = "
			SELECT #listQualify(this.selectColumns, '`')#
			FROM #this.table#
		";

		if(structKeyExists(this, "condition")){
			query = query & "
				WHERE #this.condition.field# = #this.condition.value#
			";
		}

		return query;
	}
	
	public function setTable(required string tableName){
		this.table = tableName;
	}

	public function where(struct cols){
		this.condition = cols;
	}

	public function insert(required columnsInsert){
		this.insert = columnsInsert;
	}

	public function buildInsert(){
		var query = '';

		query = "
			INSERT INTO #this.table# (#this.insertColumns#)
			VALUES ()
		";

		abort;
		return query;
	}

	/**
	* @hint "This builds the query before execution"
	*/
	public function execute(){
		var query = '';

		if(structKeyExists(this, "selectColumns")){

			query = buildSelect();

		} else if(structKeyExists(this, "insertColumns")){

			query = buildInsert();

		}
		
		if(len(query)){
			this.query = new Query();

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
	* @hint "Update on the Database"
	* @columns "The columns that will be affected"
	*/
	public function update(required columns){
		this.updateColumns = columns;
	}
}