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

# Bootstrap confirmation boxes
$.rails.allowAction = (link) ->
  return true  unless link.attr("data-confirm")
  $.rails.showConfirmDialog link
  false

$.rails.confirmed = (link) ->
  link.removeAttr "data-confirm"
  link.trigger "click.rails"

$.rails.showConfirmDialog = (link) ->
  html = undefined
  message = undefined
  message = link.attr("data-confirm")
  html = "<div class=\"modal\" id=\"confirmationDialog\">\n  <div class=\"modal-header\">\n    <a class=\"close\" data-dismiss=\"modal\">X<a>\n    <h3>Confirm delete</h3>\n  </div>\n  <div class=\"modal-body\">\n    <p>" + message + "</p>\n  </div>\n  <div class=\"modal-footer\">\n    <a data-dismiss=\"modal\" class=\"btn\">Cancel</a>\n    <a data-dismiss=\"modal\" class=\"btn btn-primary confirm\">OK</a>\n  </div>\n</div>"
  $(html).modal()
  $("#confirmationDialog .confirm").on "click", ->
    $.rails.confirmed link


# Infinite Scrolling - When link is inview on page calls the object index path to fetch records
$(document).on 'inview', 'a.hook', ->
  $.getScript $(this).attr('href')





$ ->
 Poller.poll()
 $("a.toggles").click ->
    $("a.toggles i").toggleClass "icon-chevron-left icon-chevron-right"
    $("#sidebar").animate
      width: "toggle", 0
    $("#main_view").toggleClass "span11 span9"
    $("#main_view").toggleClass "no-sidebar"