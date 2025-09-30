version: '3.7'

services:
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
      # DB 연결 환경변수
      MYSQL_DATABASE: mariadb
      MYSQL_USER: root
      MYSQL_PASSWORD: mariadb
      MYSQL_HOST: db
    ports:
      - 30443:443

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
      MYSQL_DATABASE: mariadb
    ports:
      - "33306:3306"
