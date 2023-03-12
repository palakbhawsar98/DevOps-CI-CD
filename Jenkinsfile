pipeline {
    agent any
 
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
  
     stage('Build image') {
       dockerImage = docker.build("palakbhawsar/javawebapp:latest")
    }
    
 stage('Push image') {
        withDockerRegistry([ credentialsId: "docker-hub-cred", url: "" ]) {
        dockerImage.push()
        }
    }   
      
    }
 }
