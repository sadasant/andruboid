module Jmi
  class Object
    def initialize(*args)
      self.class.init_method.call self, *args
    end
    class << self
      attr_writer :package
      attr_reader :init_method
      def define_init(arg)
        @init_method = Jmi::Method.new self, "<init>".intern, "(#{arg})V"
      end
      def define(jname, arg, ret, *names)
        jmethod = Jmi::Method.new self, jname, "(#{arg})#{ret}"
        names.push jname if names.empty?
        names.each do |name|
          define_method(name) do |*args|
            jmethod.call self, *args
          end
        end
      end
      def inherited(klass)
        name = klass.to_s
        colon = name.rindex ":"
        name = name[colon + 1..-1] if colon
        klass.class_path = "#{@package}/#{name}"
      end
    end
  end
 
  class Main
    self.class_path = "android/app/Activity"
    class << self
      def inherited(main)
        @main = main
        main.class_path = "android/app/Activity"
      end
    end
  end
  class << self
    def import(package)
      Jmi::Object.package = package
      Jmi::Object
    end
  end
end

