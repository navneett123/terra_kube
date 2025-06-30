FROM python:3.10-slim
WORKDIR /app
COPY app/ /app
RUN pip install flask
ENV DEPLOYMENT_NAME=myapp
ENV IMAGE_VERSION=latest
CMD ["python", "app.py"]
