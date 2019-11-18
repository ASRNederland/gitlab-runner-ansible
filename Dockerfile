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
        git && \
    yum clean all

RUN echo "Installing Ansible Version: ${ANSIBLE_VERSION}"
RUN python3.6 -m pip --version
RUN python3.6 -m pip install --upgrade setuptools
RUN python3.6 -m pip install psutil gssapi
