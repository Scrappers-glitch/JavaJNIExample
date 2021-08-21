#**
#* Ccoffee Build tool, manual build, alpha-v1.
#* Custom Includsions for GTKmm cpp wrapper
#* dependencies '-I"/usr/include/glibmm-2.9.1/glib" -I"/usr/include/sigc++-2.0/sigc++" -I"/usr/include/giomm-2.4" -I"/usr/include/gtkmm-4.2.0/gtk"'
#*
#* @author pavl_g.
#*#
echo "Compiling the project"

    #1) define work directory
    workDir='/home/twisted/GradleProjects/JavaJNIExample'

    ##Build java
    mkdir ${workDir}'/build/.buildJava'

    ##attrs : dir to compile java files
    code=(${workDir}'/code/java/src/main/*')

    cp ${code} ${workDir}'/build/.buildJava'
    
    final=${workDir}'/build/.buildJava/*'
    cd ${workDir}'/build/.buildJava'
    ## compile & create a C header file
    javac -h . ${final} 
    header=${workDir}'/build/.buildJava/TestJni.h'
    mv ${header} ${workDir}'/code/natives/includes/'
    
    ###Compile C++ code & bind to the header created from java
    mkdir ${workDir}'/build/.buildNatives'
    ##attrs : dir to compile & sharedLib name
    libs=(${workDir}'/code/natives/libs/*')
    main=(${workDir}'/code/natives/main/*')

    merge[0]=${libs}
    merge[1]=${main}
    #2) copy cpp files to a gather directory
    for ((idx=0; idx < ${#merge[@]}; idx++)); do
        ##act on ${merge[$idx]}
        cp ${merge[$idx]} ${workDir}'/build/.buildNatives'
    done
    
    cd ${workDir}'/shared'
    
    final=${workDir}'/build/.buildNatives/*'
    
    gcc -fPIC ${final} -shared  -o 'libTestJni.so' \
                -I'/usr/lib/jvm/java-11-openjdk-amd64/include' \
                -I'/usr/lib/jvm/java-11-openjdk-amd64/include/linux' \
                -I${workDir}'/code/natives/includes'
    
    NativeLibDir=${workDir}'/shared'
    java.library.path=${NativeLibDir}

echo "Successfully Compiled"


