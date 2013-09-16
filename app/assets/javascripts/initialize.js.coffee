# Execute page specific javascripts eg. Users index will call index method on users.js.coffee
(($, undefined_) ->
  $ ->
    $body = $("body")
    controller = $body.data("controller").replace(/\//g, "_")
    action = $body.data("action")
    activeController = Edc[controller]
    if activeController isnt `undefined`
      activeController.init()  if $.isFunction(activeController.init)
      activeController[action]()  if $.isFunction(activeController[action])

) jQuery



$('#notes').infinitescroll
  loading:
    finishedMsg: ""
    msgText: "<em>Loading ...</em>"
  navSelector: "nav.pagination"
  nextSelector: "nav.pagination a[rel=next]"
  itemSelector: ".note"


Temporal.detect()

$ ->
 Poller.poll()

 $('#notes').infinitescroll
  loading:
    finishedMsg: ""
    msgText: "<em>Loading ...</em>"
  navSelector: "nav.pagination"
  nextSelector: "nav.pagination a[rel=next]"
  itemSelector: ".note"