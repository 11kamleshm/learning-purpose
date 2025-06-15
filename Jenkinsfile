pipeline {
    agent { label 'Jenkins-Agent' }

    tools {
        jdk 'Java17'       // Check this name in Jenkins > Global Tool Config
        maven 'Maven3'     // Check this too
    }

    environment {
        IMAGE_NAME = 'kamlesh-java-app'
        CONTAINER_NAME = 'kamlesh-java-app-container'
        APP_PORT = '8080'
    }

    stages {
        stage('Cleanup Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout from SCM') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/11kamleshm/learning-purpose.git'
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test Application') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Stop Previous Container') {
            steps {
                // Prevent errors from "container already exists"
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d --name $CONTAINER_NAME -p $APP_PORT:8080 $IMAGE_NAME:latest'
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline executed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Please check the logs."
        }
    }
}
