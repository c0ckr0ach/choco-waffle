## Architecture & request flow
* Client request: user makes a request via the browser to port 8080 on the EC2 public IP
* Reverse proxy & routing: the nginx container receives the traffic on port 8080, serving frontend files and proxying any /api/* requests
 Internal docker network: nginx forwards the api calls to backend across the custom bridge network
* Response: express processes the request, generates the response and returns it to nginx which sends it back to client.

## Tech Stack
* Infrastructure & Cloud: AWS EC2, terraform
* Containerization & web server: Docker, Docker compose, Nginx
* Backend: Node.js, express
* CI/CD & Version control: Git, github-actions, github

## Secrets
* EC2_HOST: Public IPv4  address of EC2 host
* EC2_USER: default SSH username
* EC2_SSH_KEY: Private SSH key for server access

## Local Setup
# Clone the repository
docker compose up -d
