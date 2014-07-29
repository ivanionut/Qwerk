component registration displayname="Registration" extends="cfc.application.Page"{
	
	property model;

	public function view(){
		var test = 'Hello World!';
		this.model = loadModel('registrationModel');

		loadHeader('Registration');
		load('registration');
		loadFooter();

		if(structKeyExists(form, "registration-form"))
			getForm();
	}

	public function getForm(){
		/* Process form with the model */
		this.model.findd(form);
	}
}