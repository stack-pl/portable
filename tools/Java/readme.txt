To setup Java environment follow these steps below:

1. Download "Open JDK' (e.g. openjdk-21.0.1_windows-x64_bin.zip),

2. Then copy this file into "portable\tools\java\" directory.

3. BASH shell by running "portable\bash-shell.cmd" and install archive
   like shows the example below:
   ----------------------------------------------------
   $ cd tools/java
   $ ./install-java.sh ./openjdk-21.0.1_windows-x64_bin.zip
   ----------------------------------------------------

4. After that:
   a. the new JDK environment should be located in the following path:
         "portable\tools\java\jdk-x.y.z"
      for example: "portable\tools\java\jdk-21.0.1",
   b. new JDK's binary folder should be accessible in the following path:
         "portable\tools\java\jdk-x.y.z\bin"
      for example: "portable\tools\java\jdk-21.0.1\bin",

5. Configure JDK_HOME path in "portable\bash.cmd" file. 
   a. Open this file in your editor.
   b. Find "Java environment" section and edit the first line in this section:
      The line should points to JDK folder:
         ======================================
         set JDK_HOME=%~dp0tools\java\jdk-x.y.z
         ======================================
      for example: set JDK_HOME=%~dp0tools\java\jdk-21.0.1
   c. Save changes and close editor.

6. Verify Java environment:
   a. Launch BASH shell by running "portable\bash-shell.cmd",
   b. Type and run the following command:
      ---------------
      $ java -version
      ---------------
   c. You should get the response like that:
      ------------------------------------------------------------------
      $ java -version
      openjdk version "21.0.1" 2023-10-17
      OpenJDK Runtime Environment (build 21.0.1+12-29)
      OpenJDK 64-Bit Server VM (build 21.0.1+12-29, mixed mode, sharing)
      ------------------------------------------------------------------
      That means you correctly configured JAVA JDK environment.
      Finnally you can now run the "Hello World" aplication.
      In the bash terminal navigate to portable/work/java_sample project
      and launch it. As the result you should see welcoming text:
      ------------------------------
      $ cd java_sample
      $ java src/sample/Example.java
      Hello World!
      ------------------------------