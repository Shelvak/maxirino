jQuery ($)->
  $(document).on 'change', 'input[data-autocomplete-field]', ->
    if /^\s*$/.test($(this).val())
      $(this).next('input[data-autocomplete-receptor]:first').val('')

  $(document).on 'focus', 'input[data-autocomplete-url]:not([data-observed])', ->
    input = $(this)

    input.autocomplete
      source: (request, response)->
        $.ajax
          url: input.data('autocompleteUrl')
          dataType: 'json'
          data: { q: request.term }
          success: (data)->
            response $.map data, (item)->
              content = $('<div></div>')

              content.append $('<span></span>').text(item.label)

              if item.informal
                content.append $('<span class="text-muted"></span>').text(item.informal)

              label: content.html(), value: item.label, item: item
      type: 'get'
      select: (event, ui)->
        selected = ui.item
        target = "[data-autocomplete-receptor=\"#{input.data('autocompleteTarget')}\""

        input.val(selected.value)
        input.data('item', selected.item)
        $(target).val(selected.item.id)

        input.trigger 'autocomplete:update', input

        false
      open: -> $('.ui-menu').css('width', input.width())

    input.data('ui-autocomplete')._renderItem = (ul, item)->
      $('<li></li>').data('item.autocomplete', item).append(
        $('<a></a>').html(item.label)
      ).appendTo(ul)
  .attr('data-observed', true)
