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

        stage('Ready to Deploy?') {
            agent none

            steps {
                input 'Deploy the site?'
            }
        }

        stage('Deploy to Prod') {
            agent any
            environment {
                WEB_HOST_PATH = '/var/www/html/'
            }

            steps {
                sh "rsync -avhP public/ ${WEB_HOST_PATH}"
            }
        }
    }
}
