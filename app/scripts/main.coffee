commands = {}
news = {}
azrs = []
$ ->
  $.getJSON('/data/commands.json',(json) ->
    commands = json
    return
  )
  $.getJSON('/data/news.json',(json) ->
    news = json
    return
  )
  for i in [1..3]
    $.get('/data/azrs/#{i}.txt',(data) ->
        azrs.push(data)
    )
  $('#terminal').terminal ((command, term) ->
    if command != ''
      if command of commands
        switch command
            when 'quit'
                term.echo new String('Good bye!')
                window.open('http://www.it-college.ac.jp/')
            when 'help'
                for value,index of commands 
                    term.echo new String('* ' + value + ': ' + index.desc)
            when 'news'
                for value,index of news 
                    term.echo new String('* ' + index.title + ': ' + index.url)
            when 'twitter'
                window.open(commands.twitter.content)
            when 'facebook'
                window.open(commands.facebook.content)
            when 'reload'
                location.reload(true)
            when 'map'
                window.open(commands.map.content)
            when 'ls'
                term.echo new String('Course list:')
                for course in commands.ls.content
                    term.echo new String('* ' + course + '\t') 
            when 'azrs'
                term.echo new String(azrs[Math.floor(Math.random() * azrs.length)])
            else
                term.echo new String(commands[command].content)
      else
        term.error new String('Command Not Found: ' + command)
    else
      term.echo ''
    return
  ),
    greetings: 'Welcome To IT-College Okinawa http://www.it-college.ac.jp\nUsage: help'
    name: 'js_demo'
    height: $(window).height()
    prompt: 'it-college$ '
  return
