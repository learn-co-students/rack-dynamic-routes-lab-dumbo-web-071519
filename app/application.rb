class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
            if req.path.match(/items/)
                item = req.path.split("/items/").last
                find_item_price(item, resp)
            else
                resp.write "Route not found"
                resp.status = 404
            end
        resp.finish
    end

    def find_item_price(item_name, resp)
        item_obj = Item.all.find{|item| item.name == item_name}
        if item_obj != nil
            resp.write "#{item_obj.price}"
        else
            resp.write "Item not found"
            resp.status = 400
        end
    end

end