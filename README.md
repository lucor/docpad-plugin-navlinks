# NavLinks Plugin for DocPad

Adds the ability to generate a navigation bar for documents with links to the next and previous document of a specified collection for [DocPad](https://docpad.org).

## Install
```
npm install --save docpad-plugin-navlinks
```

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

## License
Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2013+ [Luca Corbo](http://lucor.github.io)

