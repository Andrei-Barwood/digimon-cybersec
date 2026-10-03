require 'sinatra/base'
require 'kramdown'
require 'json'
require 'prawn'
require_relative 'system_report_generator'

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
        raw_output = `ruby -I lib #{file} -v 2>&1`
        exit_code = $?.exitstatus

        # Leer firma de amenaza del prompt
        prompt_file = File.expand_path("../../prompts/ep#{ep}_prompt.md", __dir__)
        threat_signature = "DESCONOCIDA"
        if File.exist?(prompt_file)
          title_line = File.readlines(prompt_file).first(10).find { |l| l.start_with?('# ') }
          threat_signature = title_line.gsub('#', '').strip if title_line
        end

        timestamp = Time.now.strftime('%Y-%m-%d %H:%M:%S JST')
        header = <<~TXT
          ========================================================================
          [PI-APPLE OS v9.9] INICIANDO PROTOCOLO DE AUDITORÍA Y MITIGACIÓN
          ========================================================================
          > FECHA DEL SISTEMA: #{timestamp}
          > OPERADOR: Koushiro "Izzy" Izumi
          > OBJETIVO DE ESCANEO: SECTOR EP#{ep} (Mundo Digital)
          > FIRMA DE AMENAZA IDENTIFICADA: #{threat_signature}
          > CARGANDO VECTORES DE ATAQUE... OK
          > INICIALIZANDO MOTORES DE MITIGACIÓN (Digivice Sync)... OK
          > ESTADO DE RED: INTERCEPTANDO TRÁFICO ANÓMALO...
          
          ------------------------------------------------------------------------
          [INICIO DE VOLCADO DE LOGS DEL MOTOR DE PRUEBAS MINITEST]
          ------------------------------------------------------------------------

        TXT

        footer = <<~TXT

          ------------------------------------------------------------------------
          [FIN DE VOLCADO DE LOGS]
          ------------------------------------------------------------------------
          > ANALIZANDO RESULTADOS DE LA MITIGACIÓN...
          > CÓDIGO DE SALIDA DEL PROCESO: #{exit_code}
          #{exit_code == 0 ? '> ESTADO: [ÉXITO] AMENAZA MITIGADA. LOS NODOS ESTÁN SEGUROS.' : '> ESTADO: [FALLO CRÍTICO] LA AMENAZA SIGUE ACTIVA. SE REQUIERE INTERVENCIÓN.'}
          ========================================================================
          [PI-APPLE OS] REPORTE DE SISTEMA FINALIZADO.
          ========================================================================
        TXT

        output = header + raw_output + footer
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

    get '/system_report' do
      pdf_data = PiAppleWeb::SystemReportGenerator.generate
      content_type 'application/pdf'
      attachment "Reporte_Sistema_Global.pdf"
      pdf_data
    end
  end
end
