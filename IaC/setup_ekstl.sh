#!/bin/bash
echo "Download kubectl..."
sudo curl --silent --location -o /usr/local/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/kubectl
sudo chmod +x /usr/local/bin/kubectl
echo "Download awscli..."
sudo pip install --upgrade awscli && hash -r
echo "Download tools..."
sudo apt install -y jq gettext bash-completion moreutils
echo "Install yq..."
echo 'yq() {
  docker run --rm -i -v "${PWD}":/workdir mikefarah/yq yq "$@"
}' | tee -a ~/.bashrc && source ~/.bashrc
echo "Check binaries are in the path and executeable..."
for command in kubectl jq envsubst aws
  do
    which $command &>/dev/null && echo "$command in path" || echo "$command NOT FOUND"
  done
echo "bash completion kubectl..."
kubectl completion bash >>  ~/.bash_completion
. /etc/profile.d/bash_completion.sh
. ~/.bash_completion
echo "Download ekstl..."
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
echo "Moving ekstl..."
sudo mv -v /tmp/eksctl /usr/local/bin
echo "Check ekstl version..."
eksctl version
echo "bash completion ekstl..."
eksctl completion bash >> ~/.bash_completion
. /etc/profile.d/bash_completion.sh
. ~/.bash_completion
