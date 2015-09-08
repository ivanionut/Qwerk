<cfoutput>
	<div class="container">
		#data.beginForm('contact-us-form', 'post', 'off')#
		
		<div class="row">
			#data.label(this.model, 'Username')#
			#data.textField('Username')#
		</div>

		<div class="row">
			#data.label(this.model, 'Password')#
			#data.passwordField('password')#
		</div>

		<div class="row">
			#data.label(this.model, 'Your query')#
			#data.textArea('query', 20, 40)#
		</div>

		#data.endForm()#
	</div>
</cfoutput>