pipeline {
    agent { label 'Jenkins-Agent' }

    tools {
        jdk 'Java17' // Confirm 'Java17' is the exact name in Jenkins Global Tool Configuration
        maven 'Maven3' // Confirm 'Maven3' is the exact name in Jenkins Global Tool Configuration
    }

    stages {
        stage("Cleanup Workspace") {
            steps {
                cleanWs()
            }
        }

        stage("Checkout from SCM") {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/11kamleshm/learning-purpose.git'
            }
        }

        stage("Build Application") {
            steps {
                sh 'mvn clean package'
            }
        }

        stage("Test Application") {
            steps {
                sh 'mvn test'
            }
        }

        stage("Build docker image"){
            steps{
                // Corrected Docker build command
                // -t flag tags the image with a name and optional tag (e.g., kamlesh-java-app:latest)
                // . (dot) at the end tells Docker to build from the Dockerfile in the current directory
                sh 'docker build -t kamlesh-java-app:latest .'
            }
        }

        stage("Run Docker container"){
            steps{
                // Corrected Docker run command
                // -d: Run in detached mode (in the background)
                // -p 8080:8080: Map port 8080 from the container to port 8080 on the host
                // kamlesh-java-app:latest: The name of the image to run
                sh 'docker run -d -p 8080:8080 kamlesh-java-app:latest'
            }
        }
    }
}
