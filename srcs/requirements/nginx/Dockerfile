FROM debian:buster

# UPDATE UPGRADE SERVER PACKAGE | -y to accept all during installation
RUN apt-get update -y
RUN apt-get upgrade -y

# INSTALL SERVER NGINX
RUN apt-get install -y nginx

# INSTALL OPENSSL TO GENERATE OUR KEY AND CERTIFICATE FILES
RUN apt-get install -y openssl

# CLEAN OUT THE CACHE
RUN	apt-get clean -y

# GENERATE SSL KEY & CERTIFICATE
	# 	req — to specify we want to use -x509
	# 	x509 specify we want to create self-signed certificate
	# 	nodes skip option to secure our certificate with passphrase so nginx can read it
	# 	newrsa rsa:2048 — specifies that we want to generate both a new certificate and a new key with an RSA key of 2048 bits
	# 	keyout /etc/.../yourfile.key — specifies the location of the output .key file.
	# 	out /etc/.../yourfile.crt — specifies the location of the output .crt file.
RUN openssl req -x509 -newkey rsa:2048 -nodes -subj /C=FR \
	-keyout /etc/ssl/dvallien.42.fr.key -out /etc/ssl/dvallien.42.fr.crt;

# NGINX CONFIGURATION FILE : Associate our SSL certificate to our conf file nginx
	# 	copy file nginx.conf to /etc/nginx/sites-available
	# 	ln -s is to create symboliq link btw sites available and sites enabled
COPY	/conf/nginx.conf /etc/nginx/sites-available/dvallien.42.fr.conf
RUN		ln -s /etc/nginx/sites-available/dvallien.42.fr.conf /etc/nginx/sites-enabled/dvallien.42.fr.conf

EXPOSE 443 

# The daemon off directive tells Nginx to stay in the foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]	
