# Setting the PATH environment variable
echo "Linking to home folder binaries."
export PATH="$HOME/bin:$PATH"

echo "Adding /usr/local/bin to PATH"
export PATH="$PATH:/usr/local/bin"


# Enable conda
echo "Adding conda to PATH"
source $HOME/anaconda/etc/profile.d/conda.sh
source $HOME/anaconda/etc/profile.d/mamba.sh
mamba activate

# Finally, echo the state of the PATH environment variable.
echo "State of PATH environment variable:"
echo $PATH
