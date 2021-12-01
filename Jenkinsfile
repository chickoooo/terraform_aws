pipeline{
    agent any
    options{
        timestamps()
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
