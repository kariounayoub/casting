puts 'deleting data'
Question.destroy_all
Evenement.destroy_all
User.destroy_all
Inscription.destroy_all
puts 'delete complted'
puts ''

puts 'creating admin'
User.create(email: 'a.karioun@medprod.ma', password: '123456', admin: true)

puts 'creating user'
User.create(email: 'user@gmail.com', password: '123456', admin: false)

puts 'creating questions'

mcjr2 = Evenement.create(nom: 'MCJR2', date: '15/06/2019', adresse: 'Hotel Grand Mogador, Casablanca', actif: true)

Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'nom')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'prenom')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'lien')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'adresse')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'ville')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'tel')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'email')

Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'nom')
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'adresse')
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'ville')
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'contact')
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'tel')

Question.create(evenement: mcjr2, categorie: 'motivation', contenu: 'participation')

Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'temps')
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'souvenir')
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'plats')
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'difficile')
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'chef')

Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'frequence')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'plat')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'style')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'mieux')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'moins')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'competence')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'desastre')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'competitif')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'habitude')

Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'fraterie')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'classe')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'loisirs')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'grand')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'qualites')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'defauts')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'tele')

puts 'seed completed'
