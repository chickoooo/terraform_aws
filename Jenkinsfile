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
            
            withCredentials([[
                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
            ]])
            
            {
                powershell """    
                        terraform init
                        terraform plan -var-file codex_aws_vars.tfvars
                        terraform apply -var-file codex_aws_vars.tfvars --auto-approve
                   """
            }
        }
        
        
    }
    
}
