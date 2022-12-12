# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dvallien <dvallien@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/02 16:22:14 by dvallien          #+#    #+#              #
#    Updated: 2022/12/12 15:45:37 by dvallien         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -f : specify name and path of the compose file
# -p : specify a project name
DOCKER-COMPOSE := docker-compose -f srcs/docker-compose.yml

# --detach : run containers in the background
all:
	@printf "\033[0;32mBuild, recreate, start containers and build images from dockerfiles\033[0m\n"
	$(DOCKER-COMPOSE) up -d --build
	
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
		
.PHONY: all start restart stop down ps images volume clean fclean prune re 