MRUBY_URL := https://github.com/sadasant/mruby.git
MRUBY_A := libmruby.a
MRUBY_A_FULL = build/androideabi/lib/$(MRUBY_A)
MRUBY_WITHOUT_JNI=0

all: setup build.xml
	$(ANDROID_NDK_HOME)/ndk-build
	ant debug install

.PHONY : clean all clean-with-git setup

andruboid.zip: setup
	git clean -fxd -e "jni/*" -e $@
	zip $@ -r . -x ./mruby\* $@

setup: jni/$(MRUBY_A)

jni/$(MRUBY_A): mruby/$(MRUBY_A_FULL)
	cp $< $@

mruby/$(MRUBY_A_FULL): mruby mruby_config.rb
	cd mruby ; MRUBY_CONFIG=../mruby_config.rb ruby minirake $(abspath $@)

mruby:
	git clone $(MRUBY_URL) mruby

mruby_config.rb: mruby/build_config.rb build_config
	cat $^ > mruby_config.rb

build.xml:
	$(ANDROID_SDK_HOME)/tools/android update project -p . -t 1

clean: clean-with-git

clean-with-git:
	git clean -fxd
