FROM centos:7
MAINTAINER Pascal Patty <pascal.patty@asr.nl>

# We installeren Python en PIP. PIP haalt Ansible en de basis modules op.
RUN echo "Updating and installing epel-release"
RUN yum update -y -q && \
    yum install -y epel-release
RUN echo "Installing GCC, Python and GIT"
RUN yum install -y \
        gcc \
        python \
        python-pip \
        git && \
    yum clean all

ARG ANSIBLE_VERSION=2.7.13
RUN echo "Installing Ansible Version: ${ANSIBLE_VERSION}"
RUN pip --version
RUN pip install --upgrade setuptools
RUN pip install ansible==$ANSIBLE_VERSION
RUN pip install psutil gssapi ansible-lint
