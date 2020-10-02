FROM ubuntu:18.04

WORKDIR /home/user
COPY install_lin.zip .
RUN apt-get update && apt-get install -y zip apt-utils
# This will modify the provided install script
RUN unzip install_lin.zip && grep -B 1 -E "sudo|gfortran" install_fortran.sh | grep -v "esktop" | sed 's/echo/#/;s/sudo //;s/^\-\-//' > install_fortran_docker.sh
RUN chmod a+rx install_fortran_docker.sh && ./install_fortran_docker.sh
