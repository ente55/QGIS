ARG DISTRO_VERSION=38

FROM fedora:${DISTRO_VERSION} as binary-for-oracle
MAINTAINER Matthias Kuhn <matthias@opengis.ch>

RUN dnf -y --refresh install \
    bison \
    ccache \
    clang \
    clazy \
    curl \
    draco-devel \
    exiv2-devel \
    expat-devel \
    fcgi-devel \
    flex \
    git \
    gdal-devel \
    geos-devel \
    gpsbabel \
    grass \
    grass-devel \
    gsl-devel \
    libpq-devel \
    libspatialite-devel \
    libxml2-devel \
    libzip-devel \
    libzstd-devel \
    netcdf-devel \
    ninja-build \
    ocl-icd-devel \
    PDAL \
    PDAL-libs \
    PDAL-devel \
    perl-YAML-Tiny \
    poppler-utils \
    proj-devel \
    protobuf-devel \
    protobuf-lite-devel \
    python3-devel \
    python3-mock \
    python3-OWSLib \
    python3-pyqt6 \
    python3-pyqt6-devel \
    python3-qscintilla-qt6 \
    python3-qscintilla-qt6-devel \
    python3-termcolor \
    PyQt-builder \
    qca-qt6-devel \
    qpdf \
    qt6-qt3d-devel \
    qt6-qtbase-devel \
    qt6-qtbase-private-devel \
    qt6-qtdeclarative-devel \
    qt6-qttools-static \
    qt6-qtserialport-devel \
    qt6-qtsvg-devel \
    qt6-qtpositioning-devel \
    qt6-qtdeclarative-devel \
    qt6-qt5compat-devel \
    qt6-qtmultimedia-devel \
    qt6-qtwebengine-devel \
    qtkeychain-qt6-devel \
    qwt-qt6-devel \
    qscintilla-qt6-devel \
    sip6 \
    spatialindex-devel \
    sqlite-devel \
    unzip \
    unixODBC-devel \
    xorg-x11-server-Xvfb \
    util-linux \
    wget \
    openssl-devel \
    libsecret-devel \
    make \
    automake \
    gcc \
    gcc-c++ \
    kernel-devel \
    ninja-build \
    patch \
    dos2unix


# Oracle : client side
RUN curl https://download.oracle.com/otn_software/linux/instantclient/199000/instantclient-basic-linux.x64-19.9.0.0.0dbru.zip > instantclient-basic-linux.x64-19.9.0.0.0dbru.zip
RUN curl https://download.oracle.com/otn_software/linux/instantclient/199000/instantclient-sdk-linux.x64-19.9.0.0.0dbru.zip > instantclient-sdk-linux.x64-19.9.0.0.0dbru.zip
RUN curl https://download.oracle.com/otn_software/linux/instantclient/199000/instantclient-sqlplus-linux.x64-19.9.0.0.0dbru.zip > instantclient-sqlplus-linux.x64-19.9.0.0.0dbru.zip

RUN unzip instantclient-basic-linux.x64-19.9.0.0.0dbru.zip
RUN unzip instantclient-sdk-linux.x64-19.9.0.0.0dbru.zip
RUN unzip instantclient-sqlplus-linux.x64-19.9.0.0.0dbru.zip

ENV PATH="/instantclient_19_9:${PATH}"
ENV LD_LIBRARY_PATH="/instantclient_19_9:${LD_LIBRARY_PATH}"
ENV LANG=C.UTF-8

FROM binary-for-oracle as binary-only

RUN dnf -y install \
    python3-gdal \
    python3-nose2 \
    python3-psycopg2 \
    python3-pyyaml

FROM binary-only
