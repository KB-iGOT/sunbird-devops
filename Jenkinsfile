pipeline {
    agent any

    environment {
        // Extract Jira ID from PR title like "ABC-123 Fix login"
        JIRA_ID = sh(
            script: "echo ${ghprbPullTitle} | grep -oE '[A-Z]+-[0-9]+' || true",
            returnStdout: true
        ).trim()

        // Gerrit vars should already come from your webhook or manual export
        GERRIT_USER = "jenkins"
    }

    stages {
        stage('Build & Test') {
            steps {
                echo "Building PR with Jira Ticket: ${JIRA_ID}"
                // your build steps here
            }
        }
    }

    post {
        success {
            echo "Build Success ✅ Updating Gerrit & Jira"

            sh """
            ssh gerrit "gerrit review ${GERRIT_CHANGE_NUMBER},${GERRIT_PATCHSET_NUMBER} --verified +1 --message 'CI Passed ✅ (Jira: ${JIRA_ID})'"
            """

            // will use Jira transition next...
        }

        failure {
            echo "Build Failed ❌ Updating Gerrit & Jira"

            sh """
            ssh gerrit "gerrit review ${GERRIT_CHANGE_NUMBER},${GERRIT_PATCHSET_NUMBER} --verified -1 --message 'CI Failed ❌ (Jira: ${JIRA_ID})'"
            """
        }
    }
}
