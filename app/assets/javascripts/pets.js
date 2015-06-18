// $(document).ready(function() {
//   $("#button-fetch").on("click", function() {
//     $.ajax({
//       type: 'GET',
//       url: 'https://api.twitter.com/1.1/search/tweets.json?q=lostdog%20denver',
//       success: function(tweets) {
//           $.each(tweets, function(index, tweet) {
//
//             $(".lost_pet_tweets").append(
//               "<div class='lost_pet_tweet'><h6>Published on " +
//                tweet.created_at +
//                "</h6><p>" +
//                tweet.text +
//                "</p></div>")
//         })
//       }
//     })
//   })
// }
//
//
//
// $("#create-city").on('click', function(){
//   var cityParams = { : { description: $("#post-description").val() } }
//
//   $.ajax({
//     type: 'POST',
//     url: 'https://turing-birdie.herokuapp.com/api/v1/posts.json',
//     data: postParams,
//     success: function(newPost) {
//       appendPost(newPost)
//     }
//   })
// })
