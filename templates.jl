header_tmpl = "
<!DOCTYPE html>
<html>
<head>
<title>{{title}}</title>
<link href=\"./bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" media=\"screen\">
<style type=\"text/css\">
  body {
    padding-top: 60px;
    padding-bottom: 40px;
  }
</style>
</head>

<body>
<div class=\"container\">
"

footer_tmpl = "
</div> 
</body>
</html>
" 

index_tmpl = "$header_tmpl
<div class=\"hero-unit\">
<h1>{{title}}</h1>
</div>
<div class=\"row\">
  <div class=\"span4\">name</div>
  <div class=\"span8\">summary</div>
</div>
{{#d}}
<div class=\"row\">
  <div class=\"span4\"><a href=\"{{url}}\">{{title}}</a></div>
  <div class=\"span8\">{{summary}}</div>
</div>
{{/d}}
$footer_tmpl"

post_tmpl = "$header_tmpl
<h1>{{title}}</h1>
<p>{{date}}</p>
<p><i>{{summary}}</i></p>
{{content}}
$footer_tmpl"

