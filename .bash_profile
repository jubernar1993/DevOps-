####FROM HERE DOWN EVERYTHING IS TESTED AND IT WORKS

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs


JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.382.b05-1.amzn2.0.2.x86_64/jre"
M2_HOME="/opt/maven"
M2="/opt/maven/bin"
PATH=$PATH:$HOME/.local/bin:$HOME/bin



PATH=$PATH:$HOME/bin:$JAVA_HOME:$M2_HOME:$M2

export PATH
