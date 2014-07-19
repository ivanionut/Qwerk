<cfscript>
/*
* This determines what to render based on the URL
*/
	
	view = application.url.parse(url);

	switch(view){
		case true:
			application.page.getView();
			break;
		case 'empty':
			application.page.loadDefaultView();
			break;
		case false:
			application.page.show404();
			break;
	}
</cfscript>