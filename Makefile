# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dvallien <dvallien@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/02 16:22:14 by dvallien          #+#    #+#              #
#    Updated: 2022/12/02 17:07:50 by dvallien         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := inception

# -f : specify name and path of the compose file
# -p : specify a project name
DOCKER_COMPOSE := docker-compose -f srcs/docker-compose.yml -p $(NAME)

all: up 

# --detach : run containers in the background
up:		build
		$(COMPOSE) up --detach

down:
		$(COMPOSE) down

# --parallel : allowing compose to build up to 5 img simultaneously.
build:	volumes
		$(COMPOSE) build --parallel
			
create:	build
		$(COMPOSE) create


start:
		$(COMPOSE) start
		
restart:
		$(COMPOSE) restart
		
stop:
		$(COMPOSE) stop

clean:
			docker-compose --project-directory=srcs down --rmi all

fclean:
			docker-compose --project-directory=srcs down --rmi all --volumes
			sudo rm -rf /home/$(USER)/data/*

re: fclean all

volumes:
		@mkdir -p /home/$(USER)/data/wordpress
		@mkdir -p /home/$(USER)/data/mariadb
		
.PHONY: all up down build exec start restart stop clean fclean re volumes