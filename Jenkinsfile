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
                echo "Building PR: ${CHANGE_ID}"
                echo "Jira Ticket: ${JIRA_ID}"
                // your build steps here
            }
        }
    }

    post {
        success {
            sh """
            ssh -i /var/lib/jenkins/.ssh/gerrit_jenkins jenkins@10.175.2.49 \
            "gerrit review ${CHANGE_ID} --verified +1 --message 'CI Passed ✅ Jira: ${JIRA_ID}'"
            """
        }

        failure {
            sh """
            ssh -i /var/lib/jenkins/.ssh/gerrit_jenkins jenkins@10.175.2.49 \
            "gerrit review ${CHANGE_ID} --verified -1 --message 'CI Failed ❌ Jira: ${JIRA_ID}'"
            """
        }
    }
}


