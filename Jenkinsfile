pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                sh 'echo Running tests'
                # replace below with your build
                sh 'make test || exit 1'
            }
        }

        stage('Lint') {
            steps {
                sh 'echo Linting...'
                # e.g. npm run lint OR flake8 etc.
            }
        }
    }

    post {
        success {
            githubNotify context: 'CI', status: 'SUCCESS', description: 'PR passed'
        }
        failure {
            githubNotify context: 'CI', status: 'FAILURE', description: 'PR failed'
        }
    }
}
