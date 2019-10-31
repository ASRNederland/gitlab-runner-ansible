FROM centos:7
MAINTAINER Pascal Patty <pascal.patty@asr.nl>

# We installeren Python en PIP. PIP haalt Ansible en de basis modules op.
RUN echo "Installing GCC, Python and GIT"
RUN yum update -y -q && \
    yum install -y \
        gcc \
        python36u \
        python36u-libs \
        python36u-devel \
        python36u-pip \
        git && \
    yum clean all

ARG ANSIBLE_VERSION=2.7.13
RUN echo "Installing Ansible Version: ${ANSIBLE_VERSION}"
RUN pip --version
RUN pip install ansible==$ANSIBLE_VERSION
RUN pip install psutil gssapi ansible-lint
