pipeline {
    agent any
    
    environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-hub-cred')
	}
 
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'main', url: 'https://github.com/palakbhawsar98/JavaWebApp'
             
          }
        }
  stage('Maven Build') {
           steps {
             
                sh 'mvn clean install'             
          }
      
         post {
                success {
                    archiveArtifacts artifacts: '**/target/*.jar'
                }
            }
        }
  stage('Maven Test') {
           steps {
             
                sh 'mvn test'             
          }
        }
  
     stage('Code Analysis') {
          
		  environment {
             scannerHome = tool 'sonar4.8'
          }

          steps {
            withSonarQubeEnv('sonar') {
               sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=web-services \
                   -Dsonar.projectName=web-services-repo \
                   -Dsonar.projectVersion=1.0 \
                   -Dsonar.sources=src/ \
                   -Dsonar.java.binaries=target/'''
            }
          }
        }	 
     stage('Build Docker Image') {
         
           steps {
              
                sh 'docker build -t javawebapp:latest .' 
                sh 'docker tag javawebapp palakbhawsar/javawebapp:latest'     
          }
        }
     
   stage('Login to DockerHub') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
	
    stage('Push Image to dockerHUb') {
      steps {
        sh 'docker push palakbhawsar/javawebapp:latest'
      }
	  post {
    always {
      sh 'docker logout'
    }
  }
    
	}
	
	
  }
  
       
   
      
 }
 
