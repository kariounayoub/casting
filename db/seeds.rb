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

Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'Nom')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'Prénom')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'Lien avec le candidat')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'Adresse')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'Ville')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'Numéro de téléphone')
Question.create(evenement: mcjr2, categorie: 'tuteur', contenu: 'Adresse email')

Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'Nom')
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'Adresse')
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'Ville')
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'Contact')
Question.create(evenement: mcjr2, categorie: 'ecole', contenu: 'Numéro de téléphone')

Question.create(evenement: mcjr2, categorie: 'motivation', contenu: 'Pourquoi veux-tu participer à MasterChef Junior?')

Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'Depuis combien de temps cuisines-tu?')
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'Quel est ton premier souvenir de cuisine ?')
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'Quels sont les 3 plats que tu aimes cuisiner et pourquoi ?')
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'Quelle est la chose la plus difficile que tu as essayé de cuisiner ?')
Question.create(evenement: mcjr2, categorie: 'cuisine', contenu: 'Qui est votre chef préféré ?')

Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'À quelle fréquence cuisines-tu ? ')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'Quel est le plat que préfère cuisiner ? ')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'Quel style de cuisine maitrises-tu le plus ?')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'Quel plat cuisines-tu le mieux ?')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'Quel plat cuisines-tu le moins bien ?')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'Quelle est ta plus grande compétence culinaire ? (Maitrise des cuissons, rapidité, etc.)')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'Parle nous d un désastre que tu as vécu en cuisine')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'A quel point es-tu compétitif ?')
Question.create(evenement: mcjr2, categorie: 'competence', contenu: 'Est-ce que tu as l’habitude de cuisiner seul ou avec de l’aide ?')

Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'Parle nous de tes freres et soeurs si tu en as')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'En quelle classe es-tu à l’école ?')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'Quels sont les loisirs et sports que tu aimes ?')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'Qu’aimerais-tu faire quand tu seras grand ?')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'Si on demande à ton/ta meilleur(e) ami(e) de nous citer tes 3 qualités, que dirait-t-il ?')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'Si on demande à ton/ta meilleur(e) ami(e) de nous citer tes 3 défauts, que dirait-t-il ?')
Question.create(evenement: mcjr2, categorie: 'perso', contenu: 'As-tu déjà joué, ou apparu à la télévision ou au cinéma auparavant ? Si oui, veuillez décrire')

puts 'seed completed'
