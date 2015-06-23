jQuery.fn.autolink = function() {
  return this.each(function() {
    var re = /(^|\s)(((([^:\/?#\s]+):)?\/\/)?(([A-Za-z0-9-]+\.)+[A-Za-z0-9-]+)(:\d+)?([^?#\s]*)(\?([^#\s]*))?(#(\S*))?)/g;
    $(this).html($(this).html().replace(re,
                                        function(match, optionalWhitespace, uri, scheme, p4, protocol) {
                                          return (optionalWhitespace ? optionalWhitespace : '')
                                          + '<a href="' + (protocol ? uri : 'http://' + uri)
                                          + '" target="_blank">' + uri + '<\/a>';
                                        }) );
  });
}

var template = '' +
  '<li class="lost-tweet">' +
    '<div class="tweet">' +
      '<img class="tweet-image" />' +
      '<div class="tweet-container">' +
        '<span class="tweet-text"></span>' +
        '<span class="tweet-byline">' +
          'Posted By <a class="tweet-user"></a> on <span class="tweet-time"></span>' +
        '</span>' +
      '</div>' +
      '<div class="clear"></div>' +
    '</div>' +
  '</li>'

function fetchLostPets() {
  $.ajax({
    type: 'GET',
    url: '/tweets/lost_ajax',
    success: function(tweets) {
      var list = $('#tweet-list')
      tweets.forEach(function(tweet) {
        var block = $(template)
        block.find('.tweet-text').text(tweet.text).autolink()
        block.find('.tweet-user').attr('href', 'https://twitter.com/' + tweet.screen_name).text('@' + tweet.screen_name)
        block.find('.tweet-time').text(tweet.posted_at)
        list.append(block)
      })
      $(".spinner").fadeOut("slow")
    }
  })
}

function fetchFoundPets() {
  $.ajax({
    type: 'GET',
    url: '/tweets/found_ajax',
    success: function(tweets) {
      var list = $('#tweet-list')
      tweets.forEach(function(tweet) {
        var block = $(template)
        block.find('.tweet-text').text(tweet.text).autolink()
        block.find('.tweet-user').attr('href', 'https://twitter.com/' + tweet.screen_name).text('@' + tweet.screen_name)
        block.find('.tweet-time').text(tweet.posted_at)
        list.append(block)
      })
    }
  })
}
