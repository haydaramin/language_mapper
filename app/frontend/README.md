# frontend

[Tailwind](https://tailwindcss.com/) is our css framework.

# Set up instructions

Install [nvm](https://github.com/nvm-sh/nvm#install--update-script), then install node version 14 and set it as default `nvm install 14; nvm alias default 14`. Now install the dependencies `cd frontend; npm i`. Then if you want auto formatting, install prettier, eslint, and vetur vscode extensions `code --install-extension vuetifyjs.vuetify-vscode esbenp.prettier-vscode dbaeumer.vscode-eslint` and in your vscode settings json enter the following:

```json
"editor.formatOnSaveMode": "modifications",
"editor.codeActionsOnSave": {
	"source.fixAll": true,
	"source.fixAll.eslint": true
},
```

`npm run serve` to run the site locally.

Lmk if you run into trouble.

## Project setup

```
npm install
```

### Compiles and hot-reloads for development

```
npm run serve
```

### Compiles and minifies for production

```
npm run build
```

### Lints and fixes files

```
npm run lint
```

### Customize configuration

See [Configuration Reference](https://cli.vuejs.org/config/).
