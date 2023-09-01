pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID=credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY=credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage ("stage 1"){
            steps {
                echo "This is stage one, where we download base_infrastructure from git"
                sh '''
                   mkdir jenkins
                   cd jenkins
                   git clone https://github.com/olaoyeleye/hr-management.git
                   '''
            }
        }
        stage ("stateg 2"){
            steps {
                echo "This is stage two, where we we apply terraform"
                sh '''
                cd jenkins
                cd hr-management
                cd base_infrastructure
                terraform init --backend-config=../env/dev/backend.tfvars
                
                '''
            }
        }
        stage ("stage 3"){
            steps {
                echo "This is stage three where we use terraform apply"
                sh '''
                cd jenkins
                cd hr-management
                cd base_infrastructure
                terraform apply -var-file ../env/dev/backend.tfvars -var-file ../env/dev/ec2.tfvars --auto-approve
                
                '''
            }
        }
        stage ("stage 4"){
            steps {
                echo "This is stage four where we connect to git to download hrapp"
                sh '''
                mkdir app_folder
                cd app_folder
                git clone https://github.com/techbleat/hrapp
                '''
            }
        }
        stage ("stage 5"){
            steps {
                echo "This is stage five where we we try to build the Dockerfile"
                sh '''
                cd app_folder
                cd hrapp
                docker build -t hrapp .
                
                '''
            }
        }
        stage ("stage 6"){
            steps {
                echo "This is stage six where we push the image into docker  hub"
                sh '''
                cd app_folder
                cd hrapp
                docker tag hrapp japostina/hrapp:v1
                docker push japostina/hrapp:tagname
                
                '''
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
