using HttpServer, DataFrames, Calendar, SQLite, Mustache, HttpCommon
require("templates.jl")

println("connecting to db")
conn = connect("blog.db")
posts = query("select * from posts",conn)
posts["url"] = map(encodeURI,posts["title"])

function myhandler(req,res)
  # Index Page
  if req.resource == "/" || req.resource == ""
    return Response(render(index_tmpl,{"title"=>"Contents","d"=>posts}))
  end
  # Bootstrap css/js files
  if ismatch(r"^/bootstrap/",req.resource)
    f = open(".$(req.resource)")
    h = HttpCommon.headers() #need to set headers correctly
    if ismatch(r".css$",req.resource)
      h["Content-Type"] = "text/css; charset=utf-8"
    elseif ismatch(r".css$",req.resource)
      h["Content-Type"] = "text/js; charset=utf-8"
    end
    return Response(readall(f),h)
  end
  # Posts
  i = 0 
  for name in posts["url"]
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
end

println("about to run")
run(Server(myhandler),8080)
