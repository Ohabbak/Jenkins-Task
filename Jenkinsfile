pipeline {
    agent any
    
    environment {
            DOCKERHUB_CREDENTIALS = credentials('dockerhub')  // Reference for DockerHub credentials ID
            IMAGE_NAME = 'ohabbak/react-app'
            DOCKER_REGISTRY_URL = 'https://registry.hub.docker.com'
    }
    stages {
        
        stage('Checkout') {
            steps {
                // Checkout Terraform project from version control
                git branch: 'main', url: 'https://github.com/Ohabbak/Jenkins-Task.git'
            }
        }

        stage('Build') {
            steps {
                sh '''
                echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                docker build . -t ${IMAGE_NAME}:latest
                docker push ${IMAGE_NAME}:latest
                docker rmi ${IMAGE_NAME}:latest
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    scp -r k8s private:/home/ubuntu/app
                    ssh -o StrictHostKeyChecking=no private << EOF
                    sudo kubectl apply -f app/deployment.yml
                    sudo kubectl apply -f app/service.yml
                '''

            }
        }
    }
}