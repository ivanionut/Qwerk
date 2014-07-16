<cfscript>
	try{
		view = application.page.getView();
		} catch (Any e){
			writeDump(e);
		}
</cfscript>