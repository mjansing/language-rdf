LanguageRdfView = require './language-rdf-view'

module.exports =
  languageRdfView: null

  activate: (state) ->
    @languageRdfView = new LanguageRdfView(state.languageRdfViewState)

  deactivate: ->
    @languageRdfView.destroy()

  serialize: ->
    languageRdfViewState: @languageRdfView.serialize()
