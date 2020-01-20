FROM centos:7
LABEL maintainer="Pascal Patty <pascal.patty@asr.nl>"

# We installeren Python en PIP. PIP haalt Ansible en de basis modules op.
RUN echo "Updating and installing ius-release"
RUN yum update -y -q && \
    yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN echo "Installing GCC, Python and GIT"
RUN yum install -y \
        gcc \
        krb5-libs \
        krb5-workstation \
        krb5-devel \
        python36u \
        python36u-libs \
        python36u-devel \
        python36u-pip \
        git
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
RUN yum install -y azure-cli && \
    yum clean all

RUN echo "Installing Ansible Version: 2.9"
RUN pip3 --version
RUN pip3 install --upgrade setuptools
RUN pip3 install psutil gssapi ansible==2.9 ansible-lint ansible[azure]