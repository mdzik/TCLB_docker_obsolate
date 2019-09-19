
docker run -it --env http_proxy=$http_proxy --env https_proxy=$https_proxy --network host --mount type=bind,source="/home/mdzik/projekty/TCLB,target=/current"  82d2618722b7 /bin/bash 

#/buildTCLB.sh
