// Nav Scripts
const $navLinks = $('.main-nav--links');
const $navToggle = $('.main-nav--toggle');
const navBreakpoint = 730; // this should match $nav-breakpoint in _nav.scss
const $mainContent = $('#main-content');
const $mainNav = $('#main-nav');

$(document).ready(function() {
  $mainContent.css('min-height', $mainNav.outerHeight() - $('#main-nav-ctas').outerHeight());
});

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

// toggles fixed nav position when the window is too short
const footerOffsetTop = $("#main-footer").offset().top;
var navOffsetBottom;

function toggleFixedNavPosition() {
  navOffsetBottom = $mainNav.outerHeight() + $(window).scrollTop();

  $mainNav.toggleClass("is-fixed-bottom", footerOffsetTop < navOffsetBottom)
}

toggleFixedNavPosition();

$(window).scroll(function() {
  toggleFixedNavPosition();
});
