<cfscript>
	if(structKeyExists(url, "r") && structKeyExists(url, "action")){
		view = application.page.getView();
	}
</cfscript>