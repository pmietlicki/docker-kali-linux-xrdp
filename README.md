# Kali Linux avec XFCE et XRDP

Ce projet contient un Dockerfile pour construire une image Docker de Kali Linux équipée de l'environnement de bureau XFCE et du serveur XRDP installé et configuré. Cette configuration permet des connexions distantes à l'environnement Kali Linux via le protocole RDP (Remote Desktop Protocol).

## Prérequis

Avant de commencer, assurez-vous d'avoir Docker installé sur votre machine. Si Docker n'est pas installé, suivez les instructions sur le site officiel de Docker pour installer la version appropriée pour votre système d'exploitation.

## Construction de l'image

Pour construire l'image Docker à partir du Dockerfile, exécutez les commandes suivantes dans un terminal:

```bash
# Naviguez au répertoire contenant le Dockerfile
cd chemin_vers_le_dossier

# Construisez l'image Docker
docker build -t kali-custom-xrdp .
