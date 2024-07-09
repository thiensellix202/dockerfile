#update
FROM ubuntu:latest

#use the last
RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip

#set
WORKDIR /app

#jupyrte
RUN pip3 install jupyterlab

#port
EXPOSE 8080

#start
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port-8080", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
