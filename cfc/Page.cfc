component Page{
	public function getView(){
		var view = '';
		var action = '';
		var directory = createObject("component", "ClassFinder");
		var controller = '';
		var methodList = '';

		writeDump(url);

		if(isDefined("url") && structCount(url) gt 0 && structKeyExists(url, "r") && structKeyExists(url, "action")){
			view = url.r;
			action = url.action;

			/* 
			* check if .cfc exists 
			*/
			if(isObject(directory.checkClassExists(view))){

				controller = directory.checkClassExists(view);

				if(structKeyExists(controller, action)){
					methodList = getMetaData(controller);

					for(i = 1; i lte arrayLen(methodList.functions); i++){
						//call method
						if(action eq 'view'){
							controller.view();
						}
					}
				} else {
					return 'Action is not defined in controller';
				}
			} else {
				return 'Controller not found';
			}

			//check if the action exists in the .cfc
		} 
	}

	public void function loadDefaultView(){
		loadHeader();
		load('default_home');
		loadFooter();

		// return true;
	}

	public string function load(required string view="index", struct data = {}){
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