Items = new Meteor.Collection("items")

if Meteor.is_client
  Template.transcript.items = -> Items.find()
  
  Template.entry.events =
    'submit #send': (event) ->
      event.preventDefault()
      text = $('#new_chat').val()
      if text
        Items.insert(text: text, date: new Date())
        $('#new_chat').val('')
