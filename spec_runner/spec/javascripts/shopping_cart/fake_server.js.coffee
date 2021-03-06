# =require fake_ajax_server

createProducts = -> [
  {id: 1, name: 'One'}
  {id: 2, name: 'Two'}
]

extendClass 'specs.ShoppingCartSpec', ->
  createFakeServer: ->
    @fakeServer = new FakeAjaxServer (url, settings)->
      if settings then settings.url = url else settings = url
      handled = false
      switch settings.dataType
        when 'json' then switch settings.type
          when 'get' then switch settings.url
            when '/products' then handled = true; settings.success createProducts()
#         when 'post' then switch settings.url
#           when ...
#       when undefined then switch settings.type
#         when 'get' then switch settings.url
#           when ...
#         when 'post' then switch settings.url
#           when ...
      return if handled
      console.log arguments
      throw "Unexpected AJAX call: #{settings.url}"
