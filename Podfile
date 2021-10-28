# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'GameList' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

    pod 'SnapKit', '~> 4.0'
    pod 'mob_sharesdk'
    pod 'mob_pushsdk'
    # UI模块(非必须，需要用到ShareSDK提供的分享菜单栏和分享编辑页面需要以下1行)
    pod 'mob_sharesdk/ShareSDKUI'
    pod 'Bytedance-UnionAD'

    # 平台SDK模块(对照一下平台，需要的加上。如果只需要QQ、微信、新浪微博，只需要以下3行)
    pod 'mob_sharesdk/ShareSDKPlatforms/QQ'
    pod 'mob_sharesdk/ShareSDKPlatforms/WeChat'  #（微信sdk不带支付的命令）
    pod 'mob_sharesdk/ShareSDKPlatforms/DingTalk'
    pod 'mob_sharesdk/ShareSDKPlatforms/SinaWeibo'


  # Pods for GameList

  target 'GameListTests' do
    inherit! :search_paths 
    # Pods for testing
  end

  target 'GameListUITests' do
    # Pods for testing
  end

end
