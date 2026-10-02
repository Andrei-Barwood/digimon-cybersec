require 'sinatra/base'
require 'kramdown'
require 'json'
require 'prawn'

module PiAppleWeb
  class App < Sinatra::Base
    set :public_folder, File.expand_path('public', __dir__)
    set :views, File.expand_path('views', __dir__)
    set :port, 9200

    get '/' do
      @episodes = (1..54).map { |i| i.to_s }
      erb :dashboard
    end

    post '/run/:episode' do
      ep = params[:episode].to_s.rjust(2, '0')
      file = File.expand_path("../../test/episodios/ep#{ep}_test.rb", __dir__)
      
      if File.exist?(file)
        # Add -v to make minitest verbose
        output = `ruby #{file} -v 2>&1`
        exit_code = $?.exitstatus
      else
        output = "File not found: #{file}"
        exit_code = 1
      end
      
      content_type :json
      { episode: ep, output: output, exit_code: exit_code }.to_json
    end

    get '/prompt/:episode' do
      ep = params[:episode].to_s.rjust(2, '0')
      file_path = File.expand_path("../../prompts/ep#{ep}_prompt.md", __dir__)
      
      if File.exist?(file_path)
        content = File.read(file_path)
        html = Kramdown::Document.new(content).to_html
      else
        html = "<h2>Prompt not found for episode #{ep}</h2>"
      end

      content_type :json
      { html: html }.to_json
    end

    get '/pdf/:episode' do
      ep = params[:episode].to_s.rjust(2, '0')
      file_path = File.expand_path("../../prompts/ep#{ep}_prompt.md", __dir__)
      
      if File.exist?(file_path)
        content = File.read(file_path)
        
        pdf = Prawn::Document.new
        pdf.font("Courier")
        pdf.text "REPORTE DE INCIDENTE - EPISODIO #{ep}\n\n", size: 16, style: :bold
        pdf.text content
        
        content_type 'application/pdf'
        attachment "Reporte_Digimon_Ep#{ep}.pdf"
        pdf.render
      else
        status 404
        "Not found"
      end
    end
  end
end
