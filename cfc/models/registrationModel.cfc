/**
* @hint "In a real world environment this would be a Users model"
*/
component registrationModel extends="cfc.application.Model"{
	property query;

	public function findd(required struct regForm){
		var qdb = application.db;

		qdb.setTable('qwerk_users');
		qdb.select('username, password');
		qdb.where(
			{field="id", value="1"}
		);
		writeDump(qdb.execute());
	}
}