![GPLv3](https://img.shields.io/badge/license-GPLv3-brightgreen.svg)
# vue-html-mode
Vue template support for Emacs

![Screenshot](example.png)

## Installation & Usage
vue-html-mode should be on MELPA soon, but for now, `(load-file "vue-html-mode.el")`
in your `.emacs.d/init.el` should be used for installation.

Vue templates are best used with the excellent [vue-mode](https://github.com/CodeFalling/vue-mode),
which the author of this package also contributes to. The hope is to make this
the default mode for Vue templates eventually, but fiddling with the code of
vue-mode to set this mode as the default should be fairly easy for now.

## Functions
- `vue-html-mode` - Enable Vue HTML Template mode

## Contributing
If you want to see a function or a feature in this mode, feel free to open an
issue or a pull request. I hope to eventually add support for chained filters
in mustache bindings, and a few more functions.

## License
GPLv3+
