pipeline{
    agent any
    options{
        timestamps()
    }
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    
    stages{
        stage('Git Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/chickoooo/terraform_aws.git'
            }
        }
        
        stage('Terraform Installation'){
            steps
            {
                powershell """    
                        terraform init
                        terraform plan
                        terraform apply --auto-approve
                   """
            }
        }
        
        
    }
    
}
