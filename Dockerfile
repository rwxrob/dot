FROM debian
LABEL maintainer "Rob Muhlestein <rob@rwx.gg>"

# I left these one to a line (despite the inefficiencies) so that you
# can easily comment out the ones you don't want. This just makes image
# build time slower, not actual runtime or performance.

RUN apt update && apt install -y vim tmux lynx git 

RUN useradd -ms /bin/bash you
WORKDIR /home/you
COPY README.md .
RUN chown -R you:you . 
USER you
CMD ["bash"]
