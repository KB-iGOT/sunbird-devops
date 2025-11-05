pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                echo "Running build..."
                // your build and test steps
            }
        }
    }

    post {
        success {
            sh '''
            ssh gerrit "gerrit review ${GERRIT_CHANGE_NUMBER},${GERRIT_PATCHSET_NUMBER} --verified +1 --message 'CI Passed ✅'"
            '''
        }
        failure {
            sh '''
            ssh gerrit "gerrit review ${GERRIT_CHANGE_NUMBER},${GERRIT_PATCHSET_NUMBER} --verified -1 --message 'CI Failed ❌'"
            '''
        }
    }
}
