#!/bin/bash

cd $DATABASE_HOME
$JAVA_HOME/bin/java -jar $JSUNEIDO_HOME/jsuneido.jar -server "JsPlayServer(dir: '$SUNEIDOJS_HOME', port: 7000, svcpass: 'sune1')"
