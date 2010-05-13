# Shroud

A ruby wrapper for [Cloud.app's](http://getcloudapp.com/) [REST API](http://support.getcloudapp.com/faqs/developers/api).

__NB__: If you try to upload an item and wonder why it doesn't work, it's because it doesn't work *yet*. I am working on it.


- - -

## Example
  
    require 'shroud'
    
    Shroud.get_item('a') #=> returns a hash of info on http://cl.ly/a
    
    # For every other thing you need to log in
    
    c = Shroud::Session.new('my_email', 'my_password')
    
    c.list_items(:type => 'image') #=> return a list of my recent images
    
    b = c.create_bookmark('http://getcloudapp.com/', 'CloudApp') #=> Shorten url
    
    c.delete_item(b['slug']) #=> Delete the bookmark you just created
    
    # not working atm
    c.upload_file('list.txt') #=> uploads 'list.txt'


- - - 

## Command Line

You can use the `shroud` executable to interact with the REST API from the command line. Type `shroud -h` to see the list of commands. To add your login details you need to edit your `~/.bashrc` and add:

    export SHROUD_USER="yourusername"
    export SHROUD_PASS="yourpassword"

- - -

## License

__MIT LICENSE__

Copyright (c) 2010 Joshua Hawxwell

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.