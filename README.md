# ansible-cf-demo
cf deployment via ansible

### idea

The idea behind thata is to get files from a CF archetype repo, generate simple playbook file and then run via docker. 

Open questions:
1. AWS authorization from inside Jenkins pipeline;
    > Ansible role used inside that docker container uses boto3 (python lib for AWS) so it supports all possible kinds of authorization (i.e. env vars, profiles), we need to just find out which to use.
2. regardless of which auth mechanism will be used we need to ensure that credentials **are not exposed** in any way during a build (i.e. not printed, not published with docker image);
3. that ansible role does not support parameters subtitutions from another stack outputs. It is possible to code it, though, but do we need that?
   > It is quite possible that we do not need to support such functionality as this may error prone in case dependent stacks which supported by different teams and to not bother with cyclic dependencies. 
4. we need to define and hardly check (via archetype validator probably) a contract for user defined templates (i.e. `Eis*` tags should be defined everywhere and such).

### launch

To launch:
1. populate `aws_access_key`, `aws_secret_key` and `security_token` in the `playbook.yaml` file with your AWS credentials;
2. go into the project directory; 
3. run
    ```bash
    docker build -t test . && docker run test
    ```