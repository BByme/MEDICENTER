Je propose une architecture de BDD pour l'application, 'XXXXXXXX'
l'architecture est constituée de 6 tables suivantes :

1. User_Account

Cette table modélise le compte utilisateur du system, 'NAV' 
elle contient différentes informations sur l'utilisateur, et permet de faire un lien (une connection) entre
l'utilisateur et le System (NAV : système dans la voiture) avec un minimum d'information 
(contrainte des terminaux mobiles) 

Information à suivre ...

2. Nav_System

Cette table modélise le systeme NAV (dans la voiture), elle contient essentiellement les info sur la voiture connectée au système, et permet de lier un compte utilisateur au système dans la voiture,
je choisis le lien multiple entre compte-utilisateur et la voiture (NAV)
car on peut avoir un seul compte pour plusieures voitures connectées, ou inversement.

Information à suivre ...

3. Passenger

Cette table modélise le passage dans la voiture, qui peut ou pas avoir un compte utilisateur.
le passage peut ou ne pas avoir un dossier médical, mais quand il est connecté au système, il doit avoir un dossier
médical.

Information à suivre.

4. Driver

Cette table modélise le chauffeur de la voiture, qui peut ou pas avoir un compte utilisateur.
le Chaufeur peut ou pas avoir un dossier médical, mais quand il est connecté au système, il doit avoir un dossier.

Information à suivre. 

5. Doctor

Cette table modélise le passage dans la voiture, qui peut ou pas avoir un compte utilisateur. Il est superviseur du dossier médical de l'utilisateur, celà lui confère des droits en plus sur le dossier médical.

Information à suivre.

6. Medical_file

Cette table modélise le fichier médical, de l'utilisateur, il contient différents indicateurs sur la santé de l'utilisateur, 

7. Parameters.

Cette table modélise les paramèteres sanitaires de références pris en compte dans le système, le medical_file se réfère à cette table pour savoir s'il doit y avoir des alert pour différents indicateur dans le médical_file. 

LES SCRIPTS SQL

un seul script pour les DDL enfin de construire ces tables, et les rélations entre ces tables.
Pas des script les DML

JAVA

Je propose, de partir sur le spring-boot avec spring-data-rest, pour expose les endpoint permettant de faire les opérations de crud. (ref : Spring-boot et Spring-Data-Rest).

A VENIR

1. Coder la logique applicative,
2. UI : web et Mobile.
