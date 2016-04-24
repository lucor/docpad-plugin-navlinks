# Export Plugin
module.exports = (BasePlugin) ->
  # Define Plugin
  class NavLinksPlugin extends BasePlugin
    # Plugin name
    name: 'navlinks'

    config:
      collections: {}

    renderBefore: (opts, next) ->
      {collection, templateData} = opts
      config = @config

      for collectionName, sorting of config.collections
        collection = @docpad.getCollection(collectionName)
        if collection?
          @docpad.log 'info', 'Adding navlinks for collection: ', collectionName
          index = 0
          collection.forEach (document) ->
            navlinks = navlinks:
                        title:
                          next: collection.at(index + sorting)?.get('title')
                          prev: collection.at(index - sorting)?.get('title')
                        url:
                          next: collection.at(index + sorting)?.get('url')
                          prev: collection.at(index - sorting)?.get('url')

            document.set(navlinks)
            index++
      return next()

      # Chain
      @

    # Extend Template Data
    # Add our form to our template data
    extendTemplateData: ({templateData}) ->

      templateData.getNavLinks = (styles = []) ->

        styles = styles.concat(['navlinks']).join(' ')
        navLinks = @getDocument().get('navlinks')

        if navLinks?
          prevLink = nextLink = ''
          if navLinks.url.prev?
            prevLink = """
                       <a href="#{navLinks.url.prev}" title="#{navLinks.title.prev}" class="navlinks-prev">#{navLinks.title.prev}</a>
                       """
          if navLinks.url.next?
            nextLink = """
                       <a href="#{navLinks.url.next}" title="#{navLinks.title.next}" class="navlinks-next">#{navLinks.title.next}</a>
                       """
          return """
                   <div class="#{styles}">
                     #{prevLink}
                     #{nextLink}
                   </div>
                 """
      # Chain
      @
