namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Vitor",
                 :email => "vitor023@gmail.com",
                 :password => "123456",
                 :password_confirmation => "123456")
    admin.toggle!(:admin)

    admin = User.create!(:name => "Leonardo",
                 :email => "leo.berbare@gmail.com",
                 :password => "pokemon123",
                 :password_confirmation => "pokemon123")
    admin.toggle!(:admin)

    admin = User.create!(:name => "Peterson",
                 :email => "petersonmk@gmail.com",
                 :password => "peterson",
                 :password_confirmation => "peterson")
    admin.toggle!(:admin)

    admin = User.create!(:name => "Nathalia",
                 :email => "nmoliveira@usp.br",
                 :password => "nathalia",
                 :password_confirmation => "nathalia")
    admin.toggle!(:admin)

    96.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end

    Subject.create!(:code => "MAT2453", :name => "Calculo Diferencial e Integral para Engenharia I", :description => "Materia cujo objetivo eh ensinar calculo diferencial e integral aos alunos...")
    Subject.create!(:code => "MAT2454", :name => "Calculo Diferencial e Integral para Engenharia II", :description => "Materia cujo objetivo eh ensinar calculo diferencial e integral aos alunos...")
    Subject.create!(:code => "MAT2455", :name => "Calculo Diferencial e Integral para Engenharia III", :description => "Materia cujo objetivo eh ensinar calculo diferencial e integral aos alunos...")
    Subject.create!(:code => "MAT2456", :name => "Calculo Diferencial e Integral para Engenharia IV", :description => "Materia cujo objetivo eh ensinar calculo diferencial e integral aos alunos...")
    Subject.create!(:code => "MAT2457", :name => "Algebra Linear para Engenharia I", :description => "Materia cujo objetivo eh ensinar algebra linear aos alunos...")
    Subject.create!(:code => "MAT2458", :name => "Algebra Linear para Engenharia II", :description => "Materia cujo objetivo eh ensinar algebra linear aos alunos...")
    Subject.create!(:code => "PSI2222", :name => "Praticas de Eletrecidade e Eletronica II", :description => "Materia cujo objetivo eh fazer coisas...")
    Subject.create!(:code => "MAC2166", :name => "Introducao a Computacao para Engenharia", :description => "Materia cujo objetivo eh ensinar computacao aos alunos...")

    Professor.create!(:name => "Arnaldo")
    Professor.create!(:name => "Zucchi")
    Professor.create!(:name => "Toledo")
    Professor.create!(:name => "Lebensztajn")
    Professor.create!(:name => "Pait")


    Subject.all.each do |subject|
      User.all(:limit => 6).each do |user|
        user.subcomments.create!(:comment => Faker::Lorem.sentence(5), :subject => subject)
      end
    end

    Professor.all.each do |professor|
      User.all(:limit => 6).each do |user|
        user.procomments.create!(:comment => Faker::Lorem.sentence(5), :professor => professor)
      end
    end

  end
end

