# App.quoteNotification = App.cable.subscriptions.create "QuoteNotificationChannel",
#   connected: ->
#     # Called once the subscription has been successfully completed
#   received: (data) ->
#     console.log("data received", data)
#
#   appear: ->
#     console.log("appear")
#     @perform 'appear', appearing_on: @appearingOn()
#
#   away: ->
#     @perform 'away'
#
#   appearingOn: ->
#     console.log("appearingOn")
#     $('main').data 'appearing-on'
#
# $(document).on 'page:change', ->
#   App.quoteNotification.appear()
#
# $(document).on 'click', '[data-behavior~=appear_away]', ->
#   App.quoteNotification.away()
#   false
