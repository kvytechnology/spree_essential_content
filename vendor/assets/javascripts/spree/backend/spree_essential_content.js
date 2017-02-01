
// require bootstrap
//= require summernote
// require_tree .


//load summernote
$(document).ready(function() {
    $('.summernote').each(function(i,v) {
      $(v).summernote();
    });
});