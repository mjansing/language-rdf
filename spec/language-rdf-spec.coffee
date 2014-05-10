{WorkspaceView} = require 'atom'
LanguageRdf = require '../lib/language-rdf'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "LanguageRdf", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('language-rdf')

  describe "when the language-rdf:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.language-rdf')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'language-rdf:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.language-rdf')).toExist()
        atom.workspaceView.trigger 'language-rdf:toggle'
        expect(atom.workspaceView.find('.language-rdf')).not.toExist()
