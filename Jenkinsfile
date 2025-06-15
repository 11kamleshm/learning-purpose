pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/your-username/learning-purpose.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                echo 'No tests configured yet.'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }
    }
}
