
<!-- TITLE/ -->

# NavLinks Plugin for DocPad

<!-- /TITLE -->


<!-- BADGES/ -->

[![Build Status](http://img.shields.io/travis-ci/lucor/docpad-plugin-navlinks.png?branch=master)](http://travis-ci.org/lucor/docpad-plugin-navlinks "Check this project's build status on TravisCI")
[![NPM version](http://badge.fury.io/js/docpad-plugin-navlinks.png)](https://npmjs.org/package/docpad-plugin-navlinks "View this project on NPM")
[![Dependency Status](https://david-dm.org/lucor/docpad-plugin-navlinks.png?theme=shields.io)](https://david-dm.org/lucor/docpad-plugin-navlinks)
[![Development Dependency Status](https://david-dm.org/lucor/docpad-plugin-navlinks/dev-status.png?theme=shields.io)](https://david-dm.org/lucor/docpad-plugin-navlinks#info=devDependencies)<br/>


<!-- /BADGES -->


Adds the ability to generate a navigation bar for documents with links to the next and previous document of a specified collection for [DocPad](https://docpad.org).


<!-- INSTALL/ -->

## Install

### [Node](http://nodejs.org/)
- Use: `require('docpad-plugin-navlinks')`
- Install: `npm install --save docpad-plugin-navlinks`

<!-- /INSTALL -->


## Usage
The purpose of this plugin is to generate a navigation bar for documents with links to the next and previous document of a specified collection. Useful especially for posts.


### Setup
Edit the docpad.coffee configuration file.

Identify one o more collections you want add navbar links in the

``` coffee
  collections:
    pages: (database) ->
      database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])
    posts: (database) ->
      database.findAllLive({layout:$has:'post'}, [date:-1])
```

Define collections you want to enable navbar links. You may also specifies collection sorting (-1 for reverse order).

``` coffee
  # Plugins configurations
  plugins:
    navlinks:
      collections:
        posts: -1
        pages: 1
```

In the eco template (i.e. post.html.eco) add:
``` coffee
    <%- @getNavLinks() %>
```

You may style the navlinks usign the following css classes:

```
.navlinks {}

.navlinks-prev {
    float: left;
}

.navlinks-next {
    float: right;
}
```

<!-- HISTORY/ -->

## History
[Discover the change history by heading on over to the `HISTORY.md` file.](https://github.com/lucor/docpad-plugin-navlinks/blob/master/HISTORY.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/lucor/docpad-plugin-navlinks/blob/master/CONTRIBUTING.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- Luca Corbo <lu.corbo@gmail.com> (http://lucor.github.io)

### Sponsors

No sponsors yet! Will you be the first?



### Contributors

These amazing people have contributed code to this project:

- [lucor](https://github.com/lucor) — [view contributions](https://github.com/lucor/docpad-plugin-navlinks/commits?author=lucor)

[Become a contributor!](https://github.com/lucor/docpad-plugin-navlinks/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

Copyright &copy; Luca Corbo <lu.corbo@gmail.com> (http://lucor.github.io)

<!-- /LICENSE -->


