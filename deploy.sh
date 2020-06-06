#!/bin/bash
# fucntion to check the stack exists
checkStackExists () {
    # Loop through our stacks
    for stackName in $(aws cloudformation describe-stacks --query "Stacks[].[StackName]" --output text); do
        if [ $stackName = $1 ] 
            then
                echo "Stack [$stackName] exists... can be updated!"
                return 0
        fi
    done
    # if stack not found return one and create it
    echo "Stack doesn't exist... needs creating!"
    return 1
}

# check stack exists
checkStackExists $1

if [ $? = 0 ] 
then
  aws cloudformation update-stack --stack-name $1 --template-body file://$2  --parameters file://$3 --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-west-2
  #aws cloudformation update-stack --stack-name $1 --template-body file://$2 --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-west-2
elif [ $? = 1 ]
then 
 aws cloudformation create-stack --stack-name $1 --template-body file://$2 --parameters file://$3 --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-west-2
 #aws cloudformation create-stack --stack-name $1 --template-body file://$2 --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-west-2
else
    echo "Unknown Error?"
fi