pipeline{
    agent any
    stages{
        stage('scm checkout'){
            script{
                   currentBuild.displayName="php"
                }
                echo "Getting the code from git"
                git branch: 'test', url: 'https://github.com/itspurnima/test.git'
            }
            stage('create docker image'){
                bat 'docker build -t sampletest .'
            }
        }
    }
