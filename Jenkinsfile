pipeline {
    agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000'
        }
    }
    environment {
        CI = 'true'
        DOCKER_PWD = credentials('docker-login-pwd')
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'npm test'
            }
        }
        stage('Build & Push Docker image') {
            steps {
                // sh './jenkins/scripts/build_and_push.sh'
                sh './build_and_push.sh'
            }
        }
        stage('Deploy to Staging') {
            steps {
                echo 'Deploy to Staging...'
            }
        }
        stage('Deploy to Production') {
            steps {
                echo 'Deploy to Production...'
            }
        }
    }
}