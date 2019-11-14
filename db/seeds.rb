puts 'deleting data'
Question.destroy_all
Evenement.destroy_all
User.destroy_all
Inscription.destroy_all
puts 'delete complted'
puts ''

puts 'creating admin'
User.create(email: 'a.karioun@medprod.ma', password: 'adminpass123!', admin: true, caster: true)

puts 'creating user'
User.create(email: 'user@gmail.com', password: 'azerty', admin: false)

puts 'creating questions'

# mcjr2 = Evenement.create(nom: 'MCJR2', date: '15/06/2019', adresse: 'Hotel Grand Mogador, Casablanca', actif: true)
sb8 = Evenement.create(nom: 'sb8', date: '10/12/2019', adresse: 'A determiner', actif: true)

#MCJR2
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'nom', data_type: 'string', required: true)
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'prenom', data_type: 'string', required: true)
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'adresse', data_type: 'text', required: true)
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'ville', data_type: 'string', required: true)
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'date_naissance', data_type: 'date', required: true)
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'allergie_intolerance', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'medicament', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'personnel', contenu: 'autre', data_type: 'text', required: false)

Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'nom', data_type: 'string', required: true)
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'prenom', data_type: 'string', required: true)
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'lien', data_type: 'string', required: false)
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'adresse', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'ville', data_type: 'string', required: false)
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'tel', data_type: 'tel', required: true)
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'email', data_type: 'email', required: true)

Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'nom', data_type: 'string', required: true)
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'adresse', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'ville', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'classe', data_type: 'text', required: false)

Question.create(evenement: mcjr2, categorie: 'motivation', contenu: 'participation', data_type: 'text', required: true)
Question.create(evenement: mcjr2, categorie: 'motivation', contenu: 'competitif', data_type: 'text', required: false)

Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'temps', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'souvenir', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'plats', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'difficile', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'chef', data_type: 'text', required: false)

Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'frequence', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'plat', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'style', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'mieux', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'moins', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'competence', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'desastre', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'habitude', data_type: 'text', required: false)

Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'fraterie', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'sports', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'loisirs', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'assos', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'grand', data_type: 'text')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'qualites', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'defauts', data_type: 'text', required: false)
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'tele', data_type: 'text', required: false)

#SB8
Question.create(evenement: sb8, categorie: 'personnel', contenu: 'nom', data_type: 'string', required: true)
Question.create(evenement: sb8, categorie: 'personnel', contenu: 'prenom', data_type: 'string', required: true)
Question.create(evenement: sb8, categorie: 'personnel', contenu: 'adresse', data_type: 'text', required: true)
Question.create(evenement: sb8, categorie: 'personnel', contenu: 'ville', data_type: 'string', required: true)
Question.create(evenement: sb8, categorie: 'personnel', contenu: 'date_naissance', data_type: 'date', required: true)
Question.create(evenement: sb8, categorie: 'personnel', contenu: 'tel', data_type: 'tel', required: true)

Question.create(evenement: sb8, categorie: 'ecole', contenu: 'formation', data_type: 'string', required: true)
Question.create(evenement: sb8, categorie: 'ecole', contenu: 'niveau', data_type: 'string', required: false)

Question.create(evenement: sb8, categorie: 'categorie', contenu: 'categorie', data_type: 'string', required: true)

Question.create(evenement: sb8, categorie: 'motivation', contenu: 'artisanat', data_type: 'text', required: false)
Question.create(evenement: sb8, categorie: 'motivation', contenu: 'sb', data_type: 'text', required: false)

# photo CIN et photo objet

puts 'seed completed'
