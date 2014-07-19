/*
* We need to check if valid inputs are in the URL
* We need to check that r is in the URL
* We need to check that action is in the URL
* Compare this with what is actually in the URL
*/
component URLParser displayname="URL Parser" description="Helper class for checking the URL"{
	public function parse(required struct url = {}){
		var urlStruct = arguments.url;
		var results = {};
		var systemURL = {};
		var array1 = ArrayNew(1);
		var array2 = ArrayNew(1);
		
		systemURL['r'] = '';
		systemURL['action'] = '';

		if(not structIsEmpty(urlStruct)){
			for(key in urlStruct){
				if(structKeyExists(systemURL, key)){
					structInsert(results, key, '');
				}
			}

			//create two arrays to compare the URLS
			array1 = structKeyArray(urlStruct);
			array2 = structKeyArray(results);

			for(i = 1; i <= arrayLen(array2); i++){
				if(not arrayContains(array1, array2[i])){
					break;
				} 
			}

			if(i eq 3){
				// url contains the correct paramters
				return true;
			}

			//invalid request
			return false;
		} else {
			return 'empty';
		}
	}
}