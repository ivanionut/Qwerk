/*
* BASE CONTROLLER
*/
component Page{
	/*
	* This method reads the URL and identifies which controller and action to use
	*/
	public Any function getView(){
		var view = '';
		var action = '';
		var directory = createObject("component", "ClassFinder");
		var controller = '';
		var methodList = '';

		if(isDefined("url") && structCount(url) gt 0 && structKeyExists(url, "r") && structKeyExists(url, "action")){
			view = url.r;
			action = url.action;

			if(isObject(directory.checkClassExists(view))){

				controller = directory.checkClassExists(view);

				if(structKeyExists(controller, action)){
					methodList = getMetaData(controller);

					for(i = 1; i lte arrayLen(methodList.functions); i++){
						viewName = methodList.functions;
						if(viewName[i].name eq url.action){
							//call the view
							controller.method = controller[url.action];
							controller.method();
						}
					}
				} else {
					return 'Action is not defined in controller';
				}
			} else {
				show404();
			}
		} else{
			show404();
		}
	}

	public void function loadDefaultView(){
		loadHeader();
		load('default_home');
		loadFooter();
	}

	public  function load(required string view="index", data = {}){
		if(view neq 'index'){
			if(FileExists('#application.path#/views/#view#/index.cfm')){
				include '/views/#view#/index.cfm';
				
				if(isDefined("data")){
					return { 'data' = data }; 
				}

				return true;
			} else{
				return 'view not found';
			}
		} else {
			// return default view
		}
	}

	public function loadHeader(title = ''){
		try {
			include '/views/includes/header.cfm';

			if(title neq ''){
				return{ 'title' = title};
			}
		} catch (any e){
			writeDump("<b>FAILED:</b>" & e);
		}
	}

	public void function loadFooter(){
		try{
			include '/views/includes/footer.cfm';
		} catch (any e){
			writeDump("<b>FAILED:</b>" & e);
		}
	}

	public function show404(){
		// call the 404 controller
		var controller = createObject("component", "404").view();
		return true;
	}
}