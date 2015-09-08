component registration displayname="Registration" extends="cfc.application.Page"{
	
	property model;

	public function view(){
		this.model = loadModel('registrationModel');

		loadHeader('Registration');
		load('registration');
		load('registration', '_form');
		loadFooter();

		if(structKeyExists(form, "registration-form"))
			getForm(form);
	}

	public function getForm(struct registrationForm){
		/* Process form with the model */
		this.model.findd(form);
		// this.model.removeRecord();
		// this.model.insertRow(arguments.registrationForm);
		// this.model.updateRecord();
	}
}