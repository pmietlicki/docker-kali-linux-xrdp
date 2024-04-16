# Utiliser l'image de Kali avec XFCE comme base
FROM kalilinux/kali-rolling:xfce

# Installer xrdp
RUN apt-get update && apt-get install -y xrdp sudo

# Configurer xrdp
RUN service xrdp start

# Ajouter un utilisateur non-root pour utiliser XRDP
RUN useradd -m kali -s /bin/bash \
    && echo "kali:kali" | chpasswd \
    && adduser kali sudo

# Exposer le port XRDP (3389)
EXPOSE 3389

# Commande pour démarrer le serveur XRDP et empêcher le conteneur de se fermer
CMD ["sh", "-c", "service xrdp start && tail -f /dev/null"]
