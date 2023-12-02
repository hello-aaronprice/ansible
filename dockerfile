FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-add-repository -y ppa:neovim-ppa/stable && \
    apt update && \
    apt install -y curl git ansible neovim build-essential

ARG TAGS
WORKDIR /root
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]