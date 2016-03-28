// Generated by CoffeeScript 1.10.0
var azrs, commands, courses, news, readcourses, zoo,
  indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

commands = {};

news = {};

azrs = [];

courses = {};

readcourses = {};

zoo = {};

$(function() {
  var i, j;
  $.getJSON('/data/commands.json', function(json) {
    commands = json;
    courses = json.ls.content;
  });
  $.getJSON('/data/news.json', function(json) {
    news = json;
  });
  for (i = j = 1; j <= 5; i = ++j) {
    $.get("/data/azrs/" + i + ".txt", function(data) {
      return azrs.push(data);
    });
  }
  $('#terminal').terminal((function(command, term) {
    var aa, arg, count, course, index, k, key, l, len, len1, rate, ref, ref1, ref2, ref3, value;
    command = command.trim();
    if (command !== '') {
      if (command in commands) {
        switch (command) {
          case 'quit':
            term.echo(new String('Good bye!'));
            window.open('http://www.it-college.ac.jp/');
            break;
          case 'help':
            for (value in commands) {
              index = commands[value];
              term.echo(new String('* ' + value + ': ' + index.desc));
            }
            break;
          case 'news':
            for (value in news) {
              index = news[value];
              term.echo(new String('* ' + index.title + ': ' + index.url));
            }
            break;
          case 'twitter':
            window.open(commands.twitter.content);
            break;
          case 'facebook':
            window.open(commands.facebook.content);
            break;
          case 'last':
            window.open(commands.last.content);
            break;
          case 'reload':
            location.reload(true);
            break;
          case 'map':
            window.open(commands.map.content);
            break;
          case 'ls':
            term.echo(new String('Course list:'));
            ref = commands.ls.content;
            for (k = 0, len = ref.length; k < len; k++) {
              course = ref[k];
              term.echo(new String('* ' + course + '\t'));
            }
            break;
          case 'man':
            console.log(readcourses.length);
            term.echo(new String('Usage: man coursename'));
            term.echo(new String('Example: man networksecurity'));
            term.echo(new String('Course list:'));
            ref1 = commands.ls.content;
            for (l = 0, len1 = ref1.length; l < len1; l++) {
              course = ref1[l];
              term.echo(new String('* ' + course + '\t'));
            }
            break;
          case 'azrs':
            index = Math.floor(Math.random() * azrs.length);
            term.echo(new String(azrs[index]));
            zoo[index] = azrs[index];
            break;
          case 'zoo':
            count = 0;
            for (key in zoo) {
              aa = zoo[key];
              term.echo(new String(aa));
              term.echo(new String("------"));
              count = count + 1;
            }
            rate = Math.round((count / (azrs.length + 1)) * 100);
            term.echo(new String("コンプ率: " + rate + "%"));
            break;
          default:
            term.echo(new String(commands[command].content));
        }
      } else {
        if (command === "sudo -s" || command === "su -") {
          term.set_prompt('⊂ミ⊃＾ω＾ ）⊃# ');
        } else if (command === "?") {
          for (value in commands) {
            index = commands[value];
            term.echo(new String('* ' + value + ': ' + index.desc));
          }
        } else if (command.substr(0, 3) === 'man') {
          arg = command.split(" ");
          if (ref2 = arg[1], indexOf.call(courses, ref2) >= 0) {
            $.get("/data/md/" + arg[1] + ".md", function(data) {
              return term.echo(new String("\n" + data));
            });
            if (ref3 = arg[1], indexOf.call(readcourses, ref3) >= 0) {

            } else {
              readcourses[arg[1]] = true;
              count = 0;
              for (i in readcourses) {
                count = count + 1;
              }
              if (count === courses.length) {
                $.get("/data/azrs/comp.txt", function(data) {
                  return zoo["comp"] = data;
                });
                term.echo(new String("Unlock EXTRA AZRS!!! Let's Type zoo!!!!!"));
              }
            }
          } else {
            term.error(new String('Man error: そのようなコースはありません'));
          }
        } else {
          term.error(new String('Command Not Found: ' + command));
        }
      }
    } else {
      term.echo('');
    }
  }), {
    greetings: 'Welcome To IT-College Okinawa https://www.it-college.ac.jp\nUsage: help\nまずは「help」と入力してEnterを押してください',
    name: 'js_demo',
    height: $(window).height() - 50,
    prompt: 'it-college$ '
  });
});
