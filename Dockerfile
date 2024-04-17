# Utiliser l'image officielle de Kali Linux comme base
FROM kalilinux/kali-rolling

# Définir l'argument pour les interactions non interactives
ARG DEBIAN_FRONTEND=noninteractive

# Nettoyer les caches d'APT et mettre à jour le système
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && apt-get update && apt-get -y full-upgrade

# Installer l'environnement de bureau XFCE, xrdp, et quelques outils de Kali
RUN apt-get install -y kali-desktop-xfce xrdp
RUN apt-get install -y kali-tools-top10

# Supprimer le fichier PID existant et configurer xrdp
RUN rm -f /var/run/xrdp/xrdp-sesman.pid && service xrdp start

# Ajouter un utilisateur non-root pour utiliser XRDP
RUN useradd -m kali -s /bin/bash \
    && echo "kali:kali" | chpasswd \
    && adduser kali sudo

# Exposer le port XRDP (3389)
EXPOSE 3389

# Commande pour démarrer le serveur XRDP, supprimer le PID si nécessaire, et empêcher le conteneur de se fermer
CMD rm -f /var/run/xrdp/xrdp-sesman.pid && service xrdp start && tail -f /dev/null
