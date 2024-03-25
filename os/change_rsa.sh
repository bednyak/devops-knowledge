echo "Running cp "$1"/"$1"_rsa ./id_rsa"
cp $1/$1_rsa ./id_rsa
cp $1/$1_rsa.pub ./id_rsa.pub
echo "Switched to the '"$1"' rsa"
