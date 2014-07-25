/*
* BASE CONTROLLER
*/
component Page hint="Base Page Controller" extends="QwerkActions" implements="QwerkFramework"{
	/**
	* @hint "This method reads the URL and identifies which controller and action to use"
	*/
	public Any function get(){
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
					show404();
					return false;
				}
			} else {
				show404();
				return false;
			}
		} else{
			show404();
			return false;
		}
	}

	public void function loadDefaultView(){
		loadHeader('Home');
		load('default_home');
		loadFooter();
	}

	public  function load(required string viewFolder="index", string view="index", array partial = [], data = {}){
		if(viewFolder neq 'index'){
			if(FileExists('#application.path#/views/#viewFolder#/#view#.cfm')){
				include '/views/#viewFolder#/#view#.cfm';
				
				if(arrayLen(partial) neq 0){
					// begin looping through each partial view
					for(var i = 1; i <= arrayLen(partial); i++){
						try{
							include '/views/#viewFolder#/#partial[i]#.cfm';
						} catch (Any e){
							WriteDump(e);
							exit;
						}
						
					}
				}

				if(isDefined("data")){
					return { 
						'data' = data 
					}; 
				}
			} else{
				return 'view not found';
			}
		} else {
			// return default view
			include '/views/#viewFolder#/#view#.cfm';
			if(isDefined("data")){
				return { 
					'data' = data 
				}; 
			}
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