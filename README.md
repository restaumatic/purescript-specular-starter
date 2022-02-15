# Specular starter

A counter example written in specular.

## Prerequisites

### With npm

Install all dependencies of the project:
```
npm install
```

Add `node_modules/.bin` to path:
```
export PATH="./node_modules/.bin:$PATH"
```

### With Nix

Install Nix following the instructions on the [Nix website](https://nixos.org/download.html).

To enter a development environment, simply open a terminal on the project's root and use below command to get a bash shell:
```
nix-shell
```

Otherwise, you can use `direnv` which allows you to use your preferred shell. Since we already provide `.envrc` file, once `direnv` is installed, just run:
```
direnv allow
```
and you'll have a working development environment now and whenever you enter this directory again.

## Running

Bundle a project into an executable:
```
spago bundle-app
```

Open `index.html` where bundled `index.js` is imported:
```
xdg-open index.html
```
Or (on macOS):
```
open index.html
```
