# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs
JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.382.b05-1.amzn2.0.2.x86_64/jre"
PATH=$JAVA_HOME/bin:$PATH
PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
