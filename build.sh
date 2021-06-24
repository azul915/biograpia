#!/bin/bash

if [ -f $SRC/main.jar ]; then
  rm $SRC/main.jar
fi

if [ -f $SRC/*.class ]; then
  rm $SRC/*.class
fi

##############################################################################
# if you want make .jar file use option (-include-runtime -d $SRC/main.jar)  #
# and execute .jar file by using java command.                               #
##############################################################################
#kotlinc $SRC -include-runtime -d $SRC/main.jar
#$JAVA_HOME/bin/java -jar $SRC/main.jar

##############################################################################
# if main.kt under $SRC has main function,                                   #
# compiler outputs class as "MainKt"                                         #
##############################################################################
kotlinc $SRC
kotlin MainKt

