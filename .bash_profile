export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

#-------------------------------------------------------------------------------
# ALIAS LIST
#-------------------------------------------------------------------------------
alias vim='/Users/mpkuti/mvim -v'
alias log="tail -40 -f /var/log/system.log"

#alias dropbox='cd /Volumes/HD/Dropbox'
#-------------------------------------------------------------------------------

# add the bin dir to PATH:
export PATH=~/bin:$PATH

#-------------------------------------------------------------------------------
# MISC.
#-------------------------------------------------------------------------------
export EDITOR='vim'
export CLICOLOR=1
export LSCOLORS=ahhxhxhxhxhxhxhxhxahah
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# HOMEBREW
#-------------------------------------------------------------------------------
export PATH=/usr/local/bin:$PATH

# Command tab-completion:
source `brew --repository`/Library/Contributions/brew_bash_completion.sh

export HOMEBREW_GITHUB_API_TOKEN=30f640cbea38a0820d4a76d5bd982a78e3edf812
#-------------------------------------------------------------------------------

export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

#-------------------------------------------------------------------------------
# MY OWN UPDATE-ALL SCRIPT
#-------------------------------------------------------------------------------
alias update-all='sudo tlmgr update -self && sudo tlmgr update -all && brew upgrade && brew update && vim +PluginUpdate +qall && conda update conda && conda update anaconda'
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# LATEX
#-------------------------------------------------------------------------------
# TexLive 2014 installation:
PATH=/usr/local/texlive/2014/bin/x86_64-darwin:$PATH
#-------------------------------------------------------------------------------

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH

#-------------------------------------------------------------------------------
# PYTHON
#-------------------------------------------------------------------------------
# added by Anaconda 2.0.1 installer
export PATH="/Users/mpkuti/anaconda/bin:$PATH"
#-------------------------------------------------------------------------------
