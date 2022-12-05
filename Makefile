# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dvallien <dvallien@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/02 16:22:14 by dvallien          #+#    #+#              #
#    Updated: 2022/12/05 17:15:15 by dvallien         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -f : specify name and path of the compose file
# -p : specify a project name
DOCKER-COMPOSE := docker-compose -f srcs/docker-compose.yml

all: build
	
# --detach : run containers in the background
up:		
		@printf "\033[0;32mBuild, recreate, start containers\033[0m\n"
		$(DOCKER-COMPOSE) up -d
		
build:	volumes
		@printf "\033[0;32mBuild docker images from dockerfiles\033[0m\n"
		dumb-init $(DOCKER-COMPOSE) up --build -d	

start:
		@printf "\033[0;32mStart stopped containers\033[0m\n"
		$(DOCKER-COMPOSE) start
		
restart:
		@printf "\033[0;32mRestart stopped containers\033[0m\n"
		$(DOCKER-COMPOSE) restart

stop:
		@printf "\033[0;32mStop containers (main process receive SIGTERM) \033[0m\n"
		$(DOCKER-COMPOSE) stop
		
down:
		@printf "\033[0;32mStop and remove containers, networks, volumes, images \033[0m\n"
		$(DOCKER-COMPOSE) down
		
ps:
		@printf "\033[0;32mList containers\033[0m\n"
		$(DOCKER-COMPOSE) ps

images:
		@printf "\033[0;32mList images\033[0m\n"
		docker images

volume:
		@printf "\033[0;32mList volumes\033[0m\n"
		docker volume ls
#docker volume inspect VOLUME
		
clean: 
		@printf "\033[0;32mRemoves images and containers\033[0m\n"
		$(DOCKER-COMPOSE) down --rmi all 

fclean: 
		@printf "\033[0;32mRemoves images, containers and volumes\033[0m\n"
		$(DOCKER-COMPOSE) down --rmi all --volumes 
		sudo rm -rf /home/$(USER)/data/*
		
prune:	down fclean
		@printf "\033[0;32mRemoves all unused images, containers and volumes\033[0m\n"
		sudo docker system prune -f -a

re: fclean all
		
.PHONY: all build up volumes start restart down stop ps images volumes clean fclean re 