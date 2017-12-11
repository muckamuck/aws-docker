FROM ubuntu
ARG user=chuck
ARG user_id=501
RUN apt-get update
RUN apt-get -y install python-pip vim curl git tig 
RUN pip install -U pip
RUN pip install -U virtualenvwrapper pdbpp awscli
RUN ln -s /usr/local/bin/virtualenvwrapper.sh /etc/profile.d/.
RUN useradd -u ${user_id} -m -k /etc/skel -d /home/${user} -s /bin/bash ${user}
RUN echo ". /etc/profile" >> /home/${user}/.bashrc
RUN cd /home/${user}/.bashrc; \
    git clone https://github.com/muckamuck/pyvim.git; \
    ./pyvim/install.sh
