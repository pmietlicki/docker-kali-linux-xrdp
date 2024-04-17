# Utiliser l'image officielle de Kali Linux comme base
FROM kalilinux/kali-rolling

# Mettre à jour les listes de paquets et le système
RUN apt-get update && apt-get -y full-upgrade

# Installer l'environnement de bureau XFCE et le métapaquet avec tous les outils
RUN apt-get install -y kali-desktop-xfce kali-linux-everything xrdp

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
