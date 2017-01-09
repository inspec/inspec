// Nav Scripts
const navBreakpoint = 710;
const $mainNav = $('#main-nav');
const $navLinks = $('.main-nav--link-text');
const $navToggle = $('.main-nav--toggle');
const currentPagePath = location.pathname;
const navPageLinks = [ 'docs', 'tutorials', 'community'];
const stickyBreakpoint = 120;
const stickyVisibleBreakpoint = 160;


$navToggle.click(function() {
  $navLinks.slideToggle();
  $mainNav.toggleClass('t-purple');
});

for (var linkName in navPageLinks) {
  var linkNamePath = navPageLinks[linkName],
      currentPageRoot = currentPagePath.split('/')[1];
  if (currentPageRoot == linkNamePath) {
    $('a.main-nav--link-text' + navPageLinks[linkName]).addClass('t-purple');
  }
};



// handle nav when global message exists
// gm_session_id is set on at template level
//var globalMessageHeight;
//const $globalMessage = $("#global-message");

//function adjustNavPosition() {
//  globalMessageHeight = $globalMessage.outerHeight();

//  if ($globalMessage.is(":visible")) {
//    $mainNav.css('top', globalMessageHeight);
//    $mainNavCtas.css('top', globalMessageHeight);
//    $mainContent.css('margin-top', globalMessageHeight + 100);
//  }
//}

//if(!localStorage.getItem(gm_session_id)) {
//  $globalMessage.addClass('is-visible');
//  adjustNavPosition();
//}

//$(document).ready(function() {
//  $("#global-message .dismiss-button").click(function(e) {
//    $globalMessage.removeClass('is-visible')
//    $mainNav.css('top', '');
//    $mainNavCtas.css('top', '');
//    $mainContent.css('margin-top', 100);
//    localStorage.setItem(gm_session_id, "true");
//    return false;
//  });
//});

//$(window).resize(function() {
//  if(!localStorage.getItem(gm_session_id)) {
//    adjustNavPosition();
//  }
//});
