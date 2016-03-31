jQuery ->
    now = new Date()
    if sessionStorage.getItem("april") is null
        sessionStorage.setItem("april",true)
    

    if (now.getMonth()+1) is 4
        if now.getDate() is 1 and sessionStorage.getItem("april") is "true"
            alert "黒い画面は怖くないよ!"
            sessionStorage.setItem("april",false)
            window.location.href = "http://20160401.it-college.ac.jp/"
        else
           jQuery("ul.nav-root li:first").after('<li><strong><a href="http://20160401.it-college.ac.jp/" target="_blank">2016/04/01</a></strong></li>') 
    else
      console.log("Today is not 0401")
