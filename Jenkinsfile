pipeline{
    agent any
    stages{
        stage('scm checkout'){
            stepes{
            script{
                   currentBuild.displayName="php"
                }
                echo "Getting the code from git"
                git branch: 'test', url: 'https://github.com/itspurnima/testinfra.git'
            }
        }
            stage('create docker image'){
                steps{
                bat 'docker build -t sampletest .'
            }
            }
        }
    }
