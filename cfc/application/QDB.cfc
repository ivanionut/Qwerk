component QDB{

	property dsn;
	property selectColumns;
	property table;
	property condition;
	property result;
	property query;

	public function init(required struct config){
		
		var set = (structKeyExists(config, "dsn")) ? setDatasource(config.dsn) : 0;

		// return (set) ? true : false;
	}

	public function setDatasource(required datasource){
		this.dsn = datasource;

		return true;
	}

	public function getDatasource(){
		return (this.dsn) ? this.dsn : false;
	}

	public function select(required columnsSelect){
		this.selectColumns = columnsSelect;
	}

	public function setTable(required string tableName){
		this.table = tableName;
	}

	public function where(array cols){

	}

	/**
	* @hint "This builds the query before execution"
	*/
	public function execute(){
		var viewLine = (listLen(this.selectColumns)) ? this.selectColumns : '';
		var tableLine = (len(this.table)) ? this.table : '';
		var sql = '';

		if(viewLine neq ''){
			this.query = new Query();

			this.query.setDatasource(this.dsn);
			this.result = this.query.execute(sql="
				SELECT #viewLine#
				FROM #this.table#
			");
		}
		return this.result;
	}

	public function getResult(){
		return this.result;
	}

	public function insert(){
		
	}
}