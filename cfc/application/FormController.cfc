/**
* @description "Builds a new form for a controller and outputs to a view"
*/
component FormController extends="cfc.application.Page"{
	this.form = {};	

	public function init(){

	}

	public function setForm(required string name, required string method){
		this.form['name'] = arguments.name;
		this.form['method'] = arguments.method;
	}

	public function getFormName(){
		return (structKeyExists(this.form, 'name')) ? this.form.name : '';
	}

	public function getFormMethod(){
		return (structKeyExists(this.form, 'method')) ? this.form.method : '';
	}

	public function beginForm(required string name, required string method, string autoComp='on'){

		setForm(arguments.name, arguments.method);

		return "
			<form name='#getFormName()#' id='#getFormName()#' method='#getFormMethod()#' autocomplete='#arguments.autoComp#'>
		";
	}	

	public function endForm(){
		return "
			</form>
		";
	}

	public function textField(required string fieldName, string placeholder=''){
		var name = lcase(arguments.fieldName);

		return "
			<input type='text' id='#name#' name=#name# placeholder='#arguments.placeholder#' />
		";
	}

	public function label(required modelObj, required string labelName){
		var label = arguments.labelName;

		return "
			<label for='#lcase(label)#'>#label#</label>
		";
	}

	public function passwordField(required string fieldName){
		var name = lcase(arguments.fieldName);

		return "
			<input type='password' id='#name#' name='#name#' />
		";
	}

	public function submitButton(required string fieldName, string value = 'Submit'){
		var name = lcase(arguments.fieldName);

		return "
			<input type='submit' id='#name#' name='#name#' value='#arguments.value#' />
		";
	}

	public function textArea(required string fieldName, required numeric rows, required numeric columns){
		var name = lcase(arguments.fieldName);

		return "
			<textarea name='#name#' id='#name#' rows=#arguments.rows# cols=#arguments.columns#>

			</textarea>
		";
	}
}