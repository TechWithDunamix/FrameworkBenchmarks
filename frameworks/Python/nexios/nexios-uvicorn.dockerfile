FROM python:3.13

WORKDIR /nexios

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip3 install cython==3.0.12

COPY requirements.txt requirements-uvicorn.txt ./

RUN pip3 install -r requirements.txt -r requirements-uvicorn.txt

COPY . ./

EXPOSE 8080

CMD uvicorn app:app --host 0.0.0.0 --port 8080 --workers $(nproc) --log-level error --no-access-log --no-proxy-headers 