// Generated by CoffeeScript 1.10.0
(function() {
  jQuery(function() {
    var now;
    now = new Date();
    if (sessionStorage.getItem("april") === null) {
      sessionStorage.setItem("april", true);
    }
    if ((now.getMonth() + 1) === 4) {
      if (now.getDate() === 1 && sessionStorage.getItem("april") === "true") {
        alert("黒い画面は怖くないよ!");
        sessionStorage.setItem("april", false);
        return window.location.href = "http://20160401.it-college.ac.jp/";
      } else {
        return jQuery("ul.nav-root li:first").after('<li><strong><a href="http://20160401.it-college.ac.jp/" target="_blank">2016/04/01</a></strong></li>');
      }
    } else {
      return console.log("Today is not 0401");
    }
  });

}).call(this);
