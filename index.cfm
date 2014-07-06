<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css" />
	<title> MyECA </title>
</head>
<h1>Welcome to MyECA</h1>

<!--- <cfset application = createObject("component", "application") /> --->

<cfoutput>
	#application.datasource#
	<br />
	<cfdump var=#application.db#>
	<cfdump var=#application.user#>
	<br />
</cfoutput>