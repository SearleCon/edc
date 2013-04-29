@Poller =
  poll: ->
    setTimeout @request, 5000 * 12

  request: ->
    AjaxHelper.read
     url: '/latest_alert'
     response: 'script'
