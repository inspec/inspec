
/* CSS primitives */
function addCssClass(id, cls) {
  document.getElementById(id).className += (" " + cls);
}

function removeCssClass(id, cls) {
  var el = document.getElementById(id);
  var classes = el.className.replace(cls,'');
  el.className = classes;
}

function handleShowSource(evt) {
  var control_id = evt.srcElement.id.replace("show-code-", "")
  addCssClass(evt.srcElement.id, "hidden")
  removeCssClass("hide-code-" + control_id, "hidden")
  removeCssClass("source-code-" + control_id, "hidden")
}

function handleHideSource(evt) {
  var control_id = evt.srcElement.id.replace("hide-code-", "")
  addCssClass(evt.srcElement.id, "hidden")
  addCssClass("source-code-" + control_id, "hidden")
  removeCssClass("show-code-" + control_id, "hidden")
}

function handleSelectorChange(evt) {
  var should_show = evt.srcElement.checked
  var which_group = evt.srcElement.id.replace("-checkbox","")
  var controls = document.getElementsByClassName("control-status-" + which_group)
  var i;
  if (should_show) {
    for (i = 0; i < controls.length; i++) {
      removeCssClass(controls[i].id, "hidden")
    }
  } else {
    for (i = 0; i < controls.length; i++) {
      addCssClass(controls[i].id, "hidden")
    }
  }
}

function handleChildProfileChange(evt) {
  var should_show = evt.srcElement.checked
  var child_profiles = document.getElementsByClassName("child-profile")
  var i;
  if (should_show) {
    for (i = 0; i < child_profiles.length; i++) {
      removeCssClass(child_profiles[i].id, "hidden")
    }
  } else {
    for (i = 0; i < child_profiles.length; i++) {
      addCssClass(child_profiles[i].id, "hidden")
    }
  }
}

/* Main entry point */
function  pageLoaded() {
  var i;

  // wire up show source links
  var show_links = document.getElementsByClassName("show-source-code");
  for (i = 0; i < show_links.length; i++) {
    show_links[i].onclick = handleShowSource;
  }
  // wire up hide source links
  var hide_links = document.getElementsByClassName("hide-source-code");
  for (i = 0; i < hide_links.length; i++) {
    hide_links[i].onclick = handleHideSource;
  }
  // wire up selector checkboxes
  var selectors = document.getElementsByClassName("selector-checkbox");
  for (i = 0; i < selectors.length; i++) {
    selectors[i].onchange = handleSelectorChange;
  }
  // wire up child profile checkbox
  document.getElementById("child-profile-checkbox").onchange = handleChildProfileChange;
}
