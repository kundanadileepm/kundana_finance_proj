pipeline {
    agent any

    environment {
        IMAGE_NAME = 'kundanadileepm/finance-app'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Build & Test') {
            steps {
                echo '🔨 Running Maven Build and Tests...'
                sh 'mvn clean verify'
            }
        }

        stage('Docker Build') {
            steps {
                echo '🐳 Building Docker Image...'
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Docker Push') {
            steps {
                echo '🚀 Pushing Image to DockerHub...'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh '''
                        echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
                        docker push $IMAGE_NAME:$IMAGE_TAG
                    '''
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build and Push Successful!'
        }
        failure {
            echo '❌ Build Failed. Check logs above.'
        }
    }
}
