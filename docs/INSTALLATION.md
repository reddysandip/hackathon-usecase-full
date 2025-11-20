# Installation & Deployment Guide

Prereqs:
- Docker (local)
- Node 18+, npm
- Java 17 + Maven
- kubectl, gcloud, terraform 1.3+
- GitHub repository with secrets: GCP_SA_KEY (JSON), GCP_PROJECT

Quick local:
1. Patient service:
   cd application-service/patient-service
   npm install
   docker build -t patient-service:local .
   docker run -p 3001:3001 patient-service:local
2. Appointment service:
   cd application-service/appointment-service
   npm install
   PATIENT_URL=http://host.docker.internal:3001 docker run -p 3002:3002 -e PATIENT_URL=http://host.docker.internal:3001 appointment-service:local
3. Order service:
   cd order-service
   ./mvnw package -DskipTests
   java -jar target/*.jar

Deploy to GKE (high-level):
- Configure gcloud and enable APIs:
  gcloud auth login
  gcloud config set project <PROJECT_ID>
  gcloud services enable container.googleapis.com compute.googleapis.com monitoring.googleapis.com logging.googleapis.com storage.googleapis.com
- Create or use a GCS bucket for Terraform state
- Update terraform/envs/dev/backend.tf with your bucket
- terraform init, plan, apply in terraform/ directory
- Build & push Docker images to GCR or Artifact Registry
- kubectl apply -f k8s/
