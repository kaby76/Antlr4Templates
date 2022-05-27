#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
	userid="$HOME"
	sed -i "s%M2DIR%$userid/.m2%g" makefile
	sed -i "s%JAVAEXE%$userid/.jre/jdk-11.0.15+10/bin/java%g" makefile
	sed -i "s%JAVACEXE%$userid/.jre/jdk-11.0.15+10/bin/javac%g" makefile
	sed -i "s%CONNECTOR%:%g" makefile
	cwd=`pwd`
	machine=Linux;
	rm -rf "$userid/.jre"
	mkdir "$userid/.jre"
	cd "$userid/.jre"
	wget "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.15%2B10/OpenJDK11U-jdk_x64_linux_hotspot_11.0.15_10.tar.gz"
	gzip -d "OpenJDK11U-jdk_x64_linux_hotspot_11.0.15_10.tar.gz"
	tar -xvf "OpenJDK11U-jdk_x64_linux_hotspot_11.0.15_10.tar"
	cd "$cwd"
	;;	
    Darwin*)
	userid="$HOME"
	sed -i "s%M2DIR%$userid/.m2%g" makefile
	sed -i "s%JAVAEXE%$userid/.jre/jdk-11.0.15+10/bin/java%g" makefile
	sed -i "s%JAVACEXE%$userid/.jre/jdk-11.0.15+10/bin/javac%g" makefile
	sed -i "s%CONNECTOR%:%g" makefile
	cwd=`pwd`
	machine=Mac;
	rm -rf "$userid/.jre"
	mkdir "$userid/.jre"
	cd "$userid/.jre"
	cd "$cwd"
	wget "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.15%2B10/OpenJDK11U-jdk_x64_mac_hotspot_11.0.15_10.tar.gz"
	gzip -d "OpenJDK11U-jdk_x64_mac_hotspot_11.0.15_10.tar.gz"
	tar -xvf "OpenJDK11U-jdk_x64_mac_hotspot_11.0.15_10.tar"
	;;
    CYGWIN*)
	userid=`echo $USERPROFILE | tr '\\\\' '/'`
	sed -i "s%M2DIR%$userid/.m2%g" makefile
	sed -i "s%JAVAEXE%$userid/.jre/jdk-11.0.15+10/bin/java.exe%g" makefile
	sed -i "s%JAVACEXE%$userid/.jre/jdk-11.0.15+10/bin/javac.exe%g" makefile
	sed -i "s%CONNECTOR%\\;%g" makefile
	cwd=`pwd`
	cwd=`cygpath -m "$cwd"`
	cwd=`echo $cwd | sed 's%^/c%c:%'`
	machine=Cygwin;
	rm -rf "$userid/.jre"
	mkdir "$userid/.jre"
	cd "$userid/.jre"
	wget "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.15%2B10/OpenJDK11U-jdk_x64_windows_hotspot_11.0.15_10.zip"
	powershell -command "Expand-Archive OpenJDK11U-jdk_x64_windows_hotspot_11.0.15_10.zip ."
	cd "$cwd"
	;;
    MINGW*)
	userid=`echo $USERPROFILE | tr '\\\\' '/'`
	sed -i "s%M2DIR%$userid/.m2%g" makefile
	sed -i "s%JAVAEXE%$userid/.jre/jdk-11.0.15+10/bin/java.exe%g" makefile
	sed -i "s%JAVACEXE%$userid/.jre/jdk-11.0.15+10/bin/javac.exe%g" makefile
	sed -i "s%CONNECTOR%\\;%g" makefile
	cwd=`pwd`
	cwd=`cygpath -m "$cwd"`
	cwd=`echo $cwd | sed 's%^/c%c:%'`
	machine=MinGw;
	rm -rf "$userid/.jre"
	mkdir "$userid/.jre"
	cd "$userid/.jre"
	wget "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.15%2B10/OpenJDK11U-jdk_x64_windows_hotspot_11.0.15_10.zip"
	powershell -command "Expand-Archive OpenJDK11U-jdk_x64_windows_hotspot_11.0.15_10.zip ."
	cd "$cwd"
	;;
    MSYS_NT*)
	userid=`echo $USERPROFILE | tr '\\\\' '/'`
	sed -i "s%M2DIR%$userid/.m2%g" makefile
	sed -i "s%JAVAEXE%$userid/.jre/jdk-11.0.15+10/bin/java.exe%g" makefile
	sed -i "s%JAVACEXE%$userid/.jre/jdk-11.0.15+10/bin/javac.exe%g" makefile
	sed -i "s%CONNECTOR%\\;%g" makefile
	cwd=`pwd`
	cwd=`cygpath -m "$cwd"`
	cwd=`echo $cwd | sed 's%^/c%c:%'`
	machine=Msys;
	rm -rf "$userid/.jre"
	mkdir "$userid/.jre"
	cd "$userid/.jre"
	wget "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.15%2B10/OpenJDK11U-jdk_x64_windows_hotspot_11.0.15_10.zip"
	powershell -command "Expand-Archive OpenJDK11U-jdk_x64_windows_hotspot_11.0.15_10.zip ."
	cd "$cwd"
	;;
    *)
	machine="UNKNOWN:${unameOut}"
esac
echo "$machine"
echo "$cwd"
make 
