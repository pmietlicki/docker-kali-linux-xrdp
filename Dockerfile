# Utiliser l'image officielle de Kali Linux comme base
FROM kalilinux/kali-rolling

# Définir l'argument pour les interactions non interactives
ARG DEBIAN_FRONTEND=noninteractive

# Mettre à jour le système et installer XFCE et xrdp
RUN apt-get update && apt-get full-upgrade -y \
    && apt-get install -y kali-desktop-xfce kali-linux-everything xrdp sudo \
    && apt-get clean \
    && service xrdp start

# Ajouter un utilisateur non-root pour utiliser XRDP
RUN useradd -m kali -s /bin/bash \
    && echo "kali:kali" | chpasswd \
    && adduser kali sudo

# Exposer le port XRDP (3389)
EXPOSE 3389

# Commande pour démarrer le serveur XRDP et empêcher le conteneur de se fermer
CMD ["sh", "-c", "service xrdp start && tail -f /dev/null"]
