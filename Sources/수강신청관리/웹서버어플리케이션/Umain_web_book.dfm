object WebModule10: TWebModule10
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/mainproducer'
      Producer = mainProducer
      OnAction = WebModule10DefaultHandlerAction
    end>
  Height = 230
  Width = 415
  object mainProducer: TPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '<title> '#45936#48652#44592#50612' </title>'
      
        '<meta http-equiv="Content-Type" content="text/html; chaset=edu-k' +
        'r">'
      '</head>'
      '<body>'
      '<center><img src ="../pic/logo.gif" height=53 width=397>'
      '<p>'
      '<p>'
      '<h3>'
      '<ul>'
      
        '   <li><a href="http://localhost:81/lec/pweb.exe/course"> '#44053#51340#49548#44060' <' +
        'p></a>'
      
        '   <li><a href="http://localhost:81/lec/pweb.exe/list"> '#44053#51032#51068#51221' <p>' +
        '</a>'
      
        '   <li><a href="http://localhost:81/lec/pweb.exe/accept"> '#49688#44053#49888#52397' <' +
        'p></a>'
      
        '   <li><a href="http://localhost:81/lec/pweb.exe/chkreg"> '#49688#44053#46321#47197#54869#51064 +
        ' <p></a>'
      
        '   <li><a href="http://localhost:81/lec/pweb.exe/chkreg"> '#49688#44053#51217#49688#54869#51064 +
        ' <p></a>'
      
        '   <li><a href="http://localhost:81/lec/pweb.exe/etc"> Q&A <p></' +
        'a>'
      '</UL>'
      '<h3>'
      '</center>'
      '</body>'
      '</html>')
    Left = 56
    Top = 32
  end
end
