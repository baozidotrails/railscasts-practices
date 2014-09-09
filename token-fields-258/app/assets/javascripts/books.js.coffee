jQuery ->
  $('#book_author_token').tokenInput '/authors.json',
    theme: 'facebook',
    prePopulate: $('#book_author_token').data('load')