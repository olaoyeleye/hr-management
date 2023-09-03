pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID=credentials('id')
        AWS_SECRET_ACCESS_KEY=credentials('key')
        DOCKERHUB_CREDENTIALS_USER=credentials('USER')
        DOCKERHUB_CREDENTIALS_PSW=credentials('PASSWORD')
        DOCKER_REGISTRY=credentials('DOCKER_REGISTRY')
        
    }
//docker login -u $DOCKERHUB_CREDENTIALS_USER -p $DOCKERHUB_CREDENTIALS_PSW
    stages {
       
        stage ("stage 1 - download terraform code from GIT"){
            steps {
                echo "This is stage 1, where we download base_infrastructure from git"
                sh '''
                   mkdir jenkins
                   cd jenkins
                   git clone https://github.com/olaoyeleye/hr-management.git
                   '''
            }
        }
        stage ("stage 2 - terraform init"){
            steps {
                echo "This is stage 2, where we do terraform init"
                sh '''
                   cd jenkins
                   cd hr-management
                   cd base_infrastructure
                   terraform init --backend-config=../env/dev/backend.tfvars           
                  
                   '''
            }
        }
        stage ("stage 3 - Terraform apply - infrastructure creation"){
            steps {
                echo "This is stage 3, where we do terraform apply"
                sh '''
                   cd jenkins
                   cd hr-management
                   cd base_infrastructure
                   terraform apply --var-file ../env/dev/backend.tfvars --var-file ../env/dev/ec2.tfvars   --auto-approve        
                  
                   '''
            }
        }
        stage ("stage 4 - hrapp download from techbleat"){
            steps {
                echo "This is stage 4, where we do hrapp download"
                sh '''
                   cd jenkins
                   cd hr-management 
                   git clone https://github.com/techbleat/hrapp           
                  
                   '''
            }
        }
        stage ("stage 5 - docker build"){
            steps {
                echo "This is stage 5, where we do docker build"
                sh '''
                   cd jenkins
                   cd hr-management
                   cd hrapp

                   docker build -t hrapp .           
                  
                   '''
            }
        }
        stage ("stage 6 - Dockerhub login"){
            steps {
                echo "This is stage 6, where i log in into dockerhub account"
                sh '''
              docker login -u $DOCKERHUB_CREDENTIALS_USER -p $DOCKERHUB_CREDENTIALS_PSW 
                   '''
            }
        }
        
        stage ("stage 7 - Dockerimage tag"){
            steps {
                echo "This is stage 7, where we do docker image tag"
                sh '''
                   cd jenkins
                   cd hr-management
                   cd hrapp
                   docker tag hrapp japostina/hrapp          
                  
                   '''
            }
        }
        stage ("stage 8 - Docker push"){
            steps {
                echo "This is stage 8, where we do docker push"
                sh '''
                   cd jenkins
                   cd hr-management
                   cd hrapp
                   docker push japostina/hrapp:v1         
                  
                   '''
            }
        } 
        stage ("stage 8a - pwd"){
            steps {
                echo "checker"
                sh ''' pwd
                '''
            }
        }
        stage ("stage 9 - Ansible to run hrapp on remote nodes"){
            steps {
                echo "This is stage 9, where we create hrapp container"
                sh '''
                  cd jenkins
                  cd hr-management
                  cd base_infrastructure
                  ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i inventory --key-file hr-management-key.pem docker-from-scratch.yml -u vagrant
                  
                   '''
                   /                  ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i /repository/project/my_hrapp/hr-management/base_infrastructure/inventory --key-file /repository/project/my_hrapp/hr-management/base_infrastructure/hr-management-key.pem /repository/project/my_hrapp/hr-management/base_infrastructure/docker-from-scratch.yml -u vagrant
                  
            }
        }
    }
    post {
        always {
            echo 'Job done'
            deleteDir()
        }
        success {
            echo 'Build is successful'
        }
        failure {
            echo 'This has failed'
        }
    }
    
}
      
      