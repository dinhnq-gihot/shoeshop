pipeline {
    agent {
        label 'deployment-server'
    }

    stages {
        stage('whoami') {
            steps {
                sh(script: """ whoami; """, label: "first stage")
            }
        }
    }
}