
FROM oziproject/supported-python:2023

RUN set -ex \
    && apt-get update \
    && apt-get install --no-install-recommends -y git

RUN mkdir /pyc_wheel
WORKDIR /pyc_wheel
COPY action.sh /pyc_wheel/action.sh
COPY . /pyc_wheel/
RUN chmod +x /pyc_wheel/action.sh
ENV PATH /root/.pyenv/versions/3.11.8/bin:${PATH}
RUN python3.11 -m pip install .
ENTRYPOINT ["bash", "/pyc_wheel/action.sh" ]
