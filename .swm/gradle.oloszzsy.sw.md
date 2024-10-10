---
title: Gradle
---
# Intro

This document explains how Gradle is used in the Dynamics project. It will cover the configuration and usage of Gradle in the <SwmToken path="dynamics/build.gradle" pos="82:6:6" line-data="    mainClassName = &#39;dynamics.App&#39;">`dynamics`</SwmToken> directory.

<SwmSnippet path="/dynamics/gradlew" line="1">

---

# Gradle Wrapper Script for Unix

The `gradlew` script is a Unix shell script that sets up the environment for running Gradle. It includes licensing information and a description of the script's purpose.

```
#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
##
##  Gradle start up script for UN*X
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew" line="25">

---

The script attempts to set the <SwmToken path="dynamics/gradlew" pos="25:8:8" line-data="# Attempt to set APP_HOME">`APP_HOME`</SwmToken> variable by resolving symbolic links and setting the current directory as the application home.

```
# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/" >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew" line="43">

---

Default JVM options are set, and the maximum file descriptor limit is configured.

```
APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew" line="63">

---

The script includes OS-specific support for Cygwin, MSYS, Darwin, and <SwmToken path="dynamics/gradlew" pos="67:0:0" line-data="nonstop=false">`nonstop`</SwmToken> platforms.

```
# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
darwin=false
nonstop=false
case "`uname`" in
  CYGWIN* )
    cygwin=true
    ;;
  Darwin* )
    darwin=true
    ;;
  MINGW* )
    msys=true
    ;;
  NONSTOP* )
    nonstop=true
    ;;
esac
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew" line="83">

---

The script determines the Java command to use based on the <SwmToken path="dynamics/gradlew" pos="86:9:9" line-data="if [ -n &quot;$JAVA_HOME&quot; ] ; then">`JAVA_HOME`</SwmToken> environment variable or defaults to <SwmToken path="dynamics/gradlew" pos="85:6:6" line-data="# Determine the Java command to use to start the JVM.">`Java`</SwmToken> if <SwmToken path="dynamics/gradlew" pos="86:9:9" line-data="if [ -n &quot;$JAVA_HOME&quot; ] ; then">`JAVA_HOME`</SwmToken> is not set.

```
CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew" line="107">

---

For non-Cygwin, non-Darwin, and non-NonStop platforms, the script attempts to increase the maximum file descriptor limit.

```
# Increase the maximum file descriptors if we can.
if [ "$cygwin" = "false" -a "$darwin" = "false" -a "$nonstop" = "false" ] ; then
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ] ; then
            MAX_FD="$MAX_FD_LIMIT"
        fi
        ulimit -n $MAX_FD
        if [ $? -ne 0 ] ; then
            warn "Could not set maximum file descriptor limit: $MAX_FD"
        fi
    else
        warn "Could not query maximum file descriptor limit: $MAX_FD_LIMIT"
    fi
fi
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew" line="123">

---

For Darwin platforms, additional options are added to specify how the application appears in the dock.

```
# For Darwin, add options to specify how the application appears in the dock
if $darwin; then
    GRADLE_OPTS="$GRADLE_OPTS \"-Xdock:name=$APP_NAME\" \"-Xdock:icon=$APP_HOME/media/gradle.icns\""
fi
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew" line="128">

---

For Cygwin or MSYS platforms, paths are converted to Windows format before running the Java command.

```
# For Cygwin or MSYS, switch paths to Windows format before running java
if [ "$cygwin" = "true" -o "$msys" = "true" ] ; then
    APP_HOME=`cygpath --path --mixed "$APP_HOME"`
    CLASSPATH=`cygpath --path --mixed "$CLASSPATH"`
    JAVACMD=`cygpath --unix "$JAVACMD"`

    # We build the pattern for arguments to be converted via cygpath
    ROOTDIRSRAW=`find -L / -maxdepth 1 -mindepth 1 -type d 2>/dev/null`
    SEP=""
    for dir in $ROOTDIRSRAW ; do
        ROOTDIRS="$ROOTDIRS$SEP$dir"
        SEP="|"
    done
    OURCYGPATTERN="(^($ROOTDIRS))"
    # Add a user-defined pattern to the cygpath arguments
    if [ "$GRADLE_CYGPATTERN" != "" ] ; then
        OURCYGPATTERN="$OURCYGPATTERN|($GRADLE_CYGPATTERN)"
    fi
    # Now convert the arguments - kludge to limit ourselves to /bin/sh
    i=0
    for arg in "$@" ; do
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew" line="173">

