component Contact extends="cfc.application.Page"{

	this.form = FormController();
	this.model = loadModel('registrationModel');

	public function view(){
		var form = this.form;

		loadHeader('Contact Qwerk');
		load('contact');
		load(viewFolder='contact', view='_form', data=form);
		loadFooter();
		// writeDump(form);
	}
}