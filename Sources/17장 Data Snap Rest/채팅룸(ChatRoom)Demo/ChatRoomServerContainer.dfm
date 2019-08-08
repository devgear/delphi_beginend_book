object ServerContainerForm: TServerContainerForm
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 271
  Width = 415
  object ChatRoomServer: TDSServer
    AutoStart = True
    HideDSAdmin = False
    Left = 96
    Top = 11
  end
  object ChatRoomTransport: TDSTCPServerTransport
    PoolSize = 0
    Server = ChatRoomServer
    BufferKBSize = 32
    Filters = <>
    AuthenticationManager = ChatRoomAuthenticationManager
    Left = 96
    Top = 73
  end
  object ChatRoomServerClass: TDSServerClass
    OnGetClass = ChatRoomServerClassGetClass
    Server = ChatRoomServer
    LifeCycle = 'Session'
    Left = 232
    Top = 11
  end
  object ChatRoomAuthenticationManager: TDSAuthenticationManager
    OnUserAuthenticate = ChatRoomAuthenticationManagerUserAuthenticate
    OnUserAuthorize = ChatRoomAuthenticationManagerUserAuthorize
    Roles = <
      item
        AuthorizedRoles.Strings = (
          'LoggedInUser')
      end
      item
        AuthorizedRoles.Strings = (
          'ChannelBroadcast')
        ApplyTo.Strings = (
          'TDBXServerComponent.BroadcastToChannel'
          'TDBXServerComponent.BroadcastObjectToChannel')
      end
      item
        AuthorizedRoles.Strings = (
          'ChannelNotify')
        ApplyTo.Strings = (
          'TDBXServerComponent.NotifyCallback'
          'TDBXServerComponent.NotifyObject')
      end>
    Left = 96
    Top = 197
  end
  object ChatRoomHTTPService: TDSHTTPService
    DSContext = 'datasnap/'
    RESTContext = 'rest/'
    CacheContext = 'cache/'
    Server = ChatRoomServer
    DSHostname = 'localhost'
    DSPort = 211
    Filters = <>
    AuthenticationManager = ChatRoomAuthenticationManager
    CredentialsPassThrough = False
    SessionTimeout = 1200000
    HttpPort = 8086
    Active = False
    Left = 96
    Top = 135
  end
  object ChatRoomFileDispatcher: TDSHTTPServiceFileDispatcher
    Service = ChatRoomHTTPService
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/html'
        Extensions = 'html;htm'
      end
      item
        MimeType = 'text/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/jpeg'
        Extensions = 'jpeg;jpg'
      end
      item
        MimeType = 'image/x-png'
        Extensions = 'png'
      end>
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = './../../'
    Left = 232
    Top = 72
  end
end
