pipeline{
    agent any
    stages{
        stage('scm checkout'){
            steps{
                script{
                   currentBuild.displayName="Infra"
                }
                echo "Getting the code from git"
                git branch: 'InfraAws', url: 'https://github.com/itspurnima/testinfra.git'
            }
        }
        stage('terraform init and plan'){
            steps{
                echo "tf init and plan"
                withAWS(credentials: 'jenkin-test-user', region: 'us-east-1') {
                bat 'terraform init'
                bat 'terraform plan'
                bat 'terraform apply -input=false -auto-approve'
            }
            }
        }
        stage('terraform destroy'){
            steps{
                echo "tf destroy"
                withAWS(credentials: 'jenkin-test-user', region: 'us-east-1') {
                bat 'terraform destroy -auto-approve'
                } 
            }
        }
    }
}