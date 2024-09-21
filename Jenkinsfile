pipeline {
    agent { label 'docker' }

    stages {
        stage('prep') {
            steps {
                git branch: 'main', url: 'https://github.com/Ohabbak/Jenkins-Task'

            }
        }
        stage('build') {
            steps {
                sh 'docker build . -t jenkins-app:lts'
                sh 'docker run -d -p 3000:3000 jenkins-app:lts'
            }
        }
    }
}