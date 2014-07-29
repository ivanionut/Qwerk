component registrationModel extends="cfc.application.Model"{
	property query;

	public function findd(required struct regForm){
		var qdb = application.db;
		var cols = ['username', 'password'];

		writeDump(qdb);
		abort;

		qdb.select(cols);
	}
}