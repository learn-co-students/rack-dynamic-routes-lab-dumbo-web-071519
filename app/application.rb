class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    puts req.path
    if req.path.match(/items/)
      item_search = req.path.split("/items/")
      search_result = Item.item_price_by_name(item_search.last)
      if search_result
        resp.write "#{search_result}"
      else 
        resp.write "Item not found"
        resp.status = 400
      end
    else 
        resp.status = 404
        resp.write "Route not found"
    end
    resp.finish
  end

end