## Docker Node dev environment
#### - with custom user [from Mosh]
#### - image size: 116,63 MB

#

### includes:
- Node - v14.16.0 [alpine]          Dockerfile      FROM node:14.16.0-alpine3.13
- Vite - v4.0.0                     bash            npm create vite@latest
- Environmental variables set via   .env



### Using

- build & run [via Makefile]
    ```bash
    make start
    ```

- enter / attach to the container... and create a `react` app
    ```bash
    docker exec --it ... bash
    ```
- inside container, run:
    ```bash
    npm create vite@latest
    cd ./vite-01

    # start
    npm run dev
    ```

- [OPTIONAL] chown to our WSL user of project files so we can change them in VSCode
    ```bash
    sudo chown -fR $(whoami):$(whoami) hello-world/
    ```


### Bibliography:
- https://forum.codewithmosh.com/t/docker-permission-error/3818/5
- https://www.youtube.com/watch?v=cchqeWY0Nak