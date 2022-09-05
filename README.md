[![Testing with GitHub Actions](https://github.com/datdt201/udacity/actions/workflows/pythonapp.yml/badge.svg?branch=projects%2Fml-app-cicd)](https://github.com/datdt201/udacity/actions/workflows/pythonapp.yml)

# Overview
This project will demonstrate how to apply Continuous Integration (CI) and Continuous Delivery (CD) for Python based application.
After this project, you will be able to:
- Deploy a Machine Learning API written in Python Flask to Azure App Service.
- Build a CI pipeline using GitHub Actions
- Build a CD pipeline using Azure DevOps

## Project Plan
* [Project plan](docs/project-plan.xlsx)
* [Tasks Kanban](https://trello.com/b/6Bz6jB9R/udacity-ml-app)

## Architectural Diagram
![image](https://user-images.githubusercontent.com/65603266/188467291-6eb213a2-6142-4024-9371-f4de9bbc8d9b.png)

## Instructions
### Deploy project with Azure Cloud Shell  
* Clone project into Azure Cloud Shell
```
git clone https://github.com/datdt201/udacity.git -b projects/ml-app-cicd
cd udacity
```

* Install Python virtual environment
```
python3 -m venv .udacity-devops
source .udacity-devops/bin/activate
```
	
* Run lint and tests
```
make all
```
This steps also be triggered automatically by GitHub Actions when new code is pushed

* Deploy project to Azure App Service
```
make web-app
```
![](docs/screenshots/app-service-deploy.png)

### Deploy project with Azure DevOps
* [Configure project in Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops#create-an-azure-devops-project-and-connect-to-azure).

* Run pipeline to deploy project to App Service
![](docs/screenshots/azure-devops-pipeline.png)
![](docs/screenshots/azure-devops-pipeline-2.png)

### Verify application
* Go to Azure Portal confirm created App Service
![](docs/screenshots/app-service.png)
* Call prediction API from Azure Cloud Shell.
The output should look similar to this:
![](docs/screenshots/ml-predict.png)

* Output of streamed log files from deployed application
```
az webapp log tail --resource-group Azuredevops --name datdt201-ml-service
```

## Enhancements
Following item can be done next to improve the project.
* Build application as image and do a containerized deployment
* Add more testing like integration test to the pipelines
* Define user parameters for Azure DevOps pipelines 
* Split build and deploy stages into 2 pipelines so that we can re-use built artifact to deploy to different environment

## Demo

