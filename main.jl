using HttpServer, DataFrames, Calendar, SQLite, Mustache
require("templates.jl")

println("connecting to db")
conn = connect("blog.db")
posts = query("select * from posts",conn)
names = posts["title"]

println("about to run")
run(Server((req,res)-> begin 
  if req.resource == "/" || req.resource == ""
    return Response(render(index_tmpl,{"title"=>"Contents","d"=>posts}))
  end
  i = 0 
  for name in names
    i += 1
    if ismatch(Regex("^/$name\$"),req.resource)
      return Response(render(post_tmpl,
        {"title"=>posts["title"][i],
         "date" =>posts["creationdate"][i],
         "summary"=>posts["summary"][i],
         "content"=>posts["contents"][i]}))
    end
  end
  return Response(404)
 end),8080)
