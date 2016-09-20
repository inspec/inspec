// Nav Scripts
const $navLinks = $('.main-nav--links');
const $navToggle = $('.main-nav--toggle');
const navBreakpoint = 730; // this should match $nav-breakpoint in _nav.scss

$navToggle.click(function() {
  $(this).toggleClass('is-active');
  $navLinks.slideToggle();
});

$(window).resize(function() {
  if ($(window).width() >= navBreakpoint) {
    $navToggle.removeClass('is-active');
    $navLinks.attr("style", "");
  }
});