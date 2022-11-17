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

2.  Install [Rain](https://github.com/aws-cloudformation/rain) and set `~/.aws/config` and `~/.aws/credentials`.

3.  Deploy stacks of an EC2 instance with a security group for SSH connection.

    ```sh
    $ rain deploy \
        ec2-instance-with-ssh-security-group.cfn.yml \
        ec2-instance-with-ssh-security-group
    ```