---

The script collects all arguments for the Java command and executes the Gradle Wrapper Main class.

```
# Escape application args
save () {
    for i do printf %s\\n "$i" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' \\\\/" ; done
    echo " "
}
APP_ARGS=`save "$@"`

# Collect all arguments for the java command, following the shell quoting and substitution rules
eval set -- $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS "\"-Dorg.gradle.appname=$APP_BASE_NAME\"" -classpath "\"$CLASSPATH\"" org.gradle.wrapper.GradleWrapperMain "$APP_ARGS"

exec "$JAVACMD" "$@"
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew.bat" line="1">

---

# Gradle Wrapper Script for Windows

The <SwmPath>[dynamics/gradlew.bat](dynamics/gradlew.bat)</SwmPath> script is a Windows batch script that sets up the environment for running Gradle. It includes licensing information and a description of the script's purpose.

```batchfile
@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  Gradle startup script for Windows
@rem
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew.bat" line="24">

---

The script sets local scope for variables and determines the application home directory.

```batchfile
@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew.bat" line="32">

---

Default JVM options are set.

```batchfile
@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-Xmx64m" "-Xms64m"
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew.bat" line="35">

---

The script finds the <SwmToken path="dynamics/gradlew.bat" pos="35:5:7" line-data="@rem Find java.exe">`java.exe`</SwmToken> executable based on the <SwmToken path="dynamics/gradlew.bat" pos="36:4:4" line-data="if defined JAVA_HOME goto findJavaFromJavaHome">`JAVA_HOME`</SwmToken> environment variable or defaults to <SwmToken path="dynamics/gradlew.bat" pos="35:5:7" line-data="@rem Find java.exe">`java.exe`</SwmToken> if <SwmToken path="dynamics/gradlew.bat" pos="36:4:4" line-data="if defined JAVA_HOME goto findJavaFromJavaHome">`JAVA_HOME`</SwmToken> is not set.

```batchfile
@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/gradlew.bat" line="64">

---

The script sets up the classpath and executes the Gradle Wrapper Main class.

```batchfile
:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

@rem Execute Gradle
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="1">

---

# Gradle Build Script

The <SwmPath>[dynamics/build.gradle](dynamics/build.gradle)</SwmPath> file is the main build script for the Dynamics project. It includes imports and plugin configurations.

```gradle
/*
 * This file was generated by the Gradle 'init' task.
 *
 * This generated file contains a sample Java project to get you started.
 * For more details take a look at the Java Quickstart chapter in the Gradle
 * User Manual available at https://docs.gradle.org/6.1.1/userguide/tutorial_java_projects.html
 */
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="13">

---

Plugins are applied, including Maven, Artifactory, and a custom plugin <SwmToken path="dynamics/build.gradle" pos="16:4:8" line-data="    id &quot;oe.espresso.latte&quot; version &quot;0.3.1&quot;">`oe.espresso.latte`</SwmToken>.

```gradle
plugins {
    id 'maven'
    id "com.jfrog.artifactory" version "4.10.0"
    id "oe.espresso.latte" version "0.3.1"
    id "application"
}
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="20">

---

The project group is set, and the <SwmToken path="dynamics/build.gradle" pos="22:11:11" line-data="String localDLC = System.getenv(&#39;DLC&#39;)">`DLC`</SwmToken> environment variable is checked to ensure it is set.

```gradle
group 'com.progress.openedge'

String localDLC = System.getenv('DLC')
if (localDLC == null )                {throw new GradleException('DLC not set')}
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="25">

---

The <SwmToken path="dynamics/build.gradle" pos="25:4:4" line-data="// env.packageType">`packageType`</SwmToken> environment variable is set or defaults to <SwmToken path="dynamics/build.gradle" pos="27:16:16" line-data="if (packageType == null) {packageType = &#39;tty&#39;}">`tty`</SwmToken> if not set.

```gradle
// env.packageType
String packageType = System.getenv('packageType')
if (packageType == null) {packageType = 'tty'}
else                     {packageType = packageType.toLowerCase()}
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="30">

---

Compiler options are determined based on project properties.

```gradle
// Determine the compiler options
// one or more of req-ret-val, req-full-kw, req-full-name, req-fld-qual can be used, in a comma-delimited value
String[] ablCompOpts = (project.hasProperty('ablCompilerOpts') ? project.property('ablCompilerOpts') : '').split(',')

```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="35">

