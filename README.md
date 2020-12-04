# blankon-dev-docker

Docker image for BlankOn development purpose, agnostic against developer's operating system.

### Usage

```
docker run -ti -v $HOME/irgsh:/home/blankon/.irgsh $HOME/.gnupg:/home/blankon/.gnupg blankoninfra/dev
```

Development packages like build-essential, devscripts, debhelper, irgsh-cli and other are ready to kick in.
