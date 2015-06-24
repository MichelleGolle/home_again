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
      '<div class="tweet-image-wrapper">' +
        '<img class="tweet-image" />' +
      '</div>' +
      '<div class="tweet-container">' +
        '<span class="tweet-text"></span>' +
        '<span class="tweet-byline">' +
          'Posted By <a class="tweet-user"></a> on <span class="tweet-time"></span>' +
        '</span>' +
      '</div>' +
      '<div class="clear"></div>' +
    '</div>' +
  '</li>'

function fetchLostPets(city) {
  city = arguments.length === 0 ? '' : city
  var list = $('#tweet-list')
  var spinner = $('.spinner')
  list.empty()
  spinner.fadeIn('slow')
  $.ajax({
    type: 'GET',
    url: '/tweets/lost_ajax?city=' + city,
    success: function(tweets) {
      tweets.forEach(function(tweet) {
        var block = $(template)
        block.find('.tweet-text').text(tweet.text).autolink()
        block.find('.tweet-user').attr('href', 'https://twitter.com/' + tweet.screen_name).text('@' + tweet.screen_name)
        block.find('.tweet-time').text(tweet.posted_at)
        if (tweet.image === null) {
          block.find('.tweet-image-wrapper').hide()
        } else {
          block.find('.tweet-image').attr('src', tweet.image)
        }
        list.append(block)
      })
      spinner.fadeOut('slow')
    }
  })
}

function fetchFoundPets(city) {
  city = arguments.length === 0 ? '' : city
  var list = $('#tweet-list')
  var spinner = $('.spinner')
  list.empty()
  spinner.fadeIn('slow')
  $.ajax({
    type: 'GET',
    url: '/tweets/found_ajax?city=' + city,
    success: function(tweets) {
      var list = $('#tweet-list')
      tweets.forEach(function(tweet) {
        var block = $(template)
        block.find('.tweet-text').text(tweet.text).autolink()
        block.find('.tweet-user').attr('href', 'https://twitter.com/' + tweet.screen_name).text('@' + tweet.screen_name)
        block.find('.tweet-time').text(tweet.posted_at)
        if (tweet.image === null) {
          block.find('.tweet-image-wrapper').hide()
        } else {
          block.find('.tweet-image').attr('src', tweet.image)
        }
        list.append(block)
      })
      spinner.fadeOut('slow')
    }
  })
}
