	FROM python:3.12.7-bookworm

	# Updating system packages
	RUN apt-get update
	RUN apt-get upgrade -y
	
	# Set ENV for Repository extract
	WORKDIR /webui
	COPY ["./basic_demo/", "./"]
	
	# Begin setup for Python
	RUN pip install --upgrade pip
	RUN pip install wheel
	RUN pip install -r requirements.txt
	RUN pip install triton
	RUN pip install --upgrade pip
	
	# Launch CogVLM2
	CMD CUDA_VISIBLE_DEVICES=0 QUANT=4 chainlit run --port 9000 /webui/web_demo.py
