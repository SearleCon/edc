@Poller =
  poll: ->
    setTimeout @request, 500 * 12

  request: ->
    AjaxHelper.read
     url: '/alerts'
     response: 'script'