---

A global debug flag is set based on project properties.

```gradle
Boolean dbgProp = (project.hasProperty('dbg') ? project.property('dbg') : 'false').toBoolean()
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="37">

---

Directories for dependencies and final distribution are defined.

```gradle
// Folder where dependencies are keps: PL (for rcode) and source code underneath, if needed
File ablLibs = file("$buildDir/lib")

```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="43">

---

Temporary directories for AVM are defined.

```gradle
// Should be in abl.pctTaskArgs but it has to be created first, otherwise we get a 'null' error
// the dir is created in ResolveOpenEdgeDependancies.doFirst
File avmTempDir = file("$buildDir/temp")

```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="47">

---

The <SwmToken path="dynamics/build.gradle" pos="47:0:0" line-data="abl {">`abl`</SwmToken> block configures various ABL-specific settings, including <SwmToken path="dynamics/build.gradle" pos="48:1:1" line-data="    dlcHome  = file(localDLC)">`dlcHome`</SwmToken>, <SwmToken path="dynamics/build.gradle" pos="49:1:1" line-data="    rcodeDir = file(&quot;$buildDir/rcode&quot;)      // is the default; may not be needed">`rcodeDir`</SwmToken>, and <SwmToken path="dynamics/build.gradle" pos="52:1:1" line-data="    pctTaskArgs {">`pctTaskArgs`</SwmToken>.

```gradle
abl {
    dlcHome  = file(localDLC)
    rcodeDir = file("$buildDir/rcode")      // is the default; may not be needed
    graphicalMode = (packageType == 'gui')
    // dbConnections << "dictdb"
    pctTaskArgs {
        cpInternal = 'undefined'
        cpStream   = 'UTF-8'
        debugPCT = dbgProp
        keepXref = true
        xmlXref  = true
        compileUnderscore = true
        requireReturnValues    = ablCompOpts.contains('req-ret-val')
        requireFullKeywords    = ablCompOpts.contains('req-full-kw')
        requireFullNames       = ablCompOpts.contains('req-full-names')
        requireFieldQualifiers = ablCompOpts.contains('req-fld-qual')
    }
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="66">

---

Repositories for resolving dependencies are defined.

```gradle
repositories {
    // Use jcenter for resolving dependencies.
    // You can declare any Maven/Ivy/file repository here.
    //jcenter()
}
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="72">

---

Dependencies are declared in the <SwmToken path="dynamics/build.gradle" pos="72:0:0" line-data="dependencies {">`dependencies`</SwmToken> block.

```gradle
dependencies {
    // dependancies go here
} 
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="76">

---

Configurations are defined in the <SwmToken path="dynamics/build.gradle" pos="76:0:0" line-data="configurations {">`configurations`</SwmToken> block.

```gradle
configurations {

}
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="80">

---

The <SwmToken path="dynamics/build.gradle" pos="80:0:0" line-data="application {">`application`</SwmToken> block defines the main class for the application.

```gradle
application {
    // Define the main class for the application.
    mainClassName = 'dynamics.App'
}
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="85">

---

The <SwmToken path="dynamics/build.gradle" pos="85:2:2" line-data="task ResolveOpenEdgeDependancies(){">`ResolveOpenEdgeDependancies`</SwmToken> task creates necessary directories and copies files from the <SwmToken path="dynamics/build.gradle" pos="20:7:7" line-data="group &#39;com.progress.openedge&#39;">`openedge`</SwmToken> installation.

```gradle
task ResolveOpenEdgeDependancies(){
    doFirst() {
        avmTempDir.mkdirs()
        ablLibs.mkdirs()
    }
    doLast{
        ant.copy (toDir : "$ablLibs" ) {
            plfileset (src : "${abl.dlcHome}/src/adecomm.pl" , includes : "**/*")
            plfileset (src : "${abl.dlcHome}/src/adeedit.pl" , includes : "**/*")
            plfileset (src : "${abl.dlcHome}/src/adedict.pl" , includes : "**/*")
        }
    }
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="99">

---

The <SwmToken path="dynamics/build.gradle" pos="99:2:2" line-data="task CreateICFDB(type: CreateDatabase) {">`CreateICFDB`</SwmToken> task creates a database for the project, depending on the <SwmToken path="dynamics/build.gradle" pos="100:3:3" line-data="    dependsOn ResolveOpenEdgeDependancies">`ResolveOpenEdgeDependancies`</SwmToken> task.

```gradle
task CreateICFDB(type: CreateDatabase) {
    dependsOn ResolveOpenEdgeDependancies

    outputs.dir("$buildDir/db")
    outputs.file("$buildDir/db/icf.db")

    dbName      = "icf"
    destDir     = "$buildDir/db"
    sourceDb    = "${abl.dlcHome}/empty"  
    multiTenant = false                   
    schemaFile  = "src/main/abl/db/icf/dfd/icfdbfull.df"
    doLast() {
        if (!file("$buildDir/db/ICF.db").exists() ) {
            throw new GradleException("$buildDir/db/ICF.db not created") 
        }
    }
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="117">

---

The <SwmToken path="dynamics/build.gradle" pos="117:2:2" line-data="task ConnectICFDB(type: DBConnection) {">`ConnectICFDB`</SwmToken> task connects to the created database, depending on the <SwmToken path="dynamics/build.gradle" pos="118:3:3" line-data="    dependsOn CreateICFDB">`CreateICFDB`</SwmToken> task.

```gradle
task ConnectICFDB(type: DBConnection) {
    dependsOn CreateICFDB

    id         = 'icfdb'
    dbName     = 'icf'
    dbDir      = "$buildDir/db"
    singleUser = true
    alias("db_metaschema")
    alias("db_index")
    alias("ICFDB")
}
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="129">

---

The <SwmToken path="dynamics/build.gradle" pos="129:2:2" line-data="task compileCode(type: CompileAblTask) {">`compileCode`</SwmToken> task compiles ABL code, depending on the <SwmToken path="dynamics/build.gradle" pos="130:3:3" line-data="    dependsOn ConnectICFDB">`ConnectICFDB`</SwmToken> task. It sets various compile arguments and includes/excludes specific files.

```gradle
task compileCode(type: CompileAblTask) {
    dependsOn ConnectICFDB

    outputs.dir(abl.rcodeDir)

    compileArgs.tempDir             = avmTempDir.path
    compileArgs.centuryYearOffset   = "1950"
    compileArgs.token               = "1600"
    compileArgs.inputChars          = "18000"
    compileArgs.dirSize             = "150"
    compileArgs.maximumMemory       = "65534"
    compileArgs.stackSize           = "63"
    destinationDir                  = abl.rcodeDir       // in theory, can leave this to the default; in practice, not
    dbConnections << 'icfdb'
    source('src/main/abl')
    propath = files('src/main/abl',
                    'src/main/abl/af/sup2',
                    'src/main/abl/wrappers',
                    "${abl.dlcHome}/src",
                    "${abl.dlcHome}/$packageType",
                    "$ablLibs" )
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="165">

---

The <SwmToken path="dynamics/build.gradle" pos="165:2:2" line-data="task packageCode(type: Copy){">`packageCode`</SwmToken> task packages the compiled code into the distribution directory, depending on the <SwmToken path="dynamics/build.gradle" pos="166:3:3" line-data="    dependsOn compileCode">`compileCode`</SwmToken> task.

```gradle
task packageCode(type: Copy){
    dependsOn compileCode
    doFirst{
        distDir.mkdirs()
    }
    from abl.rcodeDir
    into distDir
    exclude ".pct"
}
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="175">

---

A helper function <SwmToken path="dynamics/build.gradle" pos="175:2:2" line-data="def logWarnings(File pctDir, String logGrp) {">`logWarnings`</SwmToken> is defined to log compiler warnings to the build log.

```gradle
def logWarnings(File pctDir, String logGrp) {
    pctDir.traverse(type: FileType.FILES, nameFilter: ~/.*\.warnings/ )
        { logger.warn("[:$logGrp] " + it.text.trim()) }
}
```

---

</SwmSnippet>

<SwmSnippet path="/dynamics/build.gradle" line="179">

---

The default task is set to <SwmToken path="dynamics/build.gradle" pos="179:3:3" line-data="defaultTasks &#39;packageCode&#39;">`packageCode`</SwmToken>.

```gradle
defaultTasks 'packageCode'
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBT3BlbkVkZ2VfUmV0aXJlZF9Qcm9kdWN0cyUzQSUzQVBBUFA5Mg==" repo-name="OpenEdge_Retired_Products"><sup>Powered by [Swimm](/)</sup></SwmMeta>
