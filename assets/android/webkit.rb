module Jni
  module J
    module Android
      module Webkit
        class WebViewClient < Java::Lang::Object
          attach_init
        end
        class WebView < Widget::AbsoluteLayout
          attach_init Android::Content::Context
          attach Void, "loadUrl", Java::Lang::String
          attach Void, "setWebViewClient", Android::Webkit::WebViewClient
        end
      end
    end
  end
end