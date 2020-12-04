FROM debian:sid-slim
RUN apt update && apt install -y curl gnupg
RUN curl -fsSL https://github.com/blankon-packages/blankon-keyring/blob/master/keyrings/blankon-archive-keyring.gpg?raw=true | apt-key add -
COPY blankon-dev.list /etc/apt/sources.list
RUN apt update && apt install -y blankon-keyring blankon-lintian sudo build-essential zsh devscripts debhelper pbuilder debootstrap lintian jq tar vim git netcat coreutils
RUN curl -L -o- https://raw.githubusercontent.com/BlankOn/irgsh-go/master/install-cli.sh | bash

# Add a new user "blankon" with user id 8877
RUN useradd -u 8877 -m blankon && echo "blankon:blankon" | chpasswd && adduser blankon sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# Change to non-root privilege
RUN su - blankon -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN su - blankon -c "echo \"cd\" >> /home/blankon/.zshrc"
USER blankon
CMD /bin/zsh
