/**
* @hint "In a real world environment this would be a Users model"
*/
component registrationModel extends="cfc.application.Model"{
	this.qdb = request.qwerkfactory.newQDB();

	public function getTableAttributes(){
		return super.getTableAttributes(tableName());
	}

	public function findd(required struct regForm){
		var form = regForm;
		var db = this.qdb;

		db.init(true, 'qwerk_users');

		db.select('username,password');
		db.where(
			{field="username", value="#form.username#"}
		);
		
		result = db.execute().getResult();

		writeDump(getTableAttributes());
		abort;

		if(result.recordcount eq 1){
			writeDump(result)
			abort;
		}
	}

	public function insertRow(required regForm){
		var db = this.qdb;

		db.init(tableName = 'qwerk_users');

		db.insertRow(
			{cols="username,password,email", 
			values="#arguments.regForm.username#, 
				#arguments.regForm.password#,
				#arguments.regForm.email#"
			}
		);

		db.execute();
		writeOutput("completed");
	}

	public function removeRecord(){
		var db = this.qdb;		

		db.init(true, 'qwerk_users');

		db.delete(
			{column="id", value="2"}
		);

		db.execute();
		writeOutput("completed");
	}

	public function updateRecord(){
		var db = this.qdb;

		db.init(true, 'qwerk_users');

		db.update(
			{column='password', value="david123", conditionColumn="id", conditionValue="1"}
		);

		res = db.execute();
		writeDump(res);
	}

	/**
	* @hint "Table for this model"
	*/
	public string function tableName(){
		return 'qwerk_users';
	}
}