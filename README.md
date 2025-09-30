version: '3.7'

services:
  db:
    image: linuxserver/mariadb:latest
    container_name: mariadb
    restart: always
    volumes:
      - ./db/data:/var/lib/mysql
      - ./db/dump:/disk
      - ./db/initdb.d:/docker-entrypoint-initdb.d
    environment:
      TZ: Asia/Seoul
      MYSQL_ROOT_PASSWORD: mariadb
      MYSQL_DATABASE: nextcloud
      MYSQL_USER: nextcloud
      MYSQL_PASSWORD: nextcloud
    ports:
      - "33306:3306"

  web:
    image: linuxserver/nextcloud:latest
    container_name: nextcloud
    restart: always
    depends_on:
      - db
    volumes:
      - ./config:/config
      - ./data:/data
    environment:
      TZ: Asia/Seoul
      PUID: 1000
      PGID: 1000
      MYSQL_DATABASE: nextcloud
      MYSQL_USER: nextcloud
      MYSQL_PASSWORD: nextcloud
      MYSQL_HOST: db
    ports:
      - 30443:443
