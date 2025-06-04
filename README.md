# HolidayCalendar

A full-stack web application for managing and viewing holidays, built with DevOps tools like Docker, Ansible, and Terraform. Designed for cloud deployment and CI/CD workflows using GitHub Actions.

---
- **Database**: Dockerized PostgreSQL database setup.
- **Ansible**: Infrastructure configuration such as installing docker, building and pushing to the dokcerhub and pulling docker compose and running the app.
- **Terraform**: Cloud provisioning (Yandex Cloud S3 backend setup). Terraform state file is backed and stored in Object Yandex Cloud Storage. All .tf files create network and compute instance for running the app.
- **CI/CD**: GitHub Actions to automate build, and deploy. It uses Ansible to go through build and deployment. Also it edits the inventory file with the value of host from github actions variables. So when the infrastructure is built terraform outputs public IP and that IP should be placed in a variable, and then by pressing the button in action (possible via workflow_dispatch) the website is starting its deployment.
- **Dockerized**: All services containerized with Docker and Docker Compose.
