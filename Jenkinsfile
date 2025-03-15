pipeline {
    agent any

    environment {
        M2_HOME = "/opt/homebrew/Cellar/maven/3.9.9/libexec"
        PATH = "$M2_HOME/bin:/opt/homebrew/bin:$PATH"
        DOCKER_HUB_CREDENTIALS = 'dockerhub-credentials'
        DOCKER_IMAGE_NAME = 'thuhale2210/comp367-lab3-maven-webapp'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', url: 'https://github.com/thuhale2210/comp367-lab2-CI-pipeline.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                echo 'Building the project...'
                sh '/opt/homebrew/bin/mvn clean package'
		sh 'ls -lh target/'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh '/opt/homebrew/bin/mvn test'
            }
        }

        stage('Docker Login') {
            steps {
                echo 'Logging in to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $DOCKER_IMAGE_NAME .'
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                sh 'docker push $DOCKER_IMAGE_NAME'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the Docker container...'
                sh 'docker run -p 8080:8080 -d $DOCKER_IMAGE_NAME'
            }
        }
    }
}
