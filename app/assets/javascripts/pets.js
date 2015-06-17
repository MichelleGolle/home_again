$(document).ready(function() {
  $("#button-fetch").on("click", function() {
    $.ajax({
      type: 'GET',
      url: 'https://api.twitter.com/1.1/search/tweets.json?q=lostdog%20denver',
      success: function(tweets) {
          $.each(tweets, function(index, tweet) {

            $(".lost_pet_tweets").append(
              "<div class='lost_pet_tweet'><h6>Published on " +
               tweet.created_at +
               "</h6><p>" +
               tweet.text +
               "</p></div>")
        })
      }
    })
  })
}
