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
                WEB_HOST_IP = '165.227.8.12'
                WEB_HOST_USER = 'webmaster'
                WEB_HOST_PATH = '/var/www/html'
                SSH_KEY = credentials('webserver-ssh-key')
            }

            steps {
                script {
                    def remote = [:]
                    remote.name = "Webserver"
                    remote.host = "${WEB_HOST_IP}"
                    remote.user = "${WEB_HOST_USER}"
                    remote.identity = "${SSH_KEY}"
                    remote.allowAnyHosts = true
                }

                sshPut(remote: remote, from: "public/*", into: "${WEB_HOST_PATH}")
            }
        }
    }
}
