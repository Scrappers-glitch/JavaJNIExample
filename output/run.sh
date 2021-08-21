#!/bin/bash

echo "Run"
echo ".................................."
workingDir='/home/twisted/GradleProjects/JavaJNIExample'
cd ${workingDir}'/output/TestJni'
java -jar -Djava.library.path=. 'TestJni.jar'

