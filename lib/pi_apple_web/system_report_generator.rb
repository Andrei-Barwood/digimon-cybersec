require 'prawn'

module PiAppleWeb
  class SystemReportGenerator
    def self.generate
      Prawn::Fonts::AFM.hide_m17n_warning = true
      pdf = Prawn::Document.new(page_size: 'A4', margin: 40)
      
      pdf.font("Courier")
      pdf.fill_color "003300"
      pdf.text "================================================================", align: :center
      pdf.text "PI-APPLE OS :: REPORTE DE ESTADO DEL SISTEMA", align: :center, size: 14, style: :bold
      pdf.text "================================================================", align: :center
      pdf.move_down 15
      
      pdf.fill_color "000000"
      pdf.text "FECHA: #{Time.now.strftime('%Y-%m-%d %H:%M:%S')} JST"
      pdf.text "OPERADOR: Koushiro 'Izzy' Izumi"
      pdf.text "SISTEMA: Digital World Core Router"
      pdf.text "NIVEL DE AMENAZA GLOBAL: VERDE (MONITOREANDO)"
      pdf.move_down 20
      
      pdf.text "Este es un reporte de sistema detallado y verboso de las defensas actuales en el Mundo Digital, cubriendo el análisis de vulnerabilidades y los mecanismos de mitigación (tests).", size: 10
      pdf.move_down 20
      
      total_episodes = 54
      missing_tests = 0
      missing_prompts = 0
      
      (1..total_episodes).each do |i|
        ep = i.to_s.rjust(2, '0')
        prompt_path = File.expand_path("../../../prompts/ep#{ep}_prompt.md", __dir__)
        test_path = File.expand_path("../../../test/episodios/ep#{ep}_test.rb", __dir__)
        
        pdf.font("Courier", style: :bold, size: 11)
        pdf.fill_color "000066"
        pdf.text "[SECTOR EP#{ep}] - ANÁLISIS DE INCIDENTE", size: 11
        
        pdf.font("Courier", style: :normal, size: 9)
        pdf.fill_color "000000"
        
        if File.exist?(prompt_path)
          title_line = File.readlines(prompt_path).first(10).find { |l| l.start_with?('# ') }
          title = title_line ? title_line.gsub('#', '').strip : 'DESCONOCIDO'
          pdf.text "> Firma de Amenaza: #{title}"
        else
          pdf.fill_color "990000"
          pdf.text "> Firma de Amenaza: DATOS CORRUPTOS (Falta Prompt)"
          pdf.fill_color "000000"
          missing_prompts += 1
        end
        
        if File.exist?(test_path)
          test_content = File.read(test_path)
          test_lines = test_content.lines.count
          classes = test_content.scan(/class\s+(\w+)/).flatten.join(", ")
          classes = "Ninguna" if classes.empty?
          
          pdf.fill_color "006600"
          pdf.text "> Motor de Mitigación: ACTIVO"
          pdf.fill_color "000000"
          pdf.text "  - Archivo: #{File.basename(test_path)}"
          pdf.text "  - LOC (Líneas de Código): #{test_lines}"
          pdf.text "  - Clases Detectadas: #{classes}"
        else
          pdf.fill_color "990000"
          pdf.text "> Motor de Mitigación: VULNERABLE (Falta Test)"
          pdf.fill_color "000000"
          missing_tests += 1
        end
        
        pdf.move_down 10
      end
      
      pdf.start_new_page
      
      pdf.font("Courier", style: :bold, size: 14)
      pdf.fill_color "003300"
      pdf.text "RESUMEN EJECUTIVO", align: :center
      pdf.move_down 15
      
      pdf.font("Courier", style: :normal, size: 11)
      pdf.fill_color "000000"
      pdf.text "Total de Sectores Auditados: #{total_episodes}"
      pdf.text "Sectores con Firmas (Prompts) Faltantes: #{missing_prompts}"
      pdf.text "Sectores Vulnerables (Tests Faltantes): #{missing_tests}"
      pdf.move_down 20
      
      if missing_tests == 0 && missing_prompts == 0
        pdf.fill_color "006600"
        pdf.text "ESTADO: ÓPTIMO. Todas las defensas están operativas. ¡Prodigioso!", style: :bold
      else
        pdf.fill_color "990000"
        pdf.text "ESTADO: CRÍTICO. Se requiere parcheo inmediato en los sectores vulnerables.", style: :bold
      end
      
      pdf.fill_color "000000"
      pdf.move_down 30
      pdf.text "================ FIN DEL REPORTE ========================", align: :center, style: :bold
      
      pdf.render
    end
  end
end
