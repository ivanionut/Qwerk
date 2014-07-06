<h1>Welcome to MyECA</h1>

<!--- <cfset application = createObject("component", "application") /> --->

<cfoutput>
	#application.datasource#
	<br />
	<cfdump var=#application.db#>
	<cfdump var=#application.user#>
	<br />
</cfoutput>