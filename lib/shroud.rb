require 'patron'
require 'crack'
require 'json'


# @author Joshua Hawxwell
module Shroud
  
  Version = '0.1'
  
  class ItemNotFound < StandardError; end
  class AuthorizationError < StandardError; end
  class FileNotFound < StandardError; end
  
  # @see Session#get_item
  def Shroud.get_item(item)
    Session.new('d','d').get_item(item)
  end
  
  class Session
    # @param [Username, Password]
    def initialize( username, password ) 
      @session = Patron::Session.new
      @session.base_url = "http://my.cl.ly"
      
      @session.headers['User-Agent'] = 'Ruby CloudAPI'
      @session.headers['Content-Type'] = 'application/json'
      @session.headers['Accept'] = 'application/json'
                      
      @session.username  = username
      @session.password  = password
      @session.auth_type = :digest
    end
    
    # Gets an items information
    #
    # @param [String] slug item to get
    # @return [Hash] response body
    def get_item( item )
      @session.base_url = "http://cl.ly"
      resp = @session.get( "/" + item )
  
      raise ItemNotFound if resp.status == 404
      Crack::JSON.parse(resp.body)
    end
    

    # Gets a list of items
    #
    # @param [Hash] args The options to list items
    # @option args [Integer] :page Page to start at
    # @option args [Integer] :per_page Number of items per page
    # @option args [String] :type Type of item to return
    # @option args [Boolean] :deleted Show deleted items
    # @return [Array<Hash>] list of item hashes
    def list_items( args={} )
      @session.base_url = "http://my.cl.ly"
      
      url = "/items"
      args.each do |k, v|
        # probably a nicer way to do this
        if url == "/items"
          url << "?#{k.to_s}=#{v.to_s}"
        else
          url << "&#{k.to_s}=#{v.to_s}"
        end
      end
      resp = @session.get( url )
      
      raise AuthorizationError if resp.status == 401
      Crack::JSON.parse(resp.body)
    end
    
    # Creates a bookmark
    #
    # @param [String, Name] URL, name of bookmark
    # @return [Hash] New bookmark information
    def create_bookmark( url, name='' )
      @session.base_url = "http://my.cl.ly"
      bookmark = {:item => {:name => name, :redirect_url => url} }
     
      resp = @session.post("/items", bookmark.to_json)
      
      raise ItemNotFound if resp.status == 404
      raise AuthorizationError if resp.status == 401
      Crack::JSON.parse(resp.body)
    end
    
    # Uploads an item
    #
    # @param [String] file Relative or absolute path to item to upload
    # @todo Get this to work!!!
    def upload_file( file )
      raise FileNotFound unless File.exists?(file)
      
      # get data to build POST
      @session.base_url = "http://my.cl.ly"
      post_data = @session.get("/items/new")
      
      raise AuthorizationError if post_data.status == 401
      
      r = Crack::JSON.parse(post_data.body)
      puts "", "1ST RESPONSE", r.to_yaml
      
      params = r['params']
      params['file'] = File.open(file, "r")
      
      puts '', 'PARAMS'
      params.each do |k, v|
        puts "#{k}: '#{v}'"
      end
      puts ''
      
      @session.base_url = r['url']
      @session.headers['Content-Type'] = 'multipart/form-data'
  
      resp = @session.post("", params.to_json)
      resp.body
    end
    
    # Deletes an item
    #
    # @param [String] slug item to delete
    # @return [Hash] response body
    def delete_item( item )
      to_delete = get_item( item )
      @session.base_url = "http://my.cl.ly"
      resp = @session.delete( to_delete['href'].gsub!('http://my.cl.ly', '') )
      
      raise ItemNotFound if resp.status == 404
      raise AuthorizationError if resp.status == 401
      true if resp.status == 200
    end
    
  end
end