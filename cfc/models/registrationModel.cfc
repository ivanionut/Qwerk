/**
* @hint "In a real world environment this would be a Users model"
*/
component registrationModel extends="cfc.application.Model"{
	property query;
	property table;

	public function findd(required struct regForm){
		var qdb = request.qwerkfactory.newQDB();
		var form = regForm;

		qdb.init(applicationConfig());
		qdb.setTable('qwerk_users');
		qdb.select('username,password');
		qdb.where(
			{field="username", value="#form.username#"}
		);
		
		result = qdb.execute().getResult();

		if(result.recordcount neq 1){
			writeDump(result)
			abort;
		}

		if(structKeyExists(url, "column") && structKeyExists(url, "value")){
			removeRecord();
		}
	}

	public function insertRow(required regForm){
		var qdb = request.qwerkfactory.newQDB();
		
		qdb.init(applicationConfig());
		qdb.setTable('qwerk_users');
		qdb.insertRow(
			{cols="username,password,email", 
			values="#arguments.regForm.username#, 
				#arguments.regForm.password#,
				#arguments.regForm.email#"
			}
		);

		qdb.execute();
	}

	public function removeRecord(){
		var qdb = request.qwerkfactory.newQDB();
		
		qdb.init(applicationConfig());
		qdb.setTable('qwerk_users');

		qdb.delete(
			{column="id", value="3"}
		);

		qdb.execute();
	}
}