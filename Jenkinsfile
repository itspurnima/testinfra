pipeline{
    agent any
    stages{
        stage('scm checkout'){
            steps{
            script{
                   currentBuild.displayName="php"
                }
                echo "Getting the code from git"
                git branch: 'main', url: 'https://github.com/itspurnima/testinfra.git'
            }
        }
            stage('create docker image'){
                steps{
                sh 'docker build -t sampletest .'
            }
            }
        }
    }
