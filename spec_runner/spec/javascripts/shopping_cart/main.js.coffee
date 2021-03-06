extendClass 'specs.ShoppingCartSpec', (spec)->
  initialize: ->
    @createFakeServer()
    @extend this, new specs.oojspec.AjaxHelpers(@fakeServer)

  runSpecs: ->
    @beforeAll -> @fakeServer.start()
    @afterAll -> @fakeServer.stop()
    @before -> @fakeServer.ignoreAllRequests()

    @it 'passes', ->
      @expect(@fakeServer).toBeDefined()
