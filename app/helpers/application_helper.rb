module ApplicationHelper
    
  
    def ambiente_rails
      if Rails.env.delopment?
        "Desenvolvimento"
      elsif Rais.env.production?
        "Produção"
      else
        "Teste"
      end
    end
end
