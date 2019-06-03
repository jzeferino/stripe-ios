XBUILD=/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild
PROJECT_ROOT=./Stripe
PROJECT=Stripe.xcodeproj
PROJECT_NAME=Stripe
TARGET=StripeiOSStatic

all: lib$(PROJECT_NAME).a

lib$(PROJECT_NAME)-simulator.a:
	$(XBUILD) -project $(PROJECT) -target $(TARGET) -sdk iphonesimulator -configuration Release clean build -quiet
	-mv ./build/Release-iphonesimulator/lib$(PROJECT_NAME).a $@

lib$(PROJECT_NAME)-arm64.a:
	$(XBUILD) -project $(PROJECT) -target $(TARGET) -sdk iphoneos -arch arm64 -configuration Release clean build -quiet
	-mv ./build/Release-iphoneos/lib$(PROJECT_NAME).a $@

lib$(PROJECT_NAME).a: lib$(PROJECT_NAME)-simulator.a lib$(PROJECT_NAME)-arm64.a 
	xcrun -sdk iphoneos lipo -create -output $@ $^

clean:
	-rm -f *.a *.dll