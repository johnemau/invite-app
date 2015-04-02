isValidId = (object) ->
    typeof object is 'number' and object > -1

# TODO: Find a better way to export dependencies
window.igniite.isValidId = isValidId