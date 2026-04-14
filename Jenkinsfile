pipeline {
    agent any

    parameters {
        choice(
            name: 'ACTION',
            choices: ['plan', 'apply'],
            description: 'Select the action to perform'
        )
        string(
            name: 'BRANCH',
            defaultValue: 'main',
            description: 'Branch to checkout'
        )
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: "${params.BRANCH}",
                    url: 'https://github.com/Shivani-1998-Devops/Terraform-Automation.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh "terraform init -reconfigure"
            }
        }

        stage('Terraform Validate') {
            steps {
                sh "terraform validate"
            }
        }

        stage('Action') {
            steps {
                script {
                    if (params.ACTION == 'plan') {
                        sh "terraform plan"
                    } else if (params.ACTION == 'apply') {
                        sh "terraform apply --auto-approve"
                    } else {
                        error "Invalid action"
                    }
                }
            }
        }
    }
}