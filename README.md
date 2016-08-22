# SwiftHelloCairoGtk
A simple 'hello-world' app showing how to draw on a canvas using SwiftGtk and SwiftCairo (although cairo is not very Swifty yet at this stage)

## Building
Make sure you have all the prerequisites installed (see below).  After that, you can simply clone this repository and build the command line executable (be patient, this will download all the required dependencies and take a while to compile) using

	git clone https://github.com/rhx/SwiftHelloCairoGtk.git
	./build.sh
	
After that, you can run the program using

	.build/debug/HelloCairoGtk

A simple, empty 'Hello Cairo' window should appear.  To exit the program, click the close button or press Control-C in the Terminal window.

### Xcode

On macOS, you can build the project using Xcode instead.  To do this, you need to create an Xcode project first, then open the project in the Xcode IDE:


	./xcodegen.sh
	open HelloCairoGtk.xcodeproj

After that, select the executable target (not the Bundle/Framework target with the same name as the executable) and use the (usual) Build and Run buttons to build/run your project.


## Prerequisites

### Swift

To build, you need a very recent Swift compiler (Swift 3.0 Preview 6 at the time of this writing, download from https://swift.org/download/ -- if you are using macOS, make sure you have the command line tools installed as well).  Test that your compiler works using `swift --version`, which should give you something like

	$ swift --version
	Apple Swift version 3.0 (swiftlang-800.0.43.6 clang-800.0.38)
	Target: x86_64-apple-macosx10.9

on macOS, or on Linux you should get something like:

	$ swift --version
	Swift version 3.0 (swift-3.0-PREVIEW-6)
	Target: x86_64-unknown-linux-gnu

### Gtk 3.18 or higher

The Swift wrappers have been tested with glib-2.46 and 2.48, and gdk/gtk 3.18 and 3.20.  They should work with higher versions, but YMMV.  Also make sure you have `gobject-introspection` and its `.gir` files installed.

#### Linux

On Ubuntu 16.04, you can use the gtk that comes with the distribution.  Just install with the `apt` package manager:

	sudo apt update
	sudo apt install libgtk-3-dev gir1.2-gtksource-3.0 gobject-introspection libgirepository1.0-dev

If you prefer a newer version of gtk, you can also install it from the GNOME 3 Staging PPA (see https://launchpad.net/~gnome3-team/+archive/ubuntu/gnome3-staging), but be aware that this can be a bit dangerous (as this removes packages that can be vital, particularly if you use a GNOME-based desktop), so only do this if you know what you are doing:

	sudo add-apt-repository ppa:gnome3-team/gnome3-staging
	sudo apt update
	sudo apt dist-upgrade
	sudo apt install libgtk-3-dev gir1.2-gtksource-3.0 gobject-introspection libgirepository1.0-dev

#### macOS

On macOS, you can install gtk using HomeBrew (for setup instructions, see http://brew.sh).  Once you have a running HomeBrew installation, you can use it to install a native version of gtk:

	brew update
	brew install gtk+3



## Troubleshooting
Here are some common errors you might encounter and how to fix them.

### Old Swift toolchain or Xcode
If you get an error such as

	$ ./build.sh 
	error: unable to invoke subcommand: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-package (No such file or directory)
	
this probably means that your Swift toolchain is too old.  Make sure the latest toolchain (Swift 3 preview 6 at the time of this writing) is the one that is found when you run the Swift compiler, e.g.:

	$ swiftc --version
	Apple Swift version 3.0 (swiftlang-800.0.43.6 clang-800.0.38)
	Target: x86_64-apple-macosx10.9

  If you get an older version, make sure that the right version of the swift compiler is found first in your `PATH`.  On macOS, use xcode-select to select and install the latest version, e.g.:

	sudo xcode-select -s /Applications/Devel/Xcode-beta.app
	xcode-select --install
