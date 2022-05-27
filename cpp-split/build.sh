#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
	userid="$HOME"
	sed -i "s%M2DIR%$userid/.m2%g" cmake/ExternalAntlr4Cpp.cmake
	sed -i "s%M2DIR%$userid/.m2%g" CMakeLists.txt
	sed -i "s%JAVAEXE%java%g" CMakeLists.txt
	sed -i "s%JRE%$userid/.jre/jdk-11.0.15+10-jre%g" CMakeLists.txt
	cwd=`pwd`
	machine=Linux;
	rm -rf "$userid/.jre"
	mkdir "$userid/.jre"
	cd "$userid/.jre"
	wget "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.15%2B10/OpenJDK11U-jre_x64_linux_hotspot_11.0.15_10.tar.gz"
	gzip -d "OpenJDK11U-jre_x64_linux_hotspot_11.0.15_10.tar.gz"
	tar -xvf "OpenJDK11U-jre_x64_linux_hotspot_11.0.15_10.tar"
	cd "$cwd"
	;;	
    Darwin*)
	userid="$HOME"
	sed -i "s%M2DIR%$userid/.m2%g" cmake/ExternalAntlr4Cpp.cmake
	sed -i "s%M2DIR%$userid/.m2%g" CMakeLists.txt
	sed -i "s%JAVAEXE%java%g" CMakeLists.txt
	sed -i "s%JRE%$userid/.jre/jdk-11.0.15+10-jre%g" CMakeLists.txt
	cwd=`pwd`
	machine=Mac;
	rm -rf "$userid/.jre"
	mkdir "$userid/.jre"
	cd "$userid/.jre"
	wget "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.15%2B10/OpenJDK11U-jre_x64_linux_hotspot_11.0.15_10.tar.gz"
	gzip -d "OpenJDK11U-jre_x64_linux_hotspot_11.0.15_10.tar.gz"
	tar -xvf "OpenJDK11U-jre_x64_linux_hotspot_11.0.15_10.tar"
	cd "$cwd"
	;;
    CYGWIN*)
	userid=`echo $USERPROFILE | tr '\\\\' '/'`
	sed -i "s%M2DIR%$userid/.m2%g" cmake/ExternalAntlr4Cpp.cmake
	sed -i "s%M2DIR%$userid/.m2%g" CMakeLists.txt
	sed -i "s%JAVAEXE%java.exe%g" CMakeLists.txt
	sed -i "s%JRE%$userid/.jre/jdk-11.0.15+10-jre%g" CMakeLists.txt
	cwd=`pwd`
	cwd=`cygpath -m "$cwd"`
	cwd=`echo $cwd | sed 's%^/c%c:%'`
	machine=Cygwin;
	rm -rf "$userid/.jre"
	mkdir "$userid/.jre"
	cd "$userid/.jre"
	wget "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.15%2B10/OpenJDK11U-jre_x64_windows_hotspot_11.0.15_10.zip"
	powershell -command "Expand-Archive OpenJDK11U-jre_x64_windows_hotspot_11.0.15_10.zip ."
	cd "$cwd"
	;;
    MINGW*)
	userid=`echo $USERPROFILE | tr '\\\\' '/'`
	sed -i "s%M2DIR%$userid/.m2%g" cmake/ExternalAntlr4Cpp.cmake
	sed -i "s%M2DIR%$userid/.m2%g" CMakeLists.txt
	sed -i "s%JAVAEXE%java.exe%g" CMakeLists.txt
	sed -i "s%JRE%$userid/.jre/jdk-11.0.15+10-jre%g" CMakeLists.txt
	cwd=`pwd`
	cwd=`cygpath -m "$cwd"`
	cwd=`echo $cwd | sed 's%^/c%c:%'`
	machine=MinGw;
	rm -rf "$userid/.jre"
	mkdir "$userid/.jre"
	cd "$userid/.jre"
	wget "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.15%2B10/OpenJDK11U-jre_x64_windows_hotspot_11.0.15_10.zip"
	powershell -command "Expand-Archive OpenJDK11U-jre_x64_windows_hotspot_11.0.15_10.zip ."
	cd "$cwd"
	;;
    MSYS_NT*)
	userid=`echo $USERPROFILE | tr '\\\\' '/'`
	sed -i "s%M2DIR%$userid/.m2%g" cmake/ExternalAntlr4Cpp.cmake
	sed -i "s%M2DIR%$userid/.m2%g" CMakeLists.txt
	sed -i "s%JRE%$userid/.jre/jdk-11.0.15+10-jre%g" CMakeLists.txt
	cwd=`pwd`
	cwd=`cygpath -m "$cwd"`
	cwd=`echo $cwd | sed 's%^/c%c:%'`
	machine=Msys;
	rm -rf "$userid/.jre"
	mkdir "$userid/.jre"
	cd "$userid/.jre"
	wget "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.15%2B10/OpenJDK11U-jre_x64_windows_hotspot_11.0.15_10.zip"
	powershell -command "Expand-Archive OpenJDK11U-jre_x64_windows_hotspot_11.0.15_10.zip ."
	cd "$cwd"
	;;
    *)
	machine="UNKNOWN:${unameOut}"
esac
echo "$machine"
echo "$cwd"
target=""
rm -rf build
mkdir build
cd build
cmake ..
case "${unameOut}" in
    Linux*)
	make
	;;	
    Darwin*)
	make
	;;
    CYGWIN*)
	ninja
	;;
    MINGW*)
	ninja
	;;
    MSYS_NT*)
	ninja
	;;
    *)
	machine="UNKNOWN:${unameOut}"
esac
