header_tmpl = "
<html>
<head>
<title>{{title}}</title>
</head>
<body>
"
footer_tmpl = "
</body>
</html>
" 

index_tmpl = "$header_tmpl
<h1>{{title}}</h1>
<table>
<tr><th>name</th><th>summary</th></tr>
{{#d}}
<tr><td>{{title}}</td><td>{{summary}}</td></tr>
{{/d}}
</table>
$footer_tmpl"

post_tmpl = "$header_tmpl
<h1>{{title}}</h1>
<p>{{date}}</p>
<p><i>{{summary}}</i></p>
{{content}}
$footer_tmpl"

