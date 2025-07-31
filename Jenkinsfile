pipeline {
    agent any

    environment {
        IMAGE_NAME = "kundanadileepm/finance-app"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Clone') {
            steps {
                git url: 'https://github.com/kundanadileepm/kundana_finance_proj.git', branch: 'main'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'mvn clean verify'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh '''
                      echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
                      docker push $IMAGE_NAME:$IMAGE_TAG
                    '''
                }
            }
        }
    }
}
