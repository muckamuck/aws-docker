FROM ubuntu
ARG user=chuck
ARG user_id=501
RUN apt-get update
RUN apt-get -y install python-pip
RUN apt-get -y install vim
RUN apt-get -y install curl
RUN apt-get -y install git tig
RUN pip install -U pip
RUN pip install -U virtualenvwrapper
RUN pip install -U pdbpp
RUN pip install -U awscli
RUN ln -s /usr/local/bin/virtualenvwrapper.sh /etc/profile.d/.
RUN useradd -u ${user_id} -m -k /etc/skel -d /home/${user} -s /bin/bash ${user}
RUN echo ". /etc/profile" >> /home/${user}/.bashrc
COPY pyvim/.pdbrc /home/${user}/.pdbrc
COPY pyvim/.vim /home/${user}/.vim
COPY pyvim/.vimrc /home/${user}/.vimrc
