FROM texlive/texlive:latest

# adding metadata
LABEL version="1.0" maintainer"Emanuele Nardi <emanuele.nardi@studenti.unitn.it>"

ARG UNAME=user
ARG UID=1000
ARG GID=$UID

# mi assicuro che l'userId e il groupId corrispondano a quelli che il container usa
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME

# installo le dipendenze
RUN apt-get update
RUN apt-get install python3-pip -y
RUN pip install Pygments
RUN apt-get autoclean -y && apt-get autoremove -y

USER $UNAME

