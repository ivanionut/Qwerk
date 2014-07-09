<cfcomponent name="ClassFinder" displayname="Directory" output="false">
	<cffunction name="checkClassExists" access="public" hint="Check if a CFC exists">
		<cfargument name="class" type="string" required="yes">

		<cfset var className = arguments.class & ".cfc" />
		<cfset classesArray = ArrayNew(1) />
		<cfset var path = getDirectoryFromPath(getCurrentTemplatePath()) />
		<cfset var object = '' />

		<cfif isDefined("className") && len(className)>
			<cfdirectory
				directory="#path#"
				action="list"
				name="getClass"
				recurse="yes"
				type="file"/>

			<cfif getClass.recordCount gt 0>
				<cfloop query="getClass">
					<cfset arrayAppend(classesArray, name) />
				</cfloop>

				<cfif not arrayIsEmpty(classesArray) && ArrayContains(classesArray, className)>
					<cfset object = createObject("component", arguments.class) />
					<cfreturn object />
				</cfif>
				<cfreturn object />
			</cfif>
		</cfif>

		<cfreturn false />
	</cffunction>
</cfcomponent>