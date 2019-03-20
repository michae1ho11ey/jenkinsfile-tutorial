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
                sh 'ls'
                sh 'hugo'
                sh 'ls'
            }
        }
    }
}