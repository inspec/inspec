// Nav Scripts
const $navLinks = $('.main-nav--links');
const $navToggle = $('.main-nav--toggle');
const navBreakpoint = 730; // this should match $nav-breakpoint in _nav.scss
const $mainContent = $('#main-content');
const $mainNav = $('#main-nav');

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
var footerOffsetTop, navOffsetBottom;

function toggleFixedNavPosition() {
  navOffsetBottom = $mainNav.outerHeight() + $(window).scrollTop();
  footerOffsetTop = $("#main-footer").offset().top;

  $mainNav.toggleClass("is-fixed-bottom", (footerOffsetTop < navOffsetBottom) && $(window).height() <= 759)
}

$(document).ready(function() {
  $mainContent.css('min-height', $mainNav.outerHeight() - $('#main-nav-ctas').outerHeight());
  toggleFixedNavPosition();
});

$(window).scroll(function() {
  toggleFixedNavPosition();
});

