pipeline {
    agent any

    environment {
        IMAGE_NAME = 'kundanadileepm/kundana_finance_app:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/kundanadileepm/kundana_finance_proj.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    withCredentials([usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )]) {
                        sh '''
                            docker build -t $IMAGE_NAME .
                            echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                            docker push $IMAGE_NAME
                            docker logout
                        '''
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build and push successful!'
        }
        failure {
            echo '❌ Build or push failed.'
        }
    }
}
