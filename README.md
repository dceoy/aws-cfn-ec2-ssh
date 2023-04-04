aws-cfn-ec2-ssh
===============

AWS CloudFormation stacks of an EC2 instance with a security group for SSH connection

[![Lint](https://github.com/dceoy/aws-cfn-ec2-ssh/actions/workflows/lint.yml/badge.svg)](https://github.com/dceoy/aws-cfn-ec2-ssh/actions/workflows/lint.yml)

Installation
------------

1.  Check out the repository.

    ```sh
    $ git clone git@github.com:dceoy/aws-cfn-ec2-ssh.git
    $ cd aws-cfn-ec2-ssh
    ```

2.  Install [AWS CLI](https://aws.amazon.com/cli/) and set `~/.aws/config` and `~/.aws/credentials`.

3.  Create a parameter JSON file.

    ```sh
    $ cp example.parameters.json dev.parameters.json
    $ vi dev.parameters.json  # => edit
    ```

    - The latest Linux Amazon ECS-optimized AMIs can be retrieved as follows:

      ```sh
      $ aws ssm get-parameters --names /aws/service/ecs/optimized-ami/amazon-linux-2/recommended \
          | jq -r .Parameters[0].Value \
          | jq -r .image_id
      ```

      available parameter names:
      - Amazon Linux 2: `/aws/service/ecs/optimized-ami/amazon-linux-2/recommended`
      - Amazon Linux 2 (arm64): `/aws/service/ecs/optimized-ami/amazon-linux-2/arm64/recommended`
      - Amazon Linux 2 (GPU): `/aws/service/ecs/optimized-ami/amazon-linux-2/gpu/recommended`
      - Amazon Linux 2 (Inferentia): `/aws/service/ecs/optimized-ami/amazon-linux-2/inf/recommended`

4.  Deploy stacks for an EC2 instance.

    ```sh
    # connection via SSH
    $ aws cloudformation create-stack \
        --stack-name ec2-instance-for-ssh \
        --template-body file://ec2-instance-for-ssh.cfn.yml \
        --parameters file://dev.parameters.json

    # connection via AWS SSM Session Manager
    $ aws cloudformation create-stack \
        --stack-name ec2-instance-for-ssm-session-manager \
        --template-body file://ec2-instance-for-ssm-session-manager.cfn.yml \
        --parameters file://dev.parameters.json \
        --capabilities CAPABILITY_NAMED_IAM
    ```

    - When using [Rain](https://github.com/aws-cloudformation/rain), deploy stacks as follows:

      ```sh
      $ jq -r '.[] | to_entries | "\(.[0].value)=\(.[1].value)"' dev.parameters.json \
          | paste -sd , - \
          | xargs -I{} -t rain deploy -y --params {} \
            ec2-instance-for-ssh.cfn.yml ec2-instance-for-ssh
      ```
