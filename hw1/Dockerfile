FROM zyclonite/sysbench
COPY ./shell_for_dockerfile ./test
WORKDIR ./test
RUN CPU1.sh
RUN CPU2.sh
RUN file1.sh
RUN file2.sh
