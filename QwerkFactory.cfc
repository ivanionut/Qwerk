component QwerkFactory{

	/**
	* @hint "Creates an object based on a path that gets passed to the method"
	*/
	public function create(required string path){
		return createObject('component', '#path#');
	}

	/**
	* @hint "Returns a new QDB object to the user"
	*/
	public function newQDB(){
		return createObject('component', 'cfc.application.QDB');
	}
}