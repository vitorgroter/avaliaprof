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
      email = "example#{n+1}@example.com"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end

    calc1 = Subject.create!(:code => "MAT2453", :name => "Calculo Diferencial e Integral para Engenharia I",
                            :description => "Materia cujo objetivo eh ensinar calculo diferencial e integral aos alunos...")
    calc2 = Subject.create!(:code => "MAT2454", :name => "Calculo Diferencial e Integral para Engenharia II",
                            :description => "Materia cujo objetivo eh ensinar calculo diferencial e integral aos alunos...")
    calc3 = Subject.create!(:code => "MAT2455", :name => "Calculo Diferencial e Integral para Engenharia III",
                            :description => "Materia cujo objetivo eh ensinar calculo diferencial e integral aos alunos...")
    calc4 = Subject.create!(:code => "MAT2456", :name => "Calculo Diferencial e Integral para Engenharia IV",
                            :description => "Materia cujo objetivo eh ensinar calculo diferencial e integral aos alunos...")
    algelin1 = Subject.create!(:code => "MAT2457", :name => "Algebra Linear para Engenharia I",
                               :description => "Materia cujo objetivo eh ensinar algebra linear aos alunos...")
    algelin2 = Subject.create!(:code => "MAT2458", :name => "Algebra Linear para Engenharia II",
                               :description => "Materia cujo objetivo eh ensinar algebra linear aos alunos...")
    circ1 = Subject.create!(:code => "PSI2211", :name => "Circuitos Eletricos I",
                            :description => "Materia cujo objetivo eh aprender circuitos...")
    circ2 = Subject.create!(:code => "PSI2212", :name => "Circuitos Eletricos II",
                            :description => "Materia cujo objetivo eh aprender circuitos...")
    praticas = Subject.create!(:code => "PSI2222", :name => "Praticas de Eletrecidade e Eletronica II",
                               :description => "Materia cujo objetivo eh fazer coisas...")
    comp = Subject.create!(:code => "MAC2166", :name => "Introducao a Computacao para Engenharia",
                           :description => "Materia cujo objetivo eh ensinar computacao aos alunos...")

    arnaldo = Professor.create!(:name => "Arnaldo")
    zucchi = Professor.create!(:name => "Zucchi")
    magno = Professor.create!(:name => "Magno")
    toledo = Professor.create!(:name => "Toledo")
    leb = Professor.create!(:name => "Lebensztajn")
    pait = Professor.create!(:name => "Pait")
    deborah = Professor.create!(:name => "Deborah")

    calc1.professors << deborah
    comp.professors  << arnaldo
    circ1.professors << zucchi
    circ2.professors << zucchi
    circ1.professors << magno
    circ2.professors << magno



    Subject.all.each do |subject|
      User.all(:limit => 6).each do |user|
        user.subcomments.create!(:comment => Faker::Lorem.sentence(5), :subject => subject)
        user.sub_stars.create!(:stars => 2 + rand(4), :subject => subject)
      end
    end

    Professor.all.each do |professor|
      User.all(:limit => 6).each do |user|
        user.procomments.create!(:comment => Faker::Lorem.sentence(5), :professor => professor)
        user.prof_stars.create!(:stars => 2 + rand(4), :professor => professor)
      end
    end

  end
end

