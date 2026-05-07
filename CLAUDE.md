# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an infrastructure-as-code and GitOps repository for deploying the Spring PetClinic application on AWS. The application itself is not hosted here — this repo manages cloud infrastructure, Kubernetes deployment, and the GitOps delivery pipeline.

## Repository Structure

```
petclinic-platform/
├── terraform/modules/    # AWS infrastructure (VPC, EKS, RDS, ECR, Secrets)
├── helm/petclinic/       # Helm chart for Kubernetes deployment
├── argocd/               # ArgoCD application manifests (GitOps)
└── .github/workflows/    # CI/CD pipelines (to be added)
```

## Technology Stack

- **Infrastructure:** Terraform on AWS (VPC, EKS, RDS, ECR, Secrets Manager)
- **Orchestration:** Kubernetes via EKS, deployed with Helm
- **GitOps:** ArgoCD watching this repo
- **Containers:** Images stored in ECR

## Terraform

Modules live under `terraform/modules/`. Each module (`vpc`, `eks`, `rds`, `ecr`, `secrets`) is intended to be independently composable. A root `terraform/` configuration (not yet added) will compose these modules.

Standard Terraform workflow:
```bash
terraform init
terraform plan
terraform apply
```

State files and `.tfvars` files are gitignored — never commit them.

## Helm

The chart is at `helm/petclinic/`. Templates go in `helm/petclinic/templates/`. Deploy with:
```bash
helm upgrade --install petclinic ./helm/petclinic -f values.yaml
```

## ArgoCD

`argocd/` will hold `Application` manifests that point ArgoCD at the `helm/petclinic/` chart in this repo. Changes merged to `main` are automatically synced to the cluster.

## Secrets

Secrets are managed through AWS Secrets Manager (see `terraform/modules/secrets/`). Never hardcode credentials or commit `.tfvars` files.
