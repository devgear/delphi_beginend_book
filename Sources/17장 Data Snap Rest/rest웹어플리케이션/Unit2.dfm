object WebModule2: TWebModule2
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Name = 'ReverseStringAction'
      PathInfo = '/ReverseString'
      Producer = ReverseString
    end
    item
      Name = 'ServerFunctionInvokerAction'
      PathInfo = '/ServerFunctionInvoker'
      Producer = ServerFunctionInvoker
    end
    item
      Default = True
      Name = 'DefaultAction'
      PathInfo = '/'
      OnAction = WebModuleDefaultAction
    end
    item
      Name = 'WebActionItem1'
      PathInfo = '/hello'
      Producer = PageProducer1
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  Height = 333
  Width = 414
  object DSServer1: TDSServer
    AutoStart = True
    HideDSAdmin = False
    Left = 48
    Top = 11
  end
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    DSContext = 'datasnap/'
    RESTContext = 'rest/'
    CacheContext = 'cache/'
    Server = DSServer1
    DSHostname = 'localhost'
    DSPort = 211
    Filters = <>
    AuthenticationManager = DSAuthenticationManager1
    CredentialsPassThrough = False
    SessionTimeout = 1200000
    WebDispatch.MethodType = mtAny
    WebDispatch.PathInfo = 'datasnap*'
    Left = 56
    Top = 67
  end
  object DSAuthenticationManager1: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManager1UserAuthenticate
    Roles = <
      item
        AuthorizedRoles.Strings = (
          'Admin')
        ApplyTo.Strings = (
          'EchoString')
      end>
    Left = 136
    Top = 123
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    LifeCycle = 'Session'
    Left = 136
    Top = 11
  end
  object ServerFunctionInvoker: TPageProducer
    HTMLFile = 'Templates\ServerFunctionInvoker.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 48
    Top = 184
  end
  object ReverseString: TPageProducer
    HTMLFile = 'templates\ReverseString.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 136
    Top = 184
  end
  object WebFileDispatcher1: TWebFileDispatcher
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/x-png'
        Extensions = 'png'
      end>
    BeforeDispatch = WebFileDispatcher1BeforeDispatch
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = '.'
    Left = 56
    Top = 128
  end
  object DSProxyGenerator1: TDSProxyGenerator
    ExcludeClasses = 'DSMetadata'
    MetaDataProvider = DSServerMetaDataProvider1
    Writer = 'Java Script REST'
    Left = 56
    Top = 248
  end
  object DSServerMetaDataProvider1: TDSServerMetaDataProvider
    Server = DSServer1
    Left = 136
    Top = 248
  end
  object PageProducer1: TPageProducer
    HTMLFile = 'D:\'#50696#51228'\17'#51109' Data Snap Rest\rest'#50937#50612#54540#47532#52992#51060#49496'\Hello.html'
    Left = 224
    Top = 184
  end
end
