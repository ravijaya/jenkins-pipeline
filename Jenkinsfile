pipeline {
    agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000'
        }
    }
    environment {
        CI = 'true'
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