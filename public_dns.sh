#!/bin/bash

instance_id=$(wget -q -O - http://169.254.169.254/latest/meta-data/instance-id)

# echo $instance_id

aws ec2 describe-instances --instance-ids ${instance_id} --query 'Reservations[].Instances[].PublicDnsName' | grep ec2 | sed -e 's/^[ \t]*//' | sed -e 's/^"//' -e 's/"$//'
