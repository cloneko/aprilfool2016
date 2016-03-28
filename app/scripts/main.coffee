commands = {}
news = {}
azrs = []
courses = {}
readcourses = {}
zoo = {}
$ ->
  $.getJSON('/data/commands.json',(json) ->
    commands = json
    courses = json.ls.content
    return
  )
  $.getJSON('/data/news.json',(json) ->
    news = json
    return
  )

  for i in [1..5]
    $.get("/data/azrs/#{i}.txt",(data) ->
        azrs.push(data)
    )
  $('#terminal').terminal ((command, term) ->
    command = command.trim()
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
            when 'last'
                window.open(commands.last.content)
            when 'reload'
                location.reload(true)
            when 'map'
                window.open(commands.map.content)
            when 'ls'
                term.echo new String('Course list:')
                for course in commands.ls.content
                    term.echo new String('* ' + course + '\t') 
            when 'man'
                console.log(readcourses.length)
                term.echo new String('Usage: man coursename') 
                term.echo new String('Example: man networksecurity') 
                term.echo new String('Course list:')
                for course in commands.ls.content
                    term.echo new String('* ' + course + '\t') 
            when 'azrs'
                index = Math.floor(Math.random() * azrs.length)
                term.echo new String(azrs[index])
                zoo[index] = azrs[index]
            when 'zoo'
                count = 0
                for key,aa of zoo
                  term.echo new String(aa)
                  term.echo new String("------")
                  count = count + 1
                rate = Math.round((count / (azrs.length + 1)) * 100)
                term.echo new String("コンプ率: #{rate}%") 
            else
                term.echo new String(commands[command].content)
      else
        if command is "sudo -s" or command is "su -"
          term.set_prompt '⊂ミ⊃＾ω＾ ）⊃# '
        else if command is "?"
            for value,index of commands 
                term.echo new String('* ' + value + ': ' + index.desc)
        else if command.substr(0,3) is 'man' 
          arg = command.split(" ")
          if arg[1] in courses
            $.get("/data/md/#{arg[1]}.md",(data) ->
                term.echo new String("\n#{data}")
            )
            if arg[1] in readcourses
            else
              readcourses[arg[1]] = true
              count = 0;
              for i of readcourses
                count = count + 1
              if count is courses.length
                $.get("/data/azrs/comp.txt",(data) ->
                  zoo["comp"] = data
                )
                term.echo new String("Let's Type zoo!!!!!")
          else
            term.error new String('Man error: そのようなコースはありません') 
        else
          term.error new String('Command Not Found: ' + command)
    else
      term.echo ''
    return
  ),
    greetings: 'Welcome To IT-College Okinawa https://www.it-college.ac.jp\nUsage: help\nまずは「help」と入力してEnterを押してください'
    name: 'js_demo'
    height: $(window).height() - 50
    prompt: 'it-college$ '
  return
