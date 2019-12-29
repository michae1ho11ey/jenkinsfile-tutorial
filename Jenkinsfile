pipeline {
    agent none

   options {
        skipDefaultCheckout()
    }

    stages {
        stage('Grab Code') {
            agent any

            steps {
                checkout scm
            }
        }

        stage('Build the Site') {
            agent any

            steps {
                sh 'hugo'
            }
        }
    }
}
