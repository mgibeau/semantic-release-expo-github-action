FROM node:alpine

LABEL "com.github.actions.name"="Expo Semantic Release"
LABEL "com.github.actions.description"="An Expo implementation for semantic release, so you don't have to bother."
LABEL "com.github.actions.icon"="chevron-up"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/mgibeau/semantic-release-expo-github-action"
LABEL "homepage"="https://github.com/byCedric/semantic-release-expo"
LABEL "maintainer"="Octocat <octocat@github.com>"

RUN apk add git

RUN npm install --global semantic-release semantic-release-expo \
    && npm cache rm --force \
    && rm -rf ~/.npm

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]