component QwerkActions extends="Qwerk"{

	/**
	* @hint loads the Model Base
	*/
	public function loadModel(required name){
		return getBaseModel().init(name);
	}

	public function getBaseModel(){
		return CreateObject('component', 'cfc.Model');
	}
}