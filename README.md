# kundana_finance_proj
DevOps Project: End-to-End CI/CD Pipeline Implementation

Project Overview:

This project aimed to automate the Continuous Integration and Continuous Deployment (CI/CD) process using a full stack of DevOps tools. The goal was to build an end-to-end pipeline where code changes are automatically built, tested, deployed, and monitored — from development to production — with minimal manual intervention.

Key Highlights:

 One-click deployment triggered automatically from Git push.
 Infrastructure as Code (IaC) handled via Terraform.
 Zero manual setup — all servers are auto-configured via Ansible.
 Container-based architecture ensures portability and scalability.
 Real-time monitoring provides insights into system health and resource utilization.

---

Business Challenge / Objective:

The main business challenge we addressed was automating the entire software delivery process. The requirement was:

 As soon as the developer pushes code to the GitHub master branch, the pipeline should:

•	Checkout and build the code.
•	Run unit tests and package the application.
•	Containerize it using Docker.
•	Provision infrastructure on-the-fly using Terraform.
•	Configure it automatically using Ansible.
•	Deploy to a test environment.
•	If tests pass, automatically deploy to production.
•	Monitor both environments (test & prod) using Prometheus and Grafana.

Step-by-Step Workflow:

1. Code Push & Trigger:

•	Developer pushes code to the `master` branch on GitHub.
•	This action triggers a Jenkins pipeline using a webhook integration.

2. Build Stage (CI):

•	Jenkins pulls the latest code.
•	Maven compiles the code, runs unit tests, and packages it into a `.jar` file.
•	If the build or test fails, Jenkins aborts the pipeline and sends a notification.

3. Containerization:

•	Jenkins uses a Dockerfile to containerize the application.
•	The Docker image is tagged with the build number and pushed to Docker Hub (or a private registry).

4. Infrastructure Provisioning (Terraform):

•	Jenkins runs Terraform scripts to provision new test EC2 instances on AWS.
•	These scripts define the instance type, security groups, networking, etc.
•	Once the infrastructure is up, Jenkins moves to the configuration stage.

5. Configuration Management (Ansible):

•	Jenkins triggers Ansible playbooks to install required software (like Java, Docker) on the new instance.
•	Also ensures environment variables and configuration files are set correctly.

6. Deployment to Test Server:

•	The Docker image is pulled onto the test server.
•	A container is launched running the new version of the application.

7. Automated Testing:

•	Post-deployment, Jenkins triggers test automation (like Selenium or Postman scripts).
•	If tests pass, Jenkins proceeds to the production deployment.

8. Production Environment:

•	Terraform provisions production infrastructure.
•	Ansible configures it.
•	Docker container is deployed with the latest stable image.

9. Monitoring Setup:

    Prometheus is installed on a monitoring node and configured to scrape metrics from both test and prod servers.
    Metrics include:
•	CPU usage
•	Disk usage
•	Memory utilization

    Grafana is connected to Prometheus as a data source and dashboards are created to visualize these metrics in real-time.
