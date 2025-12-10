pipeline {
  agent any

  environment {
    DOCKER_USER = 'your_dockerhub_username'
    DOCKERHUB_CREDS = 'dockerhub-creds'
  }

  stages {
    stage('Checkout Code') {
      steps { checkout scm }
    }

    stage('Select Repo Based on Branch') {
      steps {
        script {
          def branch = env.BRANCH_NAME
          if (branch == 'master') {
            env.TARGET_REPO = "${DOCKER_USER}/prod"
          } else {
            env.TARGET_REPO = "${DOCKER_USER}/dev"
          }
          env.IMAGE_TAG = "${env.BUILD_NUMBER}"
          env.IMAGE_FULL = "${env.TARGET_REPO}:${env.IMAGE_TAG}"
        }
      }
    }

    stage('Build Image') {
      steps {
        sh "docker build -t ${IMAGE_FULL} ."
      }
    }

    stage('Push Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDS}",
          usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh """
            echo "$PASS" | docker login -u "$USER" --password-stdin
            docker push ${IMAGE_FULL}
          """
        }
      }
    }
  }
}

