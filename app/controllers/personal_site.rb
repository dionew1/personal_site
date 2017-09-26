require 'rack'

class PersonalSite
  def self.call(env)
    case env["PATH_INFO"]
    when '/' then index
    when '/blog' then blog
    when '/main.css' then css
    else
      error
    end
  end

  def self.file_exists_in_public?(PATH_INFO)
    if PATH_INFO ==

  def self.index
    render_view('index.html')
  end

  def self.blog
    render_view('blog.html')
  end

  def self.error
    render_view('error.html', 404)
  end

  def self.render_view(page, code = '200')
    [code, {'Content-Type' => 'text/html'}, [File.read("./app/views/#{page}")]]
    #Array includes HTTP response status code, HTTP response headers, and HTTP body
  end

  def self.css
    render_static('main.css')
  end

  def self.render_static(asset)
    [200, {'Countent-Type' => 'text/html'}, [File.read("./public/#{asset}")]]
  end
end
