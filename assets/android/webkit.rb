module Jni
  module J
    module Android
      module Webkit
        class WebSettings < Java::Lang::Object
          attach Void, "setJavaScriptEnabled", Boolean
        end
        class WebViewClient < Java::Lang::Object
          attach_init
        end
        class WebView < Widget::AbsoluteLayout
          attach_init Android::Content::Context
          attach Void, "loadData", Java::Lang::String, Java::Lang::String, Java::Lang::String
          attach Void, "loadDataWithBaseURL", Java::Lang::String, Java::Lang::String, Java::Lang::String, Java::Lang::String, Java::Lang::String
          attach Void, "loadUrl", Java::Lang::String
          attach Void, "setWebViewClient", Android::Webkit::WebViewClient
          attach Void, "addJavascriptInterface", Java::Lang::Object, Java::Lang::String
          attach Android::Webkit::WebSettings, "getSettings"
        end
      end
    end
  end
end