$(function () {
  $('.js-user-profile-switch').click(function(e) {
    e.preventDefault();
    $('.profile-content').hide();
    $('.nav li').removeClass("active");
    $(this.parentNode).addClass("active");
    var target = '#' + $(this).data('target');
    $(target).show();
  });
});
