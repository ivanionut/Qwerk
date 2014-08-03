/**
* @hint "In a real world environment this would be a Users model"
*/
component registrationModel extends="cfc.application.Model"{
	property query;

	public function findd(required struct regForm){
		var qdb = application.db;

		qdb.setTable('qwerk_users');
		qdb.select('username, password');
		writeDump(qdb.execute());
	}
}