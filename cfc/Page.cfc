component Page{
	public void function loadDefaultView(){
		loadHeader();
		load('default_home');
		loadFooter();
	}

	public string function load(required string view="index", struct data){
		if(view neq 'index'){
			if(FileExists('#application.path#/views/#view#/index.cfm')){
				include '../views/#view#/index.cfm';
			} else{
				return 'view not found';
			}
		} else {
			// return default view
		}
	}

	public void function loadHeader(){
		try {
			include '../views/includes/header.cfm';
			} catch (any e){
				writeDump("<b>FAILED:</b>" & e);
			}
	}

	public void function loadFooter(){
		try{
			include '../views/includes/footer.cfm';
			} catch (any e){
				writeDump("<b>FAILED:</b>" & e);
			}
	}
}