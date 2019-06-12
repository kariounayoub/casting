puts 'deleting data'
Question.destroy_all
Evenement.destroy_all
User.destroy_all
Inscription.destroy_all
puts 'delete complted'
puts ''

puts 'creating admin'
User.create(email: 'a.karioun@medprod.ma', password: 'azerty', admin: true)

puts 'creating user'
User.create(email: 'user@gmail.com', password: 'azerty', admin: false)
User.create(email: 'user2@gmail.com', password: 'azerty', admin: false)

puts 'creating questions'

mcjr2 = Evenement.create(nom: 'MCJR2', date: '15/06/2019', adresse: 'Hotel Grand Mogador, Casablanca', actif: true)

Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'taille', data_type: 'string', required: true)
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'vetement', data_type: 'string', required: true)
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'pointure', data_type: 'string')
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'nationalite_residence', data_type: 'string')
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'allergie_intolerance', data_type: 'boolean')
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'allergie_intolerance_contenu', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'medicament', data_type: 'boolean')
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'medicament_contenu', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'autre', data_type: 'text')

Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'nom', data_type: 'string')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'prenom', data_type: 'string')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'lien', data_type: 'string')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'adresse', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'ville', data_type: 'string')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'tel', data_type: 'tel')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'email', data_type: 'email')

Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'nom', data_type: 'string')
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'adresse', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'ville')
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'contact', data_type: 'string')
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'tel', data_type: 'tel')

Question.create(evenement: mcjr2, categorie: 'motivation', contenu: 'participation', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'motivation', contenu: 'competitif', data_type: 'text')

Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'temps', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'souvenir', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'plats', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'difficile', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'chef', data_type: 'text')

Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'frequence', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'plat', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'style', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'mieux', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'moins', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'competence', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'desastre', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'habitude', data_type: 'text')

Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'fraterie', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'classe', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'loisirs', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'grand', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'qualites', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'defauts', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'tele', data_type: 'text')

puts 'seed completed'
