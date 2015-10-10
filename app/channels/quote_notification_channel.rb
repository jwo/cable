class QuoteNotificationChannel < ApplicationCable::Channel
   def subscribed
     stream_from "quote_notifications"
   end
 end
