object WebModule5: TWebModule5
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'WebActionItem1'
      PathInfo = '/MainProducer'
      Producer = MainProducer
    end
    item
      Name = 'WebActionItem2'
      PathInfo = '/Course'
      Producer = courseProducer
    end
    item
      Name = 'WebActionItem3'
      PathInfo = '/list'
      OnAction = WebModule5WebActionItem3Action
    end
    item
      Name = 'WebActionItem4'
      PathInfo = '/Date'
      OnAction = WebModule5WebActionItem4Action
    end
    item
      Name = 'WebActionItem5'
      PathInfo = '/Reg'
      OnAction = WebModule5WebActionItem5Action
    end>
  Height = 364
  Width = 440
  object MainProducer: TPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '<title> '#45936#48652#44592#50612' </title>'
      
        '<meta http-equiv="Content-Type" content="text/html; chaset=edu-k' +
        'r">'
      '</head>'
      '<body>'
      '<center><img src ="./pic/logo.gif" height=53 width=397>'
      '<p>'
      '<p>'
      '<h3>'
      '<ul>'
      
        '   <li><a href="http://localhost:81/lec/pweb.exe/course"> '#44053#51340#49548#44060' <' +
        'p></a>'
      
        '   <li><a href="http://localhost:81/lec/pweb.exe/list"> '#44053#51032#51068#51221' <p>' +
        '</a>'
      
        '   <li><a href="http://localhost:81/lec/pweb.exe/reg"> '#49688#44053#49888#52397' <p><' +
        '/a>'
      
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
      '</html>'
      ''
      '')
    Left = 40
    Top = 32
  end
  object courseProducer: TPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '<title> '#45936#48652#44592#50612'</title>'
      
        '<meta http-equiv="content-type" content="text/html; charset=edu-' +
        'kr">'
      '</head>'
      '<body>'
      
        ' <table  width = "300" border="0" cellspacing="0" cellpadding="0' +
        '" align="left">'
      '   <tr>'
      '     <td valign="left height="16">'
      
        '        < a href="http://localhost:81/lec/pweb.exe"><img src=" .' +
        './pic/logo.gif" width=45 height=45 border-0></a><br><br>'
      '     </td>'
      '   </tr>'
      '   <tr>'
      '     <td valign="top height="16">'
      '        < img src=" ../pic/updates.gif">'
      '     </td>'
      '   </tr>'
      '   <tr>'
      '   <td gbcolor = "#cccccc" valign="top" height="16">'
      '     <a href="delphi01_01.jsp">1. '#45944#54028#51060' '#52488#44553#44284#51221'</span></a><br>'
      '     '#45944#54028#51060#51032' '#50724#48652#51229#53944' '#54028#49828#52860#51012' '#44592#52488#47196' '#44060#52404#50752' '#53364#47000#49828#47484' '#49324#50857#54616#50668'<br>'
      '     '#54532#47196#44536#47000#48141' '#51089#49457#48169#48277#44284' '#45936#51060#53552#48288#51060#49828' '#50612#54540#47532#52992#51060#49496' '#54532#47196#44536#47000#48141#51012'<br>'
      '     '#51089#49457#54616#47728' '#48176#50864#45716' '#44284#51221'<br><br>'
      '     <a href="delphi01_02.jsp">2. '#45944#54028#51060' '#51473#44553#44284#51221'</span></a><br>'
      '     '#45944#54028#51060#51032' DBExpress'#47484' '#51060#50857#54616#50668' C/S '#54872#44221#51032' '#50612#54540#47532#52992#51060#49496' '#51089#49457#44284' <br>'
      '     '#48516#49328#52376#47532'(3 Tier) '#51089#49457#48143' '#48372#44256#49436' '#51089#49457', '#52980#54252#45324#53944' '#51089#49457#46321#51012' '#48176#50864#45716#44284#51221'<br>'
      '  </td>'
      '  </tr>'
      '  </table>'
      '</body>'
      '</html>')
    Left = 128
    Top = 32
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'LECPROJECT'
    DriverName = 'INTERBASE'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxint.dll'
    LoginPrompt = False
    Params.Strings = (
      'drivername=INTERBASE'
      'blobsize=-1'
      'commitretain=False'
      'Database=d:\projectdb.ib'
      'localecode=0000'
      'password=masterkey'
      'rolename=RoleName'
      'sqldialect=3'
      'isolationlevel=ReadCommitted'
      'user_name=sysdba'
      'waitonlocks=True'
      'trim char=False')
    VendorLib = 'gds32.dll'
    Left = 48
    Top = 88
  end
  object query_kindcount: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select kind'
      'from curri'
      'group by kind')
    SQLConnection = SQLConnection1
    Left = 128
    Top = 96
  end
  object Query_curriname: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'p_kind'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from curri'
      'where kind =:p_kind')
    SQLConnection = SQLConnection1
    Left = 128
    Top = 160
  end
  object ListProducer: TPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '<title> '#45936#48652#44592#50612' </title>'
      
        '<meta http-equiv="content-type" content="text/html; charset=edu-' +
        'kr">'
      '</head>'
      '<body>'
      
        ' <table  width = "300" border="0" cellspacing="0" cellpadding="0' +
        '" align="left">'
      '    <tr>'
      '      <td valign="left" height="16">'
      '          <a href="http://localhost:81/lec/pweb.exe">'
      
        '             <img src="../PIC/logo.gif" width="60" height="60" b' +
        'order="0"></a><br><br><br>'
      '      </td>'
      '    </tr>'
      '   <tr>'
      '     <td>'
      '     <H5>'
      '     '#44368#50977' '#44284#51221#51012' '#49440#53469#54616#49464#50836' !'
      '     <hr align=left width=50% size=3>'
      '     </h5>'
      '     </td>'
      '   </tr>'
      '   <tr>'
      '     <td>'
      '        <#currilist>'
      '     </td>'
      '   </tr>'
      '</table>'
      '</body>'
      '</html>')
    OnHTMLTag = ListProducerHTMLTag
    Left = 200
    Top = 32
  end
  object Query_curridate: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'p_code'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from curritb'
      'where ctcode like :p_code'
      'order by start')
    SQLConnection = SQLConnection1
    Left = 48
    Top = 152
    object Query_curridateCTCODE: TStringField
      FieldName = 'CTCODE'
      Required = True
      FixedChar = True
      Size = 5
    end
    object Query_curridateSTART: TSQLTimeStampField
      FieldName = 'START'
      Required = True
      DisplayFormat = 'yyyy-mm-dd'
    end
    object Query_curridateLIMIT: TIntegerField
      FieldName = 'LIMIT'
    end
    object Query_curridatePCOUNT: TIntegerField
      FieldName = 'PCOUNT'
    end
    object Query_curridatePRICE: TIntegerField
      FieldName = 'PRICE'
    end
    object Query_curridateTEACHER: TStringField
      FieldName = 'TEACHER'
      Size = 10
    end
    object Query_curridateDURING: TIntegerField
      FieldName = 'DURING'
    end
    object Query_curridateROOM: TIntegerField
      FieldName = 'ROOM'
    end
  end
  object curridateproducer: TSQLQueryTableProducer
    Columns = <
      item
        FieldName = 'START'
        Title.BgColor = '#80FFFF'
        Title.Caption = #49884#51089#51068
      end
      item
        BgColor = '#FFFF80'
        FieldName = 'DURING'
        Title.BgColor = '#80FFFF'
        Title.Caption = #44592#44036'('#51068#49688')'
      end
      item
        FieldName = 'TEACHER'
        Title.BgColor = '#80FFFF'
      end>
    Footer.Strings = (
      '</td>'
      '  </tr>'
      '</table>'
      '</body>'
      '</html>')
    Header.Strings = (
      '<html>'
      '<head>'
      '<title> '#45936#48652#44592#50612' </title>'
      
        '<meta http-equiv="content-type" content="text/html; charset=edu-' +
        'kr">'
      '</head>'
      '<body>'
      
        ' <table  width = "300" border="0" cellspacing="0" cellpadding="0' +
        '" align="left">'
      '    <tr>'
      '      <td valign="left" height="16">'
      '          <a href="http://localhost:81/lec/pweb.exe">'
      
        '             <img src="../PIC/logo.gif" width="60" height="60" b' +
        'order="0"></a><br><br><br>'
      '      </td>'
      '    </tr>'
      '   <tr>'
      '     <td>'
      '     <H5>'
      '     '#49688#44053' '#51068#51221#51012' '#54869#51064#54616#49464#50836' !'
      '     <hr align=left width=50% size=3>'
      '     </h5>'
      '     </td>'
      '   </tr>'
      '   <tr>'
      '     <td>')
    Query = Query_curridate
    TableAttributes.Border = 1
    OnFormatCell = curridateproducerFormatCell
    Left = 272
    Top = 32
  end
  object acceptproducer: TPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '<title></title>'
      
        '<meta http-equiv="Content-Type" content="text/html; dataset=edu-' +
        'kr">'
      '<script language ="JavaScript">'
      '   function chkfield() {'
      '    if (document.myform.name.value == ""){'
      '       alert("'#51060#47492#51060' '#51077#47141#46104#51648' '#50506#50520#49845#45768#45796'");'
      '       document.myform.name.focus();'
      '       return;'
      '       }'
      '    if (document.myform.pno.value == ""){'
      '       alert("'#51452#48124#46321#47197#48264#54840#44032' '#51077#47141#46104#51648' '#50506#50520#49845#45768#45796'");'
      '       document.myform.pno.focus();'
      '       return;'
      '       }'
      '    if (document.myform.tel.value == ""){'
      '       alert("'#51204#54868#48264#54840#44032' '#51077#47141#46104#51648' '#50506#50520#49845#45768#45796'");'
      '       document.myform.tel.focus();'
      '       return;'
      '       }'
      '       document.myform.submit();'
      '    }'
      '</script>'
      '</head>'
      '<body>'
      
        '  <table width ="300" border="0" cellspacing="0" cellpadding="0"' +
        ' align="left">'
      '    <tr>'
      '      <td valign="left" height="16">'
      '          <a href="http://localhost:81/lec/pweb.exe">'
      
        '             <img src="../PIC/logo.gif" width="60" height="60" b' +
        'order="0"></a><br><br><br>'
      '      </td>'
      '    </tr>'
      '    <tr>'
      '      <td>'
      '        <h5>'
      '        '#49688#44053' '#49888#52397#49436#47484#51012' '#51089#49457#54616#50668' '#51452#49901#49884#50724'.<p>'
      '        (*'#54364#49884#45716' '#48152#46300#49884' '#51077#47141#54616#50668' '#51452#49901#49884#50724')'
      '        <hr align=left width=50% size=3>'
      '        </h5>'
      '      </td>'
      '    </tr>'
      '    <tr>'
      '      <td>'
      
        '      <form name="myform" method="post" action="./reg?option=wri' +
        'te">'
      '      <table width=570 border=0 cellspacing=2 cellpadding=3>'
      '      <#selectcode>'
      '      <tr>'
      
        #9'  <th width="150" bgcolor="#990000" align="right"><font size =2' +
        '>'#51060#47492'*</font></th>'
      
        #9'  <td width="500"><input type="text" size="10" maxlength="10" n' +
        'ame="name"></td>'
      '      </tr>'
      '      <tr>'
      
        #9'  <th width="150" bgcolor="#990000" align="right"><font size=2>' +
        #51452#48124#46321#47197#48264#54840'*</font></th>'
      
        #9'  <td width="500"><input type="text" size="13" maxlength="13" n' +
        'ame="pno"></td>'
      '      </tr>'
      '      <tr>'
      
        #9'  <th width="150" bgcolor="#990000" align="right"><font size=2>' +
        #51204#54868#48264#54840'*</font></th>'
      
        #9'  <td width= 500><input type="text" size="15" maxlength="15" na' +
        'me="tel"></td>'
      '      </tr>'
      '      <tr>'
      
        #9'  <th width="150" bgcolor="#990000" align="right"><font size=2>' +
        #49345#54840#47749'</font></th>'
      
        #9'  <td width= 500><input type="text" size="30" maxlength="30" na' +
        'me="company"></td>'
      '      </tr>'
      '      <tr>'
      
        #9'  <th width="150" bgcolor="#990000" align="right"><font size=2>' +
        #49324#50629#51088#46321#47197#48264#54840'</font></th>'
      
        #9'  <td width= 500><input type="text" size="10" maxlength="10" na' +
        'me="ccode"></td>'
      '      </tr>'
      '      <tr>'
      
        #9'  <th width="150" bgcolor="#990000" align="right"><font size=2>' +
        #45824#54364#47749'</font></th>'
      
        #9'  <td width= 500><input type="text" size="10" maxlength="10" na' +
        'me="cboss"></td>'
      '      </tr>'
      '      <tr>'
      
        #9'  <th width="150" bgcolor="#990000" align="right"><font size=2 ' +
        '>'#54924#49324#51452#49548'</font></th>'
      
        #9'  <td width= 500><input type="text" size="50" maxlength="50" na' +
        'me="caddr"></td>'
      '      </tr>'
      '      <tr>'
      
        #9'  <th width="150" bgcolor="#990000" align="right"><font size=2>' +
        #54924#49324#51204#54868'</font></th>'
      
        #9'  <td width= 500><input type="text" size="15" maxlength="15" na' +
        'me="ctel"></td>'
      '      </tr>'
      '      <tr>'
      
        #9'  <th width="150" bgcolor="#990000" align="right"><font size=2>' +
        'FAX</font></th>'
      
        #9'  <td width= 500><input type="text" size="15" maxlength="15" na' +
        'me="cfax"></td>'
      '      </tr>'
      '      <tr>'
      
        #9'  <th width="150" bgcolor="#990000" align="right"><font size=2>' +
        'E-MAIL</font></th>'
      
        #9'  <td width= 500><input type="text" size="30" maxlength="30" na' +
        'me="email"></td>'
      '      </tr>'
      '<tr>'
      '<td><br></td>'
      '<td><input type="button" value="'#46321#47197'" onClick="chkfield()">'
      '    <input type="reset" name="'#51116#51089#49457'" value="'#51116#51089#49457'"></td>'
      '</tr>'
      '</table>'
      '</td>'
      '</tr>'
      '</table>'
      '</form>'
      '  </body>'
      '</html>')
    OnHTMLTag = acceptproducerHTMLTag
    Left = 360
    Top = 32
  end
  object CompleteProducer: TPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '<title> '#45936#48652#44592#50612' </title>'
      
        '<meta http-equiv="content-type" content="text/html; charset=edu-' +
        'kr">'
      '</head>'
      '<body>'
      
        ' <table  width = "300" border="0" cellspacing="0" cellpadding="0' +
        '" align="left">'
      '    <tr>'
      '      <td valign="left" height="16">'
      '          <a href="http://localhost:81/lec/pweb.exe">'
      
        '             <img src="../PIC/logo.gif" width="60" height="60" b' +
        'order="0"></a><br><br><br>'
      '      </td>'
      '    </tr>'
      '   <tr>'
      '     <td>'
      '     <H5>'
      '     '#51217#49688' '#52376#47532#44032' '#50756#47308#46104#50632#49845#45768#45796'!<br>'
      '     3'#52488#54980#50640' '#47700#51064#54168#51060#51648#47196' '#51060#46041#54633#45768#45796'.'
      '     <hr align=left width=50% size=3>'
      '     </h5>'
      '     </td>'
      '   </tr>'
      '</body>'
      '</html>'
      '')
    Left = 280
    Top = 88
  end
  object FailedProducer: TPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '<title> '#45936#48652#44592#50612' </title>'
      
        '<meta http-equiv="content-type" content="text/html; charset=edu-' +
        'kr">'
      '</head>'
      '<body>'
      
        ' <table  width = "300" border="0" cellspacing="0" cellpadding="0' +
        '" align="left">'
      '    <tr>'
      '      <td valign="left" height="16">'
      '          <a href="http://localhost:81/lec/pweb.exe">'
      
        '             <img src="../PIC/logo.gif" width="60" height="60" b' +
        'order="0"></a><br><br><br>'
      '      </td>'
      '    </tr>'
      '   <tr>'
      '     <td>'
      '     <H5>'
      '     '#51217#49688#52376#47532#44032' '#49892#54056#54616#50688#49845#45768#45796' !<br>'
      '     3'#52488' '#54980#50640' '#44053#51340' '#49440#53469#54168#51060#51648#47196' '#51060#46041#54633#45768#45796'.'
      '     '#45796#49884' '#51217#49688#54616#50668' '#51452#49901#49884#50724
      '     <hr align=left width=50% size=3>'
      '     </h5>'
      '     </td>'
      '   </tr>'
      '</body>'
      '</html>')
    Left = 200
    Top = 160
  end
  object CustTemp: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'CUSTTEMP'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 208
    Top = 88
  end
end
