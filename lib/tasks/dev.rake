namespace :dev do
  desc "Configura o ambiente base de desenvolvimento"
  task base: :environment do
    if Rails.env.development?
     spinner("Apagando BD...") { %x(rails db:drop) }
     spinner("Criando BD...") { %x(rails db:create) }
     spinner("Migrando BD...") { %x(rails db:migrate) }
     %x(rails dev:add_brands)
     %x(rails dev:add_pods) 
    else
      puts "Você não está em ambiente de desenvolvimento!!!"
    end
  end

desc "Cadastra os pods"
task add_pods: :environment do
  spinner("Cadastrando Pods...") do
      pods =  [  
                { 
                  flavor: "Green Apple",
                  brand: Brand.find_by(description: 'Ignite'),                
                  description: "Ainda não experimentei"
                },
                { 
                  flavor: "Watermelon",
                  brand: Brand.find_by(description: 'Lost Mary'),
                  description: "Gosto de que lembra muito o chiclete trident, porém um pouco doce e pdoeria ter algo um pouco mais refrescante",
                },
                { 
                  flavor: "Grape",
                  brand: Brand.find_by(description: 'Lost Mary'),
                  description: "Gosto muito intenso de uva, porém um pouco doce e pdoeria ter algo um pouco mais refrescante"
                },
                { 
                  flavor: "Peach Juice",
                  brand: Brand.find_by(description: 'Lost Mary'),
                  description: "Gosto extremamente forte de pessêgo, porém muito doce"
                },
                { 
                  flavor: "Blue Razz Ice",
                  brand: Brand.find_by(description: 'Lost Mary'),
                  description: "Extremamente doce"                 
                }
              ] 


      pods.each do |pod|
       Pod.find_or_create_by!(pod)
      end
    end
  end

  desc "Cadastra as marcas"
  task add_brands: :environment do
    spinner("Cadastrando marcas...") do
      brands =  [ 
        {description: "Lost Mary"},
        {description: "Elfbar"},
        {description: "ElfWorld"},
        {description: "Ignite"},
        {description: "Vapesoul"}
      ]

      brands.each do |brand|
        Brand.find_or_create_by!(brand)
      end
    end
  end



    private

   def spinner(start, msg_end = "Concluído!")
      spinner = TTY::Spinner.new("[:spinner] #{start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end
end