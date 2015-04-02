#= require underscore

class IdPropertyValidator
  constructor: (@isValidId) ->
  isValid: (object, propeties) ->
    _.every propeties, (property) => @isValidId object[property]

# TODO: Find a better way to export dependencies
window.igniite.IdPropertyValidator = IdPropertyValidator