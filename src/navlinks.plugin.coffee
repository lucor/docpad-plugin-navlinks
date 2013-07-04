# Export Plugin
module.exports = (BasePlugin) ->
  # Define Plugin
  class NavLinksPlugin extends BasePlugin
    # Plugin name
    name: 'navlinks'

    config:
      collections: []

    renderBefore: (opts, next) ->
      {collection, templateData} = opts
      config = @config

      config.collections.forEach (collectionName) ->
        collection = @docpad.getCollection(collectionName)
        if collection?
          docpad.log 'info', 'Adding navlinks for collection: ', collectionName
          index = 0
          collection.forEach (document) ->
            navlinks = navlinks:
                        title:
                          next: collection.at(index + 1)?.get('title')
                          prev: collection.at(index - 1)?.get('title')
                        url:
                          next: collection.at(index + 1)?.get('url')
                          prev: collection.at(index - 1)?.get('url')

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

        prevLink = nextLink = ''

        if navLinks.url.prev?
          prevLink = """
                     <a href="#{navLinks.url.prev}" title="Previous Post: #{navLinks.title.prev}" class="navlinks-prev">&laquo; #{navLinks.title.prev}</a>
                     """
        if navLinks.url.next?
          nextLink = """
                     <a href="#{navLinks.url.next}" title="Next Post: #{navLinks.title.prev}" class="navlinks-next">#{navLinks.title.next} &raquo;</a>
                     """
        return """
                 <div class="#{styles}">
                   #{prevLink}
                   #{nextLink}
                 </div>
               """
      # Chain
      @