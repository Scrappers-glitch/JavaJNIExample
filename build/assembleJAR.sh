#!/bin/bash
echo "Assemble JAR"

workingDir='/home/twisted/GradleProjects/JavaJNIExample'
outputJAR='TestJni'
outputJARDir=${workingDir}'/output/'


manifest=${workingDir}'/build/.buildJava/Manifest.mf'
javaClasses=${workingDir}'/build/.buildJava/*.class'
javaSRC=${workingDir}'/build/.buildJava/*.java'
nativeLibs=${workingDir}'/shared/*.so'

cd ${outputJARDir}

mkdir ${outputJAR}
cd ${outputJARDir}''${outputJAR}

cp ${manifest} ${outputJARDir}''${outputJAR}
cp ${javaClasses} ${outputJARDir}''${outputJAR}
cp ${javaSRC} ${outputJARDir}''${outputJAR}
cp ${nativeLibs} ${outputJARDir}''${outputJAR}


classes='TestJni.class'
src='TestJni.java'
libs='libTestJni.so'


jar cmf 'Manifest.mf' ${outputJAR}'.jar' ${classes} ${libs} ${src}

