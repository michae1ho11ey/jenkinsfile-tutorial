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
    }
}