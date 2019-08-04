class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      exist?(item_name, resp)
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

  def exist?(item_name, resp)
    if Item.all_names.include?(item_name)
      info = Item.all.find {|item| item.name == item_name}
      resp.write "#{info.price}"
    else
      resp.write "Item not found"
      resp.status = 400
    end
  end

end
