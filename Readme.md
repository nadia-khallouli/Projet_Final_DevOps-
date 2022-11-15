# EXAMEN FINAL DOCKER
 
 
 
 ### **Membres du groupe** 
KHALLOULI Nadia -  MANNI Ikram - MVOUAMA Ben - NDIAYE Baye Ibrahima - ZOSSOUNGBO Lorine




## Construction du Dockerfile
Création de l’image à partir du Dockerfile:
 - docker build -t ic-webapp:1.0 .

![image](https://user-images.githubusercontent.com/79446351/201700417-1f0e256e-00c7-4af0-8143-e4f0b847f880.png)

Visualisation des sites web grâce au container lancé: 
 - docker run -d --name test-ic-webapp ic-webapp:1.0
 **- Odoo** : 192.168.163.1:8069
![image](https://user-images.githubusercontent.com/79446351/201697619-0902d797-81b8-450b-b28a-01d473c939ad.png)

 **- Pgadmin** : 192.168.163.1:80
![image](https://user-images.githubusercontent.com/79446351/201699583-c0f76956-6b1b-400e-82fa-9118c3eac3d2.png)

Visualisation après connexion sur **Pgadmin**
![image](https://user-images.githubusercontent.com/79446351/201729253-4634f6d9-803a-4b2d-a89d-55f375843bff.png)

## - Docker Registry
Création d'un registre privée pour ic groupe pour stocker les images de l’entreprise :
 - docker run -d -p 4001:5000 --net ic-groupe --name registry-ic-groupe registry:2
Création d'une interface web pour notre registre privé :
 - docker run -d --net ic-groupe -p 4002:80 -e REGISTRY_URL=http://registry-ic-groupe:5000 -e DELETE_IMAGES=true -e REGISTRY_TITLE="IC-GROUPE 
REGISTRY" joxit/docker-registry-ui:1.5-static
Ajout d'un tag à notre image pour pouvoir la push sur notre registre privé :
 - docker tag ic-webapp:1.0 localhost:4001/ic-webapp:1.0
Exécution d'un push de notre image sur notre registre privée :
 - docker push localhost:4001/ic-webapp:1.0
Nous pouvons observer la présence notre image dans notre registre privé comme le montre la figure suivante:
![image](https://user-images.githubusercontent.com/79446351/201705023-9c2f6265-5cda-41ce-8c7b-6f44d7c1e995.png)


![image](https://user-images.githubusercontent.com/79446351/201705249-6836de17-7571-453b-8ece-36108d6c19b8.png)

Ajout d'un tag à notre image pour pouvoir la push sur dockerhub:
 - docker tag ic-webapp:1.0 lorinez/ic-webapp:1.0
Exécution d'un push de notre image sur le dockerhub :
 - docker push lorinez/ic-webapp:1.0

![image](https://user-images.githubusercontent.com/79446351/201876829-17510259-c724-450b-a28c-dca0cb218e2d.png)


![image](https://user-images.githubusercontent.com/79446351/201876656-a1cf9b7b-bf3b-45c7-af95-652492671b84.png)

Nous pouvons observer la présence notre image sur dockerhub comme le montre la figure suivante:

![image](https://user-images.githubusercontent.com/79446351/201875710-ca39f848-b706-4fca-939d-6509ba168f46.png)

Après avoir exécuter notre docker-compose file via la commande :
 - docker-compose up -d
![image](https://user-images.githubusercontent.com/79446351/201889131-5befa291-fec4-42ea-b69e-98893204428d.png)

Nous avons le résultat suivant dans le navigateur :

![image](https://user-images.githubusercontent.com/79446351/201754514-00019bca-adcb-4d23-bb43-41b76e484e13.png)
