<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.css" />
	<title> MyECA <cfif title neq ''> | <cfoutput>#title#</cfoutput> </cfif> </title>
</head>
<body>
    <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/index.cfm">MyECA</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="?r=registration&action=view">Register</a></li>
          </ul>
            <form class="navbar-form navbar-right" role="form">
              <div class="form-group">
                <input type="text" placeholder="Username" class="form-control">
              </div>
              <div class="form-group">
                <input type="password" placeholder="Password" class="form-control">
              </div>
              <button type="submit" class="btn btn-success">Sign in</button>
            </form>
          </div><!--/.navbar-right -->
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->