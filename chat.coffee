Items = new Meteor.Collection("items")

if Meteor.is_client

  # pad str with a leading 0 if it's only 1 character
  zeroPad = (num) ->
    str = '' + num
    if str.length == 1 then '0' + str else str

  Template.transcript.items = -> Items.find()
  
  Template.entry.events =
    'submit #send': (event) ->
      event.preventDefault()
      text = $('#new_chat').val()
      if text
        Items.insert(text: text, date: new Date())
        $('#new_chat').val('')

  Template.item.formattedTime = ->
    d = new Date(this.date)
    zeroPad(d.getHours()) + ':' + zeroPad(d.getMinutes()) + ':' + zeroPad(d.getSeconds())