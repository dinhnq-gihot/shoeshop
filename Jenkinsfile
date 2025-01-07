pipeline {
    agent any

    environment {
        // Define the Docker registry variables
        DOCKER_IMAGE = "shoeshop"  // Replace with your Docker image name
        DOCKER_REGISTRY = "ghcr.io"    // Replace with your Docker registry
    }

    stages {
        stage('Check for Tag') {
            steps {
                script {
                    // Get the current tag, if any
                    env.GIT_TAG = sh(script: "git describe --tags --exact-match || echo ''", returnStdout: true).trim()

                    // Ensure the pipeline only runs for tags starting with 'v'
                    if (!env.GIT_TAG.startsWith('v')) {
                        error("Build triggered, but no valid release tag (v*) found. Exiting...")
                    }

                    echo "Triggered by release tag: ${env.GIT_TAG}"
                }
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    // Use Jenkins credentials for Docker login
                    withCredentials([usernamePassword(credentialsId: 'docker-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh """
                        echo "$DOCKER_PASS" | docker login $DOCKER_REGISTRY -u "$DOCKER_USER" --password-stdin 
                        """
                    }
                    env.REGISTRY_USER = $DOCKER_USER
                    echo "REGISTRY_USER: ${env.REGISTRY_USER}"
                }
            }
        }

    //     stage('Build and Push Docker Image') {
    //         steps {
    //             script {
    //                 // Build and tag the Docker image
    //                 sh """
    //                 docker build -t $DOCKER_REGISTRY/$DOCKER_IMAGE:${env.GIT_TAG} .
    //                 docker push $DOCKER_REGISTRY/$DOCKER_IMAGE:${env.GIT_TAG}
    //                 """
    //             }
    //         }
    //     }

    //     stage('Deploy with Docker Compose') {
    //         steps {
    //             script {
    //                 // Deploy using docker-compose
    //                 sh """
    //                 docker-compose ./docker/docker-compose.yml down
    //                 docker-compose ./docker/docker-compose.yml up -d
    //                 """
    //             }
    //         }
    //     }
    }

    // post {
    //     always {
    //         script {
    //             // Clean up dangling Docker images
    //             sh "docker image prune -f"
    //         }
    //     }
    // }
}
