pipeline {
    agent any

    environment {
        M2_HOME = "/opt/homebrew/Cellar/maven/3.9.9/libexec"
        PATH = "$M2_HOME/bin:/opt/homebrew/bin:$PATH"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/thuhale2210/comp367-lab2-CI-pipeline.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                sh '/opt/homebrew/bin/mvn clean package'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh '/opt/homebrew/bin/mvn test'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the web application...'
            }
        }
    }
}
