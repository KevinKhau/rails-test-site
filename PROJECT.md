# Projet de candidature Simplébo

Il s'agit d'un mini-système de gestion de tickets minimaliste, avec des vues simples pour chacune des fonctionnalités.

## Introduction

Tu travailles dans une entreprise pour laquelle le service client est important. Pour mieux répondre aux clients, cette entreprise souhaite implémenter un système de tickets.
Tu dois développer la partie *back-office* de ce système de ticket, c'est à dire le système de gestion des tickets, utilisé par des personnes en interne.
Lorsqu'un client envoie un ticket, le ticket apparait dans ce *back-office*.

L'interface client ne fait pas partie du projet, mais pour les besoins de ce projet, l'une des étapes de ce projet consiste à simuler la création de nouveaux tickets avec un script. 


## 1. Utilisateurs

Un utilisateur est représenté (au moins) par un prénom, un nom, un email et un mot de passe. Certains utilisateurs sont "gestionnaires de tickets".

## 2. Système d'authentification

L'authentification d'un utilisateur se fait par email & mot de passe.
Un utilisateur authentifié doit pouvoir se déconnecter en un clic depuis n'importe quelle page de l'interface.
Lorsqu'un utilisateur se connecte, il est redirigé vers le dashboard de l'application, qui contient l'index des tickets.

## 3. Système de tickets

Le système de ticket n'est accessible que des utilisateurs connectés.

#### Un ticket :
- a (à minima) un titre et une description
- est soit ouvert, soit clos

#### L'index des tickets :
- n'affiche que les tickets ouverts
- permet de savoir en un coup d'oeil qui est l'utilisateur en gestion du ticket, quand ce ticket a été créé et le nombre de commentaires.

#### Lorsqu'un ticket est créé :
- Il est automatiquement attribué à l'utilisateur ayant le moins de tickets ouverts. Si plusieurs utilisateurs ont le même nombre de tickets ouverts, le choix est aléatoire entre ces utilisateurs.
- Un email est automatiquement envoyé à l'utilisateur à qui ce ticket est attribué, pour l'informer qu'un nouveau ticket lui a été attribué, avec un lien vers le ticket.

#### L'interface d'un ticket inclure un fil de commentaires
- Ce fils de commentaire permet à un ou plusieurs utilisateurs de suivre et mieux gérer l'évolution du ticket
- Lorsqu'un utilisateur, qui n'est *pas* le gestionnaire d'un ticket, écrit un commentaire, le gestionnaire du ticket reçoit un e-mail pour l'en informer.

#### Système de commentaires basique incluant :
- Un mini-formulaire à un seul champ pour l'ajout de commentaire
- Une liste des commentaires en cascade, du plus récent au plus ancien. On doit pouvoir savoir quel utilisateur a écrit le commentaire et quand.

#### Un ticket peut être fermé, via un bouton "Fermer le ticket", par le gestionnaire de ticket.
- L'utilisateur est alors redirigé vers le dashboard


## 4. Création de ticket

Nous allons simuler la création de ticket via un système aléatoire basique, qui fonctionne avec le système d'exécution automatique de script de votre choix (tâches CRON, par exemple).

Toutes les 5 minutes, une méthode qui permet de créer un ticket est automatiquement appelée.

A chaque fois qu'elle est appelée :
- elle a 1 chance sur 10 de créer un ticket si c'est la nuit (entre 22h et 8h du matin)
- elle a 1 chance sur 3 de créer un ticket si c'est le matin (entre 8h du matin et 12H)
- elle a 1 chance sur 4 de créer un ticket si c'est l'après-midi (entre 12h et 18H)
- elle a 1 chance sur 5 de créer un ticket si c'est le soir (entre 18h et 22H)

Le contenu du ticket doit varier à chaque création de ticket.

## 5. Bonus : Recherche de ticket en JS

Cette fonctionnalité permettra aux utilisateurs de filtrer, à l'aide d'un champ de recherche, le contenu de l'index des tickets.
La recherche doit se faire à la frappe (200ms après la frappe, et seulement a partir de 2 caractères).
La recherche doit se faire entièrement en JavaScript et dans la page (pas de recherche côté serveur).
La recherche doit être le plus souple possible. Elle ne doit pas prendre en compte la sensibilité de la casse ni les accents.

## Instructions complémentaires

#### Techno
Django ou Rails, versions récentes.

#### CSS
Les instructions concernant les interfaces ont volontairement été omises.

Tu es libre d'exprimer ton art du HTML et du CSS, de Bootstrap ou de son framework front favori !

Quels que soient tes choix techniques, le rendu général des interfaces, les emplacements des boutons, les choix des couleurs, etc ne doivent pas être négligés.


#### Rendu du projet

Le projet doit être rendu sous deux formes complémentaires :

- Code mis en ligne sur github
- Projet mis en ligne sur un domaine à transmettre à Jérémy, avec au moins un utilisateur :
  - **Prénom** : Jérémy
  - **Nom** : Kenigsman
  - **E-mail** : jeremy.kenigsman@simplebo.fr
  - **Mot de passe** : qsdfghjklm


#### Documentation
Le fichier README.md doit être rempli avec, a minima :
- une explication des choix d'implémentation (modélisation, relations, frameworks)
- une explication des choix des bibliothèques, packages, gem

Une documentation plus complète est la bienvenue.


#### Utilisation de gems / packages

Les gems / packages font partie de l'écosystème Ruby / Python. Tu es donc libre d'utiliser les gems / packages que tu souhaites pour implémenter chacune des fonctionnalités à développer.

Seule condition : chaque ajout de gem / package ne faisant pas partie d'un projet initial Rails / Django doit être documenté (en une ligne ou deux) :
- ce que la gem / le package évite de faire à la main
- pourquoi cette gem / ce package et pas un(e) autre (s'il y avait débat),
- ce que cela apporte
- éventuellement les difficultés rencontrées


#### Questions et prises de libertés

Si un point ne parait pas clair, tu peux :
- poser des questions à Jérémy, en le contactant par email.
- ou prendre des libertés en faisant des suppositions et des hypothèse. Ces hypothèses doivent alors être documentées dans le README.md

#### Timing :
Le projet est conçu pour prendre entre 4h et 10H de code (à partir d'une application initialisée fonctionnelle). Le projet est à rendre dans les 8 jours qui suivent la réception des instructions, sauf accord particulier passé avec Jérémy.
