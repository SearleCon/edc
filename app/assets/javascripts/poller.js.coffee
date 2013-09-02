@Poller =
  poll: ->
    setTimeout @request, 5000 * 12

  request: ->
    AjaxHelper.read
     url: '/alerts'
     response: 'script'
