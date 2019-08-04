class Application

    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            request = req.path.split("/items/").last
            if requested_item = @@items.find {|i| i.name == request}
                resp.write requested_item.price
            else resp.status = 400
                resp.write "Item not found"
            end
        else 
            resp.status = 404
            resp.write "Route not found"
        end

        resp.finish
    end

end