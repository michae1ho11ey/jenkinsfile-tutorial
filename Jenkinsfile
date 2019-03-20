pipeline {
    agent none

    stages {
        stage('Grab the code') {
            agent any

            steps {
                checkout scm
            }
        }

        stage('Build the site') {
            agent any
            steps {
                sh 'hugo'
            }
        }

        stage('Deploy to Stage?') {
            agent none

            steps {
                input 'Do you want to deploy to stage?'
            }
        }

        stage('Deploy to stage') {
            agent any
            environment {
                SUPER_SECRET = 'Foo'
            }

            steps {
                echo "The Password is: ${SUPER_SECRET}"
            }
        }
    }
}