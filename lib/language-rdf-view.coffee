{View} = require 'atom'

module.exports =
class LanguageRdfView extends View
  @content: ->
    @div class: 'language-rdf overlay from-top', =>
      @div "The LanguageRdf package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "language-rdf:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "LanguageRdfView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
