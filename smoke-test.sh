aws ec2 describe-instances --query 'Reservations[*].Instances[*].PublicIpAddress' --filters "Name=tag:Project,Values=udacity" --output text > IP.txt
URL=`cat IP.txt`:80
# Test if website exists
if curl -s --head ${URL} 
    then
        return 0
else
    return 1
fi