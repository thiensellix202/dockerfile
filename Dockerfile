#update
FROM fredblgr/ubuntu-novnc:20.04

#port
EXPOSE 80

#setup
ENV RESOLUTTION 1707x1067

#start
CMD ["supervisord", "-c", "/etc/supervisord/supervisord.conf"]
