FROM python:3.8.0

RUN pip install \
    mlflow==1.18.0 \
    pymysql==1.0.2 \
    boto3 && \
    mkdir /mlflow/

EXPOSE 5000

ENTRYPOINT ["mlflow", "server"]

CMD ["--host 0.0.0.0"]
CMD ["--port 5000"]
CMD ["--default-artifact-root ${BUCKET}"]
CMD ["--backend-store-uri mysql+pymysql://${USERNAME}:${PASSWORD}@${HOST}:${PORT}/${DATABASE}"]
