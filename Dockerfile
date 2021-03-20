FROM buildpack-deps:buster-scm
RUN apt -qq update \
  && apt -qq -y install curl zip unzip make \
  && curl -fsSL https://deno.land/x/install/install.sh | sh \
  && apt -qq clean
ENV DENO_INSTALL=/root/.deno
ENV PATH=$PATH:$DENO_INSTALL/bin

ENV GITHUB_USER_NAME=GITHUB-user-name
ENV GITHUB_TOKEN=GITHUB-token
ENV GITHUB_EMAIL=GITHUB-email

WORKDIR /repo
COPY . .
EXPOSE 8080
CMD ["sh", "init.sh"]
