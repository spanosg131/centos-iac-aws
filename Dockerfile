FROM centos:8

COPY bashrc /root/.bashrc
COPY bash-git-prompt /root/.bash-git-prompt
RUN dnf -y upgrade && \
    dnf -y install git python3 unzip jq bash-completion && \
    pip3 install ansible awscli && \
    export tver=$(curl -s https://releases.hashicorp.com/index.json 2>/dev/null | jq -r '.terraform.versions[].version' | sort -t. -k 1,1nr -k 2,2nr -k 3,3nr | grep -Ev  'beta|alpha|rc|oci' | head -n1) && \
    curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/"${tver}"/terraform_"${tver}"_linux_amd64.zip && \ 
    unzip -o /tmp/terraform.zip -d /usr/bin/ && rm -f /tmp/terraform.zip && \ 
    chmod 755 /usr/bin/terraform