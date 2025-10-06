# 🚀 AWS CI/CD Setup Guide - Gustavo Muñoz Ecosystem

## 🎯 Objetivo
Configurar despliegue automático para todos los proyectos del ecosystem usando GitHub Actions + AWS.

## 📋 Prerequisitos AWS

### 1. **Servicios AWS Necesarios**
```
Portfolio Principal → AWS S3 + CloudFront
ProjetHub Frontend → AWS S3 + CloudFront  
ProjetHub Backend → AWS ECS/Fargate + RDS
AppControl Frontend → AWS S3 + CloudFront
AppControl Backend → AWS ECS/Fargate + RDS
AppVeterinaria Frontend → AWS S3 + CloudFront
AppVeterinaria Backend → AWS ECS/Fargate + RDS
```

### 2. **IAM User y Policies**
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow", 
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::gustavo-portfolio/*",
        "arn:aws:s3:::gustavo-projethub/*", 
        "arn:aws:s3:::gustavo-appcontrol/*",
        "arn:aws:s3:::gustavo-appveterinaria/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "cloudfront:CreateInvalidation"
      ],
      "Resource": "*"
    }
  ]
}
```

## 🔐 GitHub Secrets Configuration

### Para cada repositorio, configurar estos secrets:

#### **Portfolio Principal**
```
AWS_ACCESS_KEY_ID=AKIA...
AWS_SECRET_ACCESS_KEY=...
AWS_REGION=us-east-1
AWS_S3_BUCKET_NAME=gustavo-portfolio
AWS_CLOUDFRONT_DISTRIBUTION_ID=E1234567890
```

#### **ProjetHub** 
```
AWS_ACCESS_KEY_ID=AKIA...
AWS_SECRET_ACCESS_KEY=...
AWS_REGION=us-east-1
AWS_S3_BUCKET_NAME_FRONTEND=gustavo-projethub-frontend
AWS_CLOUDFRONT_DISTRIBUTION_ID=E1234567891
AWS_ECS_CLUSTER_NAME=projethub-cluster
AWS_ECS_SERVICE_NAME=projethub-backend
```

#### **AppControl**
```
AWS_ACCESS_KEY_ID=AKIA...
AWS_SECRET_ACCESS_KEY=...
AWS_REGION=us-east-1
AWS_S3_BUCKET_NAME_FRONTEND=gustavo-appcontrol-frontend
AWS_CLOUDFRONT_DISTRIBUTION_ID=E1234567892
AWS_ECS_CLUSTER_NAME=appcontrol-cluster
AWS_ECS_SERVICE_NAME=appcontrol-backend
```

#### **AppVeterinaria**
```
AWS_ACCESS_KEY_ID=AKIA...
AWS_SECRET_ACCESS_KEY=...
AWS_REGION=us-east-1
AWS_S3_BUCKET_NAME_FRONTEND=gustavo-appveterinaria-frontend
AWS_CLOUDFRONT_DISTRIBUTION_ID=E1234567893
AWS_ECS_CLUSTER_NAME=appveterinaria-cluster
AWS_ECS_SERVICE_NAME=appveterinaria-backend
```

## 📄 GitHub Actions Workflows

### Portfolio Principal (.github/workflows/deploy.yml)
```yaml
name: Deploy Portfolio to AWS
on:
  push:
    branches: [ master ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    
    - name: Setup Node.js 18
      uses: actions/setup-node@v4
      with:
        node-version: '18'
        cache: 'npm'
        
    - name: Install dependencies
      run: npm ci
      
    - name: Build project
      run: npm run build
      
    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v4
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ${{ secrets.AWS_REGION }}
        
    - name: Deploy to S3
      run: |
        aws s3 sync dist/ s3://${{ secrets.AWS_S3_BUCKET_NAME }} --delete
        
    - name: Invalidate CloudFront
      run: |
        aws cloudfront create-invalidation \
          --distribution-id ${{ secrets.AWS_CLOUDFRONT_DISTRIBUTION_ID }} \
          --paths "/*"
```

### ProjetHub Frontend (.github/workflows/deploy-frontend.yml)
```yaml
name: Deploy ProjetHub Frontend
on:
  push:
    branches: [ main ]
    paths: [ 'frontend/**' ]

jobs:
  deploy-frontend:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    
    - name: Setup Node.js 18
      uses: actions/setup-node@v4
      with:
        node-version: '18'
        cache: 'npm'
        cache-dependency-path: 'frontend/package-lock.json'
        
    - name: Install dependencies
      working-directory: ./frontend
      run: npm ci
      
    - name: Build project
      working-directory: ./frontend
      run: npm run build
      
    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v4
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ${{ secrets.AWS_REGION }}
        
    - name: Deploy to S3
      run: |
        aws s3 sync frontend/dist/ s3://${{ secrets.AWS_S3_BUCKET_NAME_FRONTEND }} --delete
        
    - name: Invalidate CloudFront
      run: |
        aws cloudfront create-invalidation \
          --distribution-id ${{ secrets.AWS_CLOUDFRONT_DISTRIBUTION_ID }} \
          --paths "/*"
```

### ProjetHub Backend (.github/workflows/deploy-backend.yml)
```yaml
name: Deploy ProjetHub Backend
on:
  push:
    branches: [ main ]
    paths: [ 'backend/**' ]

jobs:
  deploy-backend:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    
    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v4
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ${{ secrets.AWS_REGION }}
        
    - name: Login to Amazon ECR
      id: login-ecr
      uses: aws-actions/amazon-ecr-login@v2
      
    - name: Build, tag, and push image to Amazon ECR
      working-directory: ./backend
      env:
        ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
        ECR_REPOSITORY: projethub-backend
        IMAGE_TAG: ${{ github.sha }}
      run: |
        docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .
        docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
        
    - name: Deploy to ECS
      run: |
        aws ecs update-service \
          --cluster ${{ secrets.AWS_ECS_CLUSTER_NAME }} \
          --service ${{ secrets.AWS_ECS_SERVICE_NAME }} \
          --force-new-deployment
```

## 🎯 Workflow Completo

### 1. **Setup Inicial**
```bash
# 1. Crear buckets S3
aws s3 mb s3://gustavo-portfolio
aws s3 mb s3://gustavo-projethub-frontend  
aws s3 mb s3://gustavo-appcontrol-frontend
aws s3 mb s3://gustavo-appveterinaria-frontend

# 2. Configurar bucket policies para web hosting
# 3. Crear distribuciones CloudFront
# 4. Crear clusters ECS para backends
# 5. Configurar RDS para bases de datos
```

### 2. **Desarrollo y Deploy**
```bash
# Desarrollo local
.\start-all.ps1

# Cambio en cualquier proyecto
git add .
git commit -m "feat: nueva funcionalidad"
git push origin main

# ✨ Deploy automático!
# Frontend → S3 + CloudFront  
# Backend → ECS/Fargate
# ¡Tu web se actualiza automáticamente!
```

### 3. **URLs Finales**
```
Portfolio: https://gustavo-portfolio.com
ProjetHub: https://projethub.gustavo-portfolio.com
AppControl: https://appcontrol.gustavo-portfolio.com  
AppVeterinaria: https://veterinaria.gustavo-portfolio.com
```

## 💰 Costos Estimados AWS (mensual)
- **S3**: $5-10 (hosting estático)
- **CloudFront**: $5-15 (CDN)
- **ECS Fargate**: $20-50 (por backend)
- **RDS**: $15-30 (bases de datos)
- **Route53**: $0.50 (DNS)

**Total estimado: $50-120/mes** para todo el ecosystem

---

*Desarrollado por Gustavo Muñoz - Ecosystem CI/CD Setup*