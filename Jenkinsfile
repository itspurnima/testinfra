List<String> CHOICES = [];
pipeline{
    agent any
    stages{
        
        //stage('user input'){
        //    steps{
           //     script{
             //       CHOICES=["dev","test","prod"]
              //      env.YourTag = input  message: 'What are we deploying today?',ok : 'Deploy',id :'tag_id',
               //                         parameters:[choice(choices: CHOICES, description: 'Select a tag for this build', name: 'TAG')]
               // }
         //   }
       // }
        stage('scm checkout'){
            when { branch 'InfraAws' }
            steps{
                echo "in dev env----------"
                script{
                   currentBuild.displayName="Infra"
                   bat 'STAGE_NAME=test'
                }
                echo "Getting the code from git"
                git branch: 'InfraAws', url: 'https://github.com/itspurnima/testinfra.git'
            }
        }
        stage('terraform init and plan'){
            steps{
                echo "tf init and plan"
                withAWS(credentials: 'jenkin-test-user', region: 'us-west-1') {
                bat 'terraform init'
                bat 'terraform plan'
                bat 'terraform apply -input=false -auto-approve'
            }
            }
        }
        stage('terraform destroy'){
            steps{
                echo "tf destroy"
                withAWS(credentials: 'jenkin-test-user', region: 'us-west-1') {
                bat 'terraform destroy -auto-approve'
                } 
            }
        }
    }
    stages{
        
        stage('scm checkout'){
            when { branch 'dev' }
            steps{
                echo "in test env----------"
                script{
                   currentBuild.displayName="Infra"
                   bat 'STAGE_NAME=test'
                }
                echo "Getting the code from git"
                git branch: 'InfraAws', url: 'https://github.com/itspurnima/testinfra.git'
            }
        }
        stage('terraform init and plan'){
            steps{
                echo "tf init and plan"
                withAWS(credentials: 'jenkin-test-user', region: 'us-east-2') {
                bat 'terraform init'
                bat 'terraform plan'
                bat 'terraform apply -input=false -auto-approve'
            }
            }
        }
        stage('terraform destroy'){
            steps{
                echo "tf destroy"
                withAWS(credentials: 'jenkin-test-user', region: 'us-east-2') {
                bat 'terraform destroy -auto-approve'
                } 
            }
        }
    }
    
}