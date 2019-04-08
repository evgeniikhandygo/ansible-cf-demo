FROM williamyeh/ansible:alpine3

RUN echo "===> Installing boto3, botocore..."   && \
    apk --update add py-pip                     && \
    pip install --upgrade pip                   && \
    pip install botocore boto3

WORKDIR /opt/ebsco

COPY playbook.yaml .
COPY files/ ./files/

ENTRYPOINT [ "ansible-playbook" ]

CMD [ "-i localhost,", "playbook.yaml" ]