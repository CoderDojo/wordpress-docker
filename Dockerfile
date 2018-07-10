FROM wordpress:4.6
ADD . /testdir
WORKDIR /testdir
RUN apt-get update && apt-get install -y git && git clone https://github.com/CoderDojo/cd-theme.git
